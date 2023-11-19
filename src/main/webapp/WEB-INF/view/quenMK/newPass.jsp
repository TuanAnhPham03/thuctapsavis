<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Đổi mật khẩu</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body onload="${alert}">
<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <h3 class="mb-5">Tạo Mới Mật Khẩu</h3>
                        <form action="/quen-mat-khau/tao-moi-mat-khau" method="post"  onsubmit="return confirm('Tạo mới mật khẩu?')">
                            <div class="form-outline mb-4">
                                <input name="passNew" type="password" placeholder="Nhập Password mới" class="form-control form-control-lg"/>
                                <p style="color: red">${errorNew}</p>
                            </div>
                            <div class="form-outline mb-4">
                                <input name="confirmPass" type="password" placeholder="Nhập lại Password Mới" class="form-control form-control-lg" />
                                <p style="color: red">${errorConfirm}</p>
                            </div>
                            <p style="color:red;">${error}</p>
                            <button class="btn btn-primary btn-lg btn-block col-12" type="submit">Xác nhận</button>
                        </form>
                        <hr class="my-4">
                        <a role="button" href="/quen-mat-khau"
                           class="btn btn-block btn-lg col-12 text-primary border-primary">
                            Cancel</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>