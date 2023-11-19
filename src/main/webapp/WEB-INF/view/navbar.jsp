<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<%--    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>--%>
<%--    <script src="/js/js/navbar.js"></script>--%>
<nav class="colorlib-nav" role="navigation" ng-app="navbar" ng-controller="ctrl">
    <div class="top-menu">
        <div class="container">
            <div class="row">
                <div class="col-sm-7 col-md-9">
                    <div id="colorlib-logo"><a href="/san-pham">Sandal</a></div>
                </div>
                <div class="col-sm-5 col-md-3">
                    <form action="/sandal/tim-kiem" class="search-wrap">
                        <div class="form-group">
                            <input type="search" class="form-control search" placeholder="Search" name="keyWord"
                                   value="${param.keyWord}">
                            <button class="btn btn-primary submit-search text-center" type="submit"><i
                                    class="icon-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 text-left menu-1">
                    <ul>
                        <li class="active"><a href="/sandal">Trang Chủ</a></li>
                        <li class="has-dropdown">
                            <a href="/sandal/nam">Nam</a>
                            <ul class="dropdown">
                                <li>
                                    <a href="Documents/fpoly/java_5/asm/asm/src/main/webapp/WEB-INF/view/product-detail.jsp">Chi
                                        tiết sản phẩm</a></li>
                                <li><a href="cart">Giỏ hàng</a></li>
                                <li><a href="/gio-hang/thanh-toan">Checkout</a></li>
                                <li><a href="/gio-hang/thanh-toan/thanh-cong">Order Complete</a></li>
                                <li><a href="/danh-sach-yeu-thich">Wishlist</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown"><a href="/sandal/nu">Nữ</a>
                            <ul class="dropdown">
                                <li ng-repeat="n in nsx"><a href="/sandal/nu/{{n.id}}">{{n.ten}}</a></li>
                            </ul>
                        </li>
                        <li><a href="/don-hang">Tất cả đơn hàng</a>
                        </li>
                        <li>
                            <a href="/sandal/thongke">Thống Kê</a>
                        </li>
                        <li class="has-dropdown cart">
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="/user/${sessionScope.user == null ? "#" :  sessionScope.user.id}"
                                   style="border-radius: 20px; background-color: rgb(95, 95, 95); margin-bottom: 20px"><i
                                        class="fa-solid fa-user" style="color: #fcfcfc;"></i></a>
                                <p style="margin-left: 10px" >${sessionScope.user.getHoTen()}</p>
                            </div>
                            <ul class="dropdown" style="width: 200px;">
                                <li><a href="/sandal-admin">Quản Lý Sản Phẩm</a></li>
                                <li><a href="/danh-sach-yeu-thich">Danh Sách Yêu Thích</a></li>
                                ${sessionScope.user == null ? ""
                                        : "<li><a href=\"/doi-mat-khau\">Đổi Mật Khẩu</a></li>"}
                                ${sessionScope.user == null ? "<li><a href=\"/login\" >Đăng Nhập</a></li>"
                                : "<li><a href=\"/logout\" onclick=\"return confirm('Đăng xuất?')\">Đăng Xuất</a></li>"}
                            </ul>
                        </li>
                        <li class="cart"><a href="/gio-hang"><i class="icon-shopping-cart"></i> Cart </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="sale">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 offset-sm-2 text-center">
                    <div class="row">
                        <div class="owl-carousel2">
                            <div class="item">
                                <div class="col">
                                    <h3><a href="#">25% off (Almost) Everything! Use Code: Summer Sale</a></h3>
                                </div>
                            </div>
                            <div class="item">
                                <div class="col">
                                    <h3><a href="#">Our biggest sale yet 50% off all summer shoes</a></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


