<?php

namespace App\Http\Controllers\Client;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Stripe\Charge;
use Stripe\Stripe;
use Stripe\Customer;
use Illuminate\Support\Facades\Session;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\Voucher;
use Illuminate\Support\Facades\Auth;

class OrderController extends Controller
{
    public function shopping_cart() {
        return view('client.shopping-cart');
    }

    public function checkout(Request $request) {
        $data = $request->all();
        if (empty($data['shop_id'])) {
            toastr()->error('Vui lòng chọn sản phẩm bạn muốn thanh toán');
            return redirect()->back();
        }
        $shopIds = explode(',',$data['shop_id']);
        return view('client.checkout', compact('shopIds'));
    }

    /**
     * Pay
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function pay(Request $request){
        $shopIds = explode(',', $request->shop_id);
        if(!Session::has('cart')){
            return view('cart');
        }
        $oldCart = Session::get('cart');
        $cart = new Cart($oldCart);
        Stripe::setApiKey('sk_test_51NaiZNFPNyoDQ5DJt6TYPU9L76YiGDwF3aszWqMY8kyjREwgecGR1aP1cagpmwmNk7BZUo5rr3aAv1YMQP4YlHUm00krFNdL7T');
        $customer = new Customer();
        $customerDetailsAry = array(
            'email' => $request->input('email'),
            'source' => $request->input('stripeToken')
        );
        $customerDetails = $customer->create($customerDetailsAry);
        try {
            foreach($shopIds as $shopId){
                $total = 0;
                foreach ($cart->items as $row) {
                    $product = Product::find($row['item']['id']);
                    if ($product->shop_id == $shopId) {
                        $total += $row['qty'] * $product->price;
                    }
                }
                if (isset($request->voucher)) {
                    $voucher = Voucher::where('code',$request->voucher)->first();
                    Voucher::where('code',$request->voucher)->update(['qty' => $voucher->qty -1]);
                    $charge = Charge::create(array(
                        "customer" => $customerDetails->id,
                        "amount" => $total - $voucher->price,
                        "currency" => $request->input('currency_code'),
                    ));
                } else {
                    $charge = Charge::create(array(
                        "customer" => $customerDetails->id,
                        "amount" => $total,
                        "currency" => $request->input('currency_code'),
                    ));
                }
                $order = Order::create([
                    'id'      => $charge->id,
                    'user_id' => Auth::user()->id,
                    'total'   => $total,
                    'address' => $request->address,
                    'voucher_code' => $request->voucher,
                    'shop_id' => $shopId
                ]);
                foreach($cart->items as $row) {
                    $product = Product::find($row['item']['id']);
                    if ($product->shop_id == $shopId) {
                        OrderDetail::create([
                            'product_id' => $row['item']['id'],
                            'price' => $row['price'],
                            'qty' => $row['qty'],
                            'order_id' => $charge->id
                        ]);
                        Product::where('id',$row['item']['id'])->update(['qty' => $product['qty'] - $row['qty']]);
                        Product::where('id',$row['item']['id'])->update(['qty_buy' => $product['qty_buy'] + $row['qty']]);
                        if ($product->qty <= 0) {
                            Product::where('id',$row['item']['id'])->update(['status' => 0]);
                        }
                    }
                }
            }
        } catch (\Exception $e) {
            return redirect()->route('client.checkout')->with('invalid', $e->getMessage());
        }
        $cart->handleCart($shopIds);
        Session::put('cart',$cart);
        return redirect()->route('thank');
    }

    public function thank()
    {
        return view('client.thank');
    }

    public function myOrder()
    {
        $orders = Order::where('user_id',Auth::user()->id)->get();
        return view('client.my-order',compact('orders'));
    }

    public function showMyOrder($id)
    {
        $orders = OrderDetail::where('order_id',$id)
        ->join('products','products.id','=','orders_detail.product_id')
        ->get(['orders_detail.*','products.name','products.price']);
        return view('client.show-my-order',compact('orders','id'));
    }

    public function checkVoucher(Request $request)
    {
        $voucher = Voucher::whereIn('shop_id', explode(',',$request->shop_id))->where('code',$request->code)->first();
        if (!is_null($voucher)) {
            return response()->json([
                'status' => 200,
                'total' => $request->total - $voucher->price,
                'code' => $request->code
            ]);
        } else {
            return response()->json([
                'status' => 403,
                'msg'   => 'Voucher không tồn tại',
                'total' => $request->total
            ]);
        }
    }
}
