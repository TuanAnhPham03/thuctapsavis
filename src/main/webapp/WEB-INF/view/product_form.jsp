<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="/css/icomoon.css">
    <!-- Ion Icon Fonts-->
    <link rel="stylesheet" href="/css/ionicons.min.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- Magnific Popup -->
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <!-- Flexslider  -->
    <link rel="stylesheet" href="/css/flexslider.css">

    <!-- Owl Carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">

    <!-- Date Picker -->
    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <!-- Flaticons  -->
    <link rel="stylesheet" href="/fonts/flaticon/font/flaticon.css">

    <!-- Theme style  -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0//css/all.min.css">

</head>
<style>
    #nameImg {
        border: 0px;
        background-color: #f5f5f5;
        width: 100%;
        text-align: center;
        font-style: italic;
    }
</style>
<body onload="load()">
<jsp:include page="navbar.jsp"></jsp:include>
<div class="colorlib-product">
    <div class="container">
        <a href="/sandal-admin" role="button" class="btn btn-danger" style="color: white">Trở về</a>
        <br>
        <br>
        <form:form action="${url}" method="post" modelAttribute="SanPham" cssClass="colorlib-form" onsubmit="return confirm('${button} sản phẩm')">
            <div class="row">
                <div class="col-lg-3 col-xl-3">
                    <div class="row text-center">
                        <div class="form-group">
                            <input class="form-control form-control-sm" id="upload" type="file" onchange="loadImg()"/>
                        </div>
                        <div><img src="" alt="" width="90%" id="imgUser">
                        </div>
                        <form:input path="anh" cssClass="" id="nameImg" readonly="true"/>

                        <br>
                        <div class="d-flex justify-content-center" style="width: 100%;">
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-xl-9" style="border-left: 1px solid rgb(140, 139, 139);">
                    <h2 class="text-center">Thông Tin Sản Phẩm</h2>

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mã</label>
                                <form:input path="ma" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tên</label>
                                <form:input path="ten" cssClass="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Giá Bán</label>
                                <form:input path="giaBan" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Nhà Sản Xuất</label>
                                <div class="form-field">
                                    <i class="icon icon-arrow-down3"></i>
                                    <form:select path="nsx" cssClass="form-control">
                                        <form:options items="${nsx}" itemValue="id" itemLabel="ten"></form:options>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Giới Tính</label>
                                <div class="form-field">
                                    <i class="icon icon-arrow-down3"></i>
                                    <form:select path="danhMuc" cssClass="form-control">
                                        <form:options items="${danhMuc}" itemValue="id" itemLabel="ten"></form:options>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Chất Liệu</label>
                                <form:input path="chatLieu" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label style="margin-right: 50px;">Trạng Thái</label>
                                <div style="margin-left: 100px;">
                                    <form:radiobutton path="trangThai" label="Ẩn" value="0"/>
                                    <form:radiobutton path="trangThai" label="Hiển Thị" value="1"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Mô Tả</label>
                                <form:input path="moTa" cssClass="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary" style="margin-left: 84%;" type="submit">${button}</button>
                    </div>
                </div>
            </div>
        </form:form>

    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
<!-- jQuery -->
<script src="/js/jquery.min.js"></script>
<!-- popper -->
<script src="/js/popper.min.js"></script>
<!-- bootstrap 4.1 -->
<script src="/js/bootstrap.min.js"></script>
<!-- jQuery easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Flexslider -->
<script src="/js/jquery.flexslider-min.js"></script>
<!-- Owl carousel -->
<script src="/js/owl.carousel.min.js"></script>
<!-- Magnific Popup -->
<script src="/js/jquery.magnific-popup.min.js"></script>
<script src="/js/magnific-popup-options.js"></script>
<!-- Date Picker -->
<script src="/js/bootstrap-datepicker.js"></script>
<!-- Stellar Parallax -->
<script src="/js/jquery.stellar.min.js"></script>
<!-- Main -->
<script src="/js/main.js"></script>
<script>

    function loadImg() {
        const reader = new FileReader()
        let files = document.getElementById('upload').files
        console.log(files.item(0).name)
        reader.onload = async (event) => {
            document.getElementById('imgUser').setAttribute('src', event.target.result)
        }
        reader.readAsDataURL(files[0])
        document.getElementById('nameImg').value = files.item(0).name
    }

    function load() {
        var urlImg = '${SanPham.anh}'
        console.log(urlImg.length)
        if (urlImg.length == 0) {
            console.log("aa")
        } else {
            document.getElementById('imgUser').setAttribute('src', '/images/' + urlImg)

        }
    }
</script>
</html>