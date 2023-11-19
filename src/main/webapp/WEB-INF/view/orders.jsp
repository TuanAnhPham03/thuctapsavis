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
    .modal-dialog {
        width: 80%;
        margin: auto;
    }
</style>
<body ng-app="orders" ng-controller="ctrl">

<div class="colorlib-loader"></div>

<div id="page">
    <jsp:include page="navbar.jsp"></jsp:include>

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p class="bread"><span><a href="index.jsp">Home</a></span> / <span>Tất cả đơn hàng</span></p>
                </div>
            </div>
        </div>
    </div>
    <div class="colorlib-product">
        <div class="container">
            <div class="row row-pb-lg">
                <div class="col-md-12">
                    <div class="product-name d-flex">
                        <div class="one-eight text-center px-4">
                            <span>Mã</span>
                        </div>
                        <div class="one-eight text-center">
                            <span>Khách Hàng</span>
                        </div>
                        <div class="one-eight text-center">
                            <span>Ngày Đặt</span>
                        </div>
                        <div class="one-eight text-center">
                            <span>Tổng Tiền</span>
                        </div>
                        <div class="one-eight text-center">
                            <span>Số Lượng SP</span>
                        </div>
                        <div class="one-eight text-center ">
                            <span>Tình Trạng</span>
                        </div>
                        <div class="one-eight px-4 text-right">
                            <span>Chi Tiết</span>
                        </div>
                    </div>
                    <c:forEach items="${orders}" var="o">
                        <div class="product-cart d-flex">
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price">${o.ma}</span>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price">${o.tenNguoiNhan}</span>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price"> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
                                                                         value="${o.ngayTao}"/></span>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price"><fmt:formatNumber pattern="#,### VNĐ"
                                                                          value="${o.getTotalPrice()}"
                                                                          type="currency"/></span>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price">${o.getTotalProduct()}</span>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <span class="price">${o.tinhTrang == 1 ? 'Đã Nhận' : 'Chưa Nhận'}</span>
                                </div>
                            </div>
                            <div class="one-eight text-right px-4">
                                <div class="display-tc">
                                    <button type="button" class="btn btn-success" data-toggle="modal"
                                            data-target="#modal" ng-click="getOrder(${o.id})">
                                        Xem chi tiết
                                    </button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp"></jsp:include>


    <!-- Modal -->
    <!-- The Modal -->
    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" id="modal"
         aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width: 80%">
            <div class="modal-content">
                <div class="">
                    <div class="col-12 colorlib-form">
                        <h2>Thông Tin Đơn Hàng</h2>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên Người Nhận</label>
                                    <input type="text" class="form-control" value="{{order.tenNguoiNhan}}" readonly/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ngày Tạo</label>
                                    <input class="form-control" value="{{order.ngayTao | date:'yyyy-MM-dd HH:mm:ss '}}"
                                           readonly/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số Điện Thoại</label>
                                    <input type="text" class="form-control" value="{{order.sdt}}" readonly/>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Địa Chỉ</label>
                                    <input type="text" class="form-control" value="{{order.diaChi}}" readonly/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Thanh Toán</label>
                                    <input type="text" class="form-control"
                                           value="{{order.tenNguoiNhan == 1 ? 'Khi nhận hàng' : 'Ngân hàng nội địa'}}"
                                           readonly/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tình Trạng</label>
                                    <input type="text" class="form-control"
                                           value="{{order.tinhTrang == 1 ? 'Đã nhận' : 'Chưa nhận'}}" readonly/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="col-md-12">
                            <div class="product-name d-flex">

                                <div class="one-forth text-left px-4">
                                    <span>Sản Phầm</span>
                                </div>
                                |
                                <div class="one-eight text-center">
                                    <span>Phân Loại</span>
                                </div>
                                |
                                <div class="one-eight text-center">
                                    <span>Đơn Giá</span>
                                </div>
                                |
                                <div class="one-eight text-center">
                                    <span>Số Lượng</span>
                                </div>
                                |
                                <div class="one-eight text-center">
                                    <span>Thành Tiền</span>
                                </div>
                                |
                            </div>
                            <div class="product-cart d-flex" ng-repeat="p in products">
                                <div class="one-forth text-left px-4">
                                    <div class="product-img" ng-if="p.chiTietSP.sanPham.anh != null"
                                         style="background-image: url(/images/{{p.chiTietSP.sanPham.anh}});">
                                    </div>
                                    <div class="display-tc">
                                        <h3>{{p.chiTietSP.sanPham.ten == null ? 'Sản phẩm đã bị xóa' : p.chiTietSP.sanPham.ten}}</h3>
                                    </div>
                                </div>
                                <div class="one-eight text-center">
                                    <div class="display-tc">
                                        <span class="price">{{p.chiTietSP.mauSac.ten}} - {{p.chiTietSP.kichThuoc.ma}}</span>
                                    </div>
                                </div>
                                <div class="one-eight text-center">
                                    <div class="display-tc">
                                        <span class="price">{{ p.donGiaSauGiam | currency : "" : 1}} VNĐ</span>
                                    </div>
                                </div>
                                <div class="one-eight text-center">
                                    <div class="display-tc">
                                        <span class="price">{{p.soLuong}}</span>
                                    </div>
                                </div>
                                <div class="one-eight text-center">
                                    <div class="display-tc">
                                        <span class="price">{{ p.donGiaSauGiam * p.soLuong| currency : "" : 1}} VNĐ</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="total-wrap">
                            <div class="row">
                                <div class="col-sm-7">
                                </div>
                                <div class="col-sm-5 text-center">
                                    <div class="total">
                                        <div>
                                            <p><span>Tổng Sản Phẩm:</span><span>{{getTotalProduct()}}</span></p>
                                            <p>
                                                <span>Tổng Tiền:</span><span>{{ getTotal() | currency : "" : 1}} VNĐ</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

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
<script src="/js/js/orders.js"></script>

</body>
</html>

