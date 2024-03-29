@extends('admin.layouts.index')

@section('title', 'Danh sách hãng')

@section('content')
    <h1 class="h3 mb-2 text-gray-800">Hãng sản phẩm</h1>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Ảnh hãng</th>
                            <th>Tên hãng</th>
                            <th>Trạng thái</th>
                            <th>Chức năng</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php $count = 1; @endphp
                        @foreach ($brands as $brand)
                            <tr>
                                <td>{{ $count }}</td>
                                <td>
                                    <a href="{{ asset($brand->image) }}" target="_blank"><img src="{{ asset($brand->image) }}"
                                            width=60></a>
                                </td>
                                <td>{{ $brand->name }}</td>
                                <td>{{ $brand->status == 1 ? 'Hiện' : 'Ẩn' }}</td>
                                <td>
                                    <a href="{{ route('brand.delete', ['id' => $brand->id]) }}"
                                        class="btn btn-danger btn-circle btn-sm"
                                        onclick="return confirm('Bạn có muốn xóa hãng này ?')">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                    <a href="{{ route('brand.edit.form', ['id' => $brand->id]) }}"
                                        class="btn btn-primary btn-circle btn-sm">
                                        <i class="fas fa-pen"></i>
                                    </a>
                                    @if ($brand->status == 1)
                                        <a href="{{ route('brand.update.status', ['id' => $brand->id, 'status' => 0]) }}"
                                            onclick="return confirm('Bạn muốn ẩn hãng sản phẩm này ?')"
                                            class="btn btn-danger btn-circle btn-sm">
                                            <i class="fas fa-ban"></i>
                                        </a>
                                    @else
                                        <a href="{{ route('brand.update.status', ['id' => $brand->id, 'status' => 1]) }}"
                                            class="btn btn-success btn-circle btn-sm">
                                            <i class="fas fa-check"></i>
                                        </a>
                                    @endif
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
