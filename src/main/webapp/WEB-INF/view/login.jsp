<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Đăng Nhập</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body onload="${alert}">
<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <h3 class="mb-5">Đăng Nhập</h3>
                        <form action="/login" method="post">
                        <div class="form-outline mb-4">
                            <input type="text" name="userName" placeholder="Username" class="form-control form-control-lg" />
                        </div>

                        <div class="form-outline mb-4">
                            <input type="password" name="passWord" placeholder="Password" class="form-control form-control-lg" />
                        </div>
                        <p style="color:red;">${error}</p>
                        <button class="btn btn-primary btn-lg btn-block col-12" type="submit">Đăng Nhập</button>
                            <a role="button" href="/quen-mat-khau" >Quên Mật Khẩu</a>
                        </form>
                        <hr class="my-4">
                        <a role="button" href="/dang-ky" class="btn btn-block btn-lg col-12 text-primary border-primary" >
                            Đăng Ký</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>