@extends('client.layouts.template')

@section('css')
    <link rel="stylesheet" href="{{ asset('client/css/comment.css') }}">
@stop

@section('main')

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="{{  asset('client/img/breadcrumb.jpg') }}">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text bg-dark">
                    <h2>{{ $product->name }}</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                            src="{{  asset($product->image_path) }}" alt="{{ $product->name }}">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>{{ $product->name }}</h3>
                    <div class="product__details__price">{{ number_format($product->price,-3,',',',') }} VND</div>
                    @if (!Auth::guard('admin')->check())
                      <a href="javascript:void(0)" onclick="addToCart({{ $product->id }});" class="primary-btn">THÊM GIỎ HÀNG</a> 
                    @endif
                    @if (Auth::check())
                      @if (!in_array($product->id,$wishlist))
                        <a href="{{ route('client.add.wishlist',['id' => $product->id]) }}"><button type="button" class="btn btn-danger" style="padding:0.84rem;">YÊU THÍCH</button></a>
                      @else
                        <a href="{{ route('client.add.wishlist',['id' => $product->id]) }}"><button type="button" class="btn btn-secondary" style="padding:0.84rem;" disabled>ĐÃ YÊU THÍCH</button></a>
                      @endif
                    @endif
                    <ul>
                        <li><b>Danh mục</b> <span>{{ $product->cate_title }}</span></li>
                        <li><b>Hãng sản phẩm</b> <span>{{ $product->brand_title }}</span></li>
                        <li><b>Nhà cung cấp</b> <span>{{ $product->supplier_title }}</span></li>
                        <li><b>Trạng thái</b> <span>{{ $product->qty > 0 ? 'Còn hàng' : 'Hết hàng' }}</span></li>
                        <li><b>Lượt xem</b> <span>{{ $product->view }}</span></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-12">
              <a href="{{ route('shop.detail', ['id' => $product->shop_id]) }}">
                <div class="d-flex p-4" style="background-color: #7f7e7e;">
                  <img src="{{ asset(\App\Models\Shop::find($product->shop_id)->image) }}" class="img-thumbnail" width="120"/>
                  <div class="ml-4 text-white">
                      <span style="font-weight:bold;font-size:24px;">{{ \App\Models\Shop::find($product->shop_id)->name }}</span>
                      <p><i>Chủ gian hàng: {{ \App\Models\Admin::find(\App\Models\Shop::find($product->shop_id)->admin_id)->name }}</i></p>
                      <p><i>Số điện thoại: {{ \App\Models\Shop::find($product->shop_id)->phone }}</i></p>
                      <p><i>Địa chỉ: {{ \App\Models\Shop::find($product->shop_id)->address }}</i></p>
                  </div>
                </div>
              </a>
            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active">Mô tả sản phẩm</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <p>{!! $product->description !!}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Start comment-sec Area -->
<section class="comment-sec-area pt-80 pb-80">
    <div class="container">
      <div class="row flex-column">
        <h5 class="text-uppercase pb-80">{{ $comments->count() }} bình luận</h5>
        <br />
      <div class="comment">
            @foreach ($comments as $comment)
              <div class="comment-list comment-container">
                <div class="single-comment justify-content-between d-flex">
                  <div class="user justify-content-between d-flex">
                    <div class="thumb">
                      <img src="{{ asset('client/img/people.png') }}" alt="Avatar" width="50px">
                    </div>
                    <div class="desc mb-4">
                      <h5><a href="javascript:void(0)">{{ $comment->name }}</a></h5>
                      <p class="date">{{ date('d/m/Y H:i:s', strtotime($comment->created_at)) }}</p>
                      <p class="comment">
                        {{ $comment->content }}
                      </p>
                      @if (Auth::check() || (Auth::guard('admin')->check() && Auth::guard('admin')->user()->role == 2))
                        <a class="text-primary reply" cid="{{ $comment->id }}" name_a="{{ Auth::check() ? Auth::user()->name : Auth::guard('admin')->user()->name }}" token="{{ csrf_token() }}">Phản hồi</a>
                        <div class="row flex-row d-flex reply-form"></div>
                      @endif
                    <!-- show reply -->
                    @foreach ($replies as $reply)
                      @if ($reply->comment_id === $comment->id)
                        <div class="comment-list left-padding">
                          <div class="single-comment justify-content-between d-flex mt-4 mb-4" >
                            <div class="user justify-content-between d-flex">
                              <div class="thumb">
                                <img src="{{ asset('client/img/people.png') }}" alt="Avatar" width="50px"/>
                              </div>
                              <div class="desc">
                                <h5><a href="javascript:void(0)">{{ $reply->name }}</a></h5>
                                <p class="date">{{ date('d/m/Y H:i:s', strtotime($reply->created_at)) }}</p>
                                <p class="comment">
                                  {{ $reply->content }}
                                </p>
                                @if (Auth::check() || (Auth::guard('admin')->check() && Auth::guard('admin')->user()->role == 2))
                                  <a class="text-primary reply-to-reply" rid="{{ $reply->comment_id }}" rname="{{ Auth::check() ? Auth::user()->name : Auth::guard('admin')->user()->name }}" token="{{ csrf_token() }}">Phản hồi</a>
                                  <div class="row flex-row d-flex reply-to-reply-form"></div>
                                @endif
                              </div>
                            </div>
                          </div>
                        </div>
                      @endif
                    @endforeach
                    <!-- end reply -->
                  </div>
                </div>
              </div>
            @endforeach
        </div>
      </div>
    </div>
  </section>
  <!-- End comment-sec Area -->

  <!-- Start commentform Area -->
  @if (Auth::check())
    <section class="commentform-area pb-120 pt-80 mb-100">
      <div class="container">
          <h5 class="text-uppercas pb-50">Bình luận</h5>
          <div class="row flex-row d-flex">
              <div class="col-lg-12">
                  <form action="{{ route('add.comment') }}" method="POST">
                      @csrf
                      <input type="hidden" name="user_id" value="{{ Auth::user()->id }}" />
                      <input type="hidden" name="product_id" value="{{ $product->id }}" />
                      <textarea
                      class="form-control mb-10"
                      name="message"
                      cols="5"
                      rows="4"
                      placeholder="Nhập bình luận"
                      required
                      ></textarea>
                      <button type="submit" class="primary-btn mt-20" href="#">Bình luận</button>
                  </form>
              </div>
          </div>
      </div>
    </section> 
  @endif
<!-- End commentform Area -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>Sản phẩm liên quan</h2>
                </div>
            </div>
        </div>
        <div class="row">
            @foreach ($products as $product)
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="{{  asset($product->image_path) }}">
                          @if (!Auth::guard('admin')->check())
                            <ul class="product__item__pic__hover">
                                <li><a href="javascript:void(0)" onclick="addToCart({{ $product->id }});"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                          @endif
                        </div>
                        <div class="product__item__text">
                            <h6><a href="{{ route('client.product.detail', ['id' => $product->id]) }}">{{ $product->name }}</a></h6>
                            <h5>{{ number_format($product->price,-3,',',',') }} VND</h5>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
<!-- Related Product Section End -->
@stop