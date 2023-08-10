@extends('admin.layouts.index')

@section('title', 'Danh sách phản hồi')

@section('content')
    <h1 class="h3 mb-2 text-gray-800">Phản hồi</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Sản phẩm</th>
                            <th>Người bình luận</th>
                            <th>Nội dung</th>
                            <th>Ngày bình luận</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $count = 1; @endphp
                        @foreach ($replies as $row)
                            <tr>
                                <td>{{ $count }}</td>
                                <td>{{ $row->name }}</td>
                                <td>{{ $row->content }}</td>
                                <td>{{ date('d/m/Y H:i:s', strtotime($row->created_at)) }}</td>
                                <td>
                                    <a href="{{ route('reply.delete',['id' => $row->id]) }}"
                                        class="btn btn-danger btn-circle btn-sm"
                                        onclick="return confirm('Bạn có muốn xóa phản hồi này ?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                            </tr>
                            @php $count++; @endphp
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
