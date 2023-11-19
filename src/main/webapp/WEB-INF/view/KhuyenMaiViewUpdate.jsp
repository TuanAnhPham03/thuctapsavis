<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Rokkitt:100,300,400,700" rel="stylesheet">

    <!-- Animate.css -->
    <link rel="stylesheet" rel="stylesheet" href="/css/animate.css">
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/7.1.3/highcharts.js"></script>

</head>
<style>
    body, html {
        height: 100%;
        background-repeat: no-repeat;
        background-image: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));
    }
    form{
        border-radius: 30px;
    }
</style>
<body ng-app="thongke" ng-controller="ctrl" class="d-flex justify-content-center container align-items-center">
<div class="col-6">
    <form:form cssClass="colorlib-form" action="/khuyen-mai/update/${KhuyenMai.id}" method="post" modelAttribute="KhuyenMai"
               onsubmit="return confirm('Cập nhật khuyến mại?')">
        <div class="form-group col-12">
            <label>Tên khuyến mại</label>
            <form:input path="ten" cssClass="form-control"/>
        </div>
        <div class="form-group col-12">
            <label>Trạng thái</label>
            <form:radiobutton path="trangThai" label="Áp dụng" value="1"/>
            <form:radiobutton path="trangThai" label="Không áp dụng" value="0"/>
        </div>
        <div class="form-group col-12">
            <label>Mực giảm giá(%)</label>
            <form:input path="mucGiam" cssClass="form-control"/>
        </div>
        <div class="col-md-12">
            <div class="form-group">
                <label>Size</label>
                <div class="form-field" id="a" >
                    <select class="form-control" multiple name="products"  id="choices-multiple-size"  >
                        <c:forEach items="${products}" var="p">
                                <option value="${p.id}"
                            <c:forEach items="${productsOnDeal}" var="pd">
                                    <c:if test="${p.id == pd.sanPham.id}">selected</c:if>
                            </c:forEach>
                                                        >${p.ten}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <button type="submit" class="btn btn-success">Cập nhật</button>
    </form:form>
</div>
</div>
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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
</body>
<script>
    $(document).ready(function () {
        var multipleCancelButton = new Choices('#choices-multiple-size', {
            removeItemButton: true
        });
    });
</script>

</html>