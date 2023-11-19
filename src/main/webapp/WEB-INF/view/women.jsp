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
</style>
<body>

<div class="colorlib-loader"></div>

<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="index.jsp">Trang Chủ</a></span> / <span>Nữ</span></p>
                </div>
            </div>
        </div>
    </div>

    <div class="breadcrumbs-two">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="breadcrumbs-img" style="background-image: url(/images/sandalWomanBanner.jpeg);">
                        <h2 style="color:aliceblue">Nữ</h2>
                    </div>
                    <div class="menu text-center">
                        <p><a href="#">Sản Phẩm Mới</a> <a href="#">Bán Chạy</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="colorlib-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-xl-3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                <h3>Thương Hiệu</h3>
                                <ul>
                                    <li><a href="#">Nike</a></li>
                                    <li><a href="#">Adidas</a></li>
                                    <li><a href="#">Merrel</a></li>
                                    <li><a href="#">Gucci</a></li>
                                    <li><a href="#">Skechers</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                <h3>Size</h3>
                                <div class="block-26 mb-2">
                                    <h4>Size</h4>
                                    <ul>
                                        <li><a href="#">7</a></li>
                                        <li><a href="#">7.5</a></li>
                                        <li><a href="#">8</a></li>
                                        <li><a href="#">8.5</a></li>
                                        <li><a href="#">9</a></li>
                                        <li><a href="#">9.5</a></li>
                                        <li><a href="#">10</a></li>
                                        <li><a href="#">10.5</a></li>
                                        <li><a href="#">11</a></li>
                                        <li><a href="#">11.5</a></li>
                                        <li><a href="#">12</a></li>
                                        <li><a href="#">12.5</a></li>
                                        <li><a href="#">13</a></li>
                                        <li><a href="#">13.5</a></li>
                                        <li><a href="#">14</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="side border mb-1">
                                <h3>Màu Sắc</h3>
                                <ul>
                                    <li><a href="#">Black</a></li>
                                    <li><a href="#">White</a></li>
                                    <li><a href="#">Blue</a></li>
                                    <li><a href="#">Red</a></li>
                                    <li><a href="#">Green</a></li>
                                    <li><a href="#">Grey</a></li>
                                    <li><a href="#">Orange</a></li>
                                    <li><a href="#">Cream</a></li>
                                    <li><a href="#">Brown</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9 col-xl-9">
                    <div class="row row-pb-md">
                        <c:forEach items="${products}" var="p">
                            <div class="col-lg-4 mb-4 text-center">
                                <div class="product-entry border">
                                    <a href="/sandal/detail/${p.id}" class="prod-img">
                                        <img src="/images/${p.anh}" class="img-fluid"
                                             alt="Free html5 bootstrap 4 template"
                                             style="width: 253px;height: 253px;">
                                        <div class="card-img-overlay d-flex justify-content-around align-items-center"
                                             id="cart-overplay">
                                            <p class="">${p.danhMuc.ten}</p>
                                        </div>
                                    </a>
                                    <div class="desc">
                                        <h2><a href="/sandal/detail/${p.id}">${p.ten}</a></h2>
                                        <hr>

                                        <span class="price">
											<fmt:formatNumber pattern="#,### VNĐ" value="${p.giaBan}" type="currency"/>
                                </span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <div class="block-27">
                                <ul>
                                    <li><a href="#"><i class="ion-ios-arrow-back"></i></a></li>
                                    <li class="active"><span>1</span></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#"><i class="ion-ios-arrow-forward"></i></a></li>
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

</body>
</html>

