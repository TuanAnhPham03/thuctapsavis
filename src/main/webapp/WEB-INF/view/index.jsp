<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    #cart-overplay {
        width: 25%;
        height: 10px;
        margin-top: 10px;
        background-color: #a5f8ce;
        box-shadow: 5px 5px #81ac94;
    }

    #cart-overplay > p {
        color: black;
        font-weight: bold;
        font-style: italic;
    }

    .disabled {
        display: none;
    }
</style>
<body ng-app="index" ng-controller="ctrl">

<div class="colorlib-loader"></div>

<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>
    <aside id="colorlib-hero">
        <div class="flexslider">
            <ul class="slides">
                <li style="background-image: url(/images/sandalMenBanner.jpeg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                <div class="slider-text-inner">
                                    <div class="desc">
                                        <h1 class="head-2">Bộ Sưu Tập</h1>
                                        <h2 class="head-1">Saldan</h2>
                                        <h2 class="head-2">Nam</h2>
                                        <p><a href="sanpham/nam" class="btn btn-primary">Hiển thị</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background-image: url(/images/sandalWomanBanner.jpeg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                <div class="slider-text-inner">
                                    <div class="desc">
                                        <h1 class="head-2">Bộ Sưu Tập</h1>
                                        <h2 class="head-1">Saldan</h2>
                                        <h2 class="head-2">Nữ</h2>
                                        <p><a href="sanpham/nu" class="btn btn-primary">Hiển thị</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li style="background-image: url(/images/sandalBanner.jpeg);">
                    <div class="overlay"></div>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6 offset-sm-3 text-center slider-text">
                                <div class="slider-text-inner">
                                    <div class="desc">
                                        <h1 class="head-2">Sản Phẩm</h1>
                                        <h2 class="head-1">Mới</h2>
                                        <p><a href="#" class="btn btn-primary">Hiển thị</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </aside>
    <div class="colorlib-intro">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2 class="intro">It started with a simple idea: Create quality, well-designed products that I
                        wanted myself.</h2>
                </div>
            </div>
        </div>
    </div>
    <div class="colorlib-product">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 text-center">
                    <div class="featured">
                        <a href="#" class="featured-img" style="background-image: url(/images/men.jpg);"></a>
                        <div class="desc">
                            <h2><a href="sandal/nam">Bộ Sưu Tập Nam</a></h2>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 text-center">
                    <div class="featured">
                        <a href="#" class="featured-img" style="background-image: url(/images/women.jpg);"></a>
                        <div class="desc">
                            <h2><a href="sandal/nu">Bộ Sưu Tập Nữ</a></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="colorlib-product">
        <div class="container">
            <h2 class="text-center">{{status}}</h2>
            <div class="row">
                <div class="col-lg-3 col-xl-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                Min: <input type="number" ng-model="min" class="form-control">
                                <br>
                                Max: <input type="number" ng-model="max" class="form-control">
                                <br>
                                <label>Thương Hiệu</label>
                                <select class="form-control"ng-model="thuongHieu" id="thuongHieuSearch">
                                    <option value=""></option>
                                    <c:forEach items="${nsx}" var="d" >
                                        <option value="${d.id}">${d.ten}</option>
                                    </c:forEach>
                                </select>
                                <label>Giới tính</label>
                                <select class="form-control"ng-model="danhMuc" id="danhMucSearch">
                                    <option value=""></option>
                                    <c:forEach items="${danhMuc}" var="d" >
                                      <option value="${d.id}">${d.ten}</option>
                                    </c:forEach>
                                </select>
                                <br>
                                <button ng-click="filter()" class="btn btn-success">Tìm Kiếm</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-xl-9 text-center colorlib-heading">
                    <div class="row row-pb-md">
                        <div class="col-lg-4 mb-4 text-center" ng-repeat="p in page.content">
                            <div class="product-entry border">
                                <a href="/sandal/detail/{{p.id}}" class="prod-img">
                                    <img src="/images/{{p.anh}}" class="img-fluid" alt="Free html5 bootstrap 4 template"
                                         style="width: 253px;height: 253px;">
                                    <div class="card-img-overlay d-flex justify-content-around align-items-center"
                                         id="cart-overplay" >
                                        <p class="">{{p.danhMuc.ten}}</p>

                                    </div>
                                </a>
                                <div class="desc">
                                    <h2 style="height: 40px;"><a href="/sandal/detail/{{p.id}}">{{p.ten}}</a></h2>
                                    <hr>
                                    <p>
                                        Chất Liệu: {{p.chatLieu}}
                                        <br>
                                    <p class="">{{p.nsx.ten}}</p>
                                    </p>
                                    <hr>
                                    <span class="price"  id="{{p.id}}" > {{ p.giaBan | currency : "" : 1}} VNĐ </span>
                                    <span   id="sauGiam{{p.id}}" >  </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row ">
                        <div class="col-md-12 text-center ">
                            <div class="block-27">
                                <ul>
                                    <li id="prev" style="display: none" class="">
                                        <a ng-click="getPage(page.number-1)" style="cursor: pointer"><i
                                                class="ion-ios-arrow-back "></i></a>
                                    </li>
                                    <li ng-repeat="number in getPageNumbers()" id="{{number}}">
                                        <a ng-click="getPage(number)" style="cursor: pointer">{{number+1}}</a>
                                    </li>
                                    <li id="next"><a ng-click="getPage(page.number+1)" style="cursor: pointer"><i
                                            class="ion-ios-arrow-forward"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="colorlib-partner">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center colorlib-heading colorlib-heading-sm">
                    <h2>Các Đối Tác</h2>
                </div>
            </div>
            <div class="row">
                <div class="col partner-col text-center">
                    <img src="/images/brand-1.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="/images/brand-2.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="/images/brand-3.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="/images/brand-4.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
                <div class="col partner-col text-center">
                    <img src="/images/brand-5.jpg" class="img-fluid" alt="Free html4 bootstrap 4 template">
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>
</div>

<div class="gototop js-top">
    <a href="#" class="js-gotop"><i class="ion-ios-arrow-up"></i></a>
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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="/js/js/index.js"></script>
</body>

</html>