@extends('admin.layouts.index')

@section('title', 'Cập nhật danh mục')

@section('content')
    <h1 class="h3 mb-2 text-gray-800">Cập nhật danh mục</h1>

    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('category.edit', ['id' => $category->id]) }}" method="POST" enctype="multipart/form-data">

                @csrf

                <div class="form-group">
                    <label for="category-name">Tên danh mục: <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" placeholder="Nhập tên danh mục" id="category-name"
                        name="category-name" value="{{ $category->name }}" required>
                </div>
                <div class="form-group">
                    <label for="image">Chọn hình ảnh:</label>
                    <div class="custom-file">
                        <input type="file" id="image" name="image" accept=".png,.gif,.jpg,.jpeg" />
                    </div>
                </div>
                <div class="image-preview mb-4" id="imagePreview">
                    <img src="{{ asset($category->image_path) }}" alt="Image Preview" class="image-preview__image"
                        style="display:block;" />
                    <span class="image-preview__default-text" style="display:none;">Hình ảnh</span>
                </div>
                <br />
                <button type="submit" class="btn btn-primary">Cập nhật</button>
            </form>
        </div>
    </div>
@endsection
