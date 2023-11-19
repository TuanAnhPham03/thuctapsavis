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
<body ng-app="product-admin" ng-controller="ctrl" onload="${alert}">

<div class="colorlib-loader"></div>

<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="index.jsp">Home</a></span> / <span>My Wishlist</span></p>
                </div>
            </div>
        </div>
    </div>


    <div class="colorlib-product">
        <div class="container">
            <div class="d-flex justify-content-between">
                <div>
                    <input type="text" ng-model="keyWord"><button class="btn" ng-click="getByName()">Tìm Kiếm</button>
                </div>
                <a href="/sandal-admin/view-add" class="btn btn-success" >Thêm sản phẩm</a>
            </div>
            <br>
            <br>
            <div class="row row-pb-lg">
                <div class="col-md-12">
                    <div class="product-name d-flex">
                        <div class="one-forth text-left">
                            <span style="margin-left: 20px;">Sản Phẩm</span>
                        </div>
                        <div class="one-eight text-left">
                            <span>Ngày Thêm</span>
                        </div>
                        |
                        <div class="one-eight text-center">
                            <span>Giá</span>
                        </div>
                        |
                        <div class="one-eight text-center">
                            <span>Hãng</span>
                        </div>
                        |
                        <div class="one-eight text-center">
                            <span>Giới Tính</span>
                        </div>
                        |
                        <div class="one-eight text-center">
                            <span>Hiển Thị</span>
                        </div>
                        |
                        <div class="one-eight text-center">
                            <span>Sửa</span>
                        </div>
                        |
                        <div class="one-eight text-center px-4">
                            <span>Xóa</span>
                        </div>
                    </div>
                    <div class="product-cart d-flex" ng-repeat="p in products.content">
                        <div class="one-forth text-left">
                            <a href="/sandal-admin/detail/{{p.id}}">
                                <div class="product-img" style="background-image: url(images/{{p.anh}});">
                                </div>
                                <div class="display-tc">
                                    <h3>{{p.ten}}</h3>
                                </div>
                            </a>
                        </div>
                        <div class="one-eight text-left">
                            <div class="display-tc">
                                <span class="price">{{p.ngayThem | date:'yyyy-MM-dd'}}</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <span class="price">{{ p.giaBan | currency : "" : 1}} VNĐ</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <span class="price">{{p.nsx.ten}}</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <span class="price">{{p.danhMuc.ten}}</span>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc" ng-if="p.trangThai == true">
                                <input type="checkbox" ng-click="updateStatus(p.id)"
                                       style="cursor: pointer"
                                       checked>
                            </div>
                            <div class="display-tc" ng-if="p.trangThai != true">
                                <input type="checkbox" ng-click="updateStatus(p.id)"
                                       style="cursor: pointer">
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <a href="/sandal-admin/viewupdate/{{p.id}}"><i
                                        class="fa-sharp fa-solid fa-pen-to-square"></i></a>
                            </div>
                        </div>
                        <div class="one-eight text-center">
                            <div class="display-tc">
                                <a ng-click="delete(p.id)" class="closed" style="cursor: pointer"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="block-27">
                        <ul>
                            <li id="prev" style="display: none">
                                <a ng-click="getPage(page -1)" style="cursor: pointer"><i
                                        class="ion-ios-arrow-back"></i></a>
                            </li>
                            <li ng-repeat="number in getPageNumbers()" id="{{number}}">
                                <a ng-click="getPage(number)" style="cursor: pointer">{{number+1}}</a>
                            </li>
                            <li id="next"><a ng-click="getPage(page +1)" style="cursor: pointer"><i
                                    class="ion-ios-arrow-forward"></i></a></li>
                        </ul>
                    </div>
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
<script src="/js/js/productadmin.js"></script>
</body>
<%--<script>--%>
<%--	function updateTrangThai(id){--%>
<%--		console.log(id)--%>
<%--		$.ajax({--%>
<%--			type : "GET",--%>
<%--			url : "/sanpham-admin/update-status/"+id--%>
<%--		})--%>
<%--	}--%>
<%--</script>--%>
</html>

