@extends('admin.layouts.index')

@section('title', 'Danh sách bình luận')

@section('content')
    <h1 class="h3 mb-2 text-gray-800">Bình luận</h1>

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
                        @foreach ($comments as $row)
                            <tr>
                                <td>{{ $count }}</td>
                                <td>{{ $row->product }}</td>
                                <td>{{ $row->user }}</td>
                                <td>{{ $row->content }}</td>
                                <td>{{ date('d/m/Y H:i:s', strtotime($row->created_at)) }}</td>
                                <td>
                                    <a href="{{ route('comment.delete',['id' => $row->id]) }}"
                                        class="btn btn-danger btn-circle btn-sm"
                                        onclick="return confirm('Bạn có muốn xóa bình luận này ?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                    <a href="{{ route('comment.show', ['id' => $row->id]) }}"
                                        class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-eye"></i>
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
