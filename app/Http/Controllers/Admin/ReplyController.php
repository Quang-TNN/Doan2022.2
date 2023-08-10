<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reply;

class ReplyController extends Controller
{
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $reply = Reply::find($id);
        $reply->delete();
        toastr()->success('Xóa thành công');
        return redirect()->back();
    }
}
