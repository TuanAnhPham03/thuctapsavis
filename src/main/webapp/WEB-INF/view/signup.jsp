<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Đăng Ký</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body >
<section class="vh-100" style="background-color: #508bfc;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                <div class="card shadow-2-strong" style="border-radius: 1rem;">
                    <div class="card-body p-5 text-center">

                        <h3 class="mb-5">Đăng Ký</h3>
                        <form:form action="/dang-ky" method="post" id="form" modelAttribute="user" onsubmit="return confirm('Đăng ký?')">
                            <div class="form-outline mb-4">
                                <form:input path="ma" placeholder="Username" cssClass="form-control form-control-lg"/>
                                <form:errors path="ma" cssStyle="color: red" element="p" />
                            </div>
                            <div class="d-flex justify-content-between" style="margin-bottom: 25px">
                                <div class="form-outline mb-4">
                                    <form:input path="ho"  placeholder="Họ" cssClass="form-control form-control-lg"/>
                                    <form:errors path="ho" cssStyle="color: red" element="p" cssClass="text-left col-12"/>
                                </div>
                                <div class="form-outline mb-4">
                                    <form:input path="tenDem"  placeholder="Tên đệm" cssClass="form-control form-control-lg"/>
                                    <form:errors path="tenDem" cssStyle="color: red" element="p" cssClass="text-left col-12"/>
                                </div>
                                <div class="form-outline mb-4">
                                    <form:input path="ten"  placeholder="Tên" cssClass="form-control form-control-lg"/>
                                    <form:errors path="ten" cssStyle="color: red" element="p" cssClass="text-left col-12"/>
                                </div>
                            </div>
                            <div class="form-outline mb-4">
                                <form:input path="email"  placeholder="Email" cssClass="form-control form-control-lg"/>
                                <form:errors path="email" cssStyle="color: red" element="p" cssClass="text-left col-12"/>
                            </div>
                            <div class="form-outline mb-4">
                                <form:input path="matKhau" type="password" id="pass" placeholder="Password" cssClass="form-control form-control-lg"/>
                                <form:errors path="matKhau" cssStyle="color: red" element="p" cssClass="text-left col-12"/>
                            </div>
                            <div class="form-outline mb-4">
                                <input name="confirmPass"  type="password" placeholder="Nhập lại Password" class="form-control form-control-lg" value="${user.matKhau}"/>
                                <p style="color: red">${errorConfirm}</p>
                            </div>
                            <div>
                                <label>Vai trò: </label>
                                    <form:radiobuttons path="vaiTro" items="${roles}" itemLabel="ten" cssClass="role" cssStyle="margin-left: 30px"/>
                            </div>

                            <p style="color:red;">${error}</p>
                            <button class="btn btn-primary btn-lg btn-block col-12" type="submit">Đăng ký</button>
                        </form:form>
                        <hr class="my-4">
                        <a role="button" href="/login" class="btn btn-block btn-lg col-12 text-primary border-primary">
                            Đăng Nhập</a>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
<script>
 document.getElementsByClassName("role")[0].checked = true;
</script>
</html>