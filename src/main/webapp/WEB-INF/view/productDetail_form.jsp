<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Footwear - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<body ng-app="form-detail" ng-controller="ctrl" onload="${alert}" >
<jsp:include page="navbar.jsp"></jsp:include>
<div class="colorlib-product">
    <div class="container">
        <a href="/sandal-admin" role="button" class="btn btn-danger" style="color: white">Trở về</a>
        <br>
        <br>
        <div class="row">
            <div class="col-lg-7 col-xl-7" style="margin-top: 55px;">
                <div class="row row-pb-lg">
                    <div class="col-md-12">
                        <div class="product-name d-flex">
                            <div class="one-forth text-left">
                                <span style="margin-left: 20px;">Màu Sắc</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Size</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Số Lượng</span>
                            </div>
                            <div class="one-eight text-center">
                                <span>Cập Nhật</span>
                            </div>
                            <div class="one-eight text-center px-4">
                                <span>Xóa</span>
                            </div>
                        </div>
                        <div class="product-cart d-flex" ng-repeat="p in productDetais">
                            <div class="one-forth text-left">
                                <div class="display-tc d-flex justify-content-center align-content-center flex-wrap">
                                    <div style="width: 30px; height: 30px; background-color: {{p.mauSac.ma}};border: 1px solid"></div>
                                    <h3>{{p.mauSac.ten}}</h3>
                                </div>
                            </div>

                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <h3>{{p.kichThuoc.ma}}</h3>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <h3>{{p.soLuong}}</h3>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <a ng-click="viewupdate(p.id)" data-toggle="modal" data-target="#exampleModal"><i
                                            class="fa-sharp fa-solid fa-pen-to-square"></i></a>
                                </div>
                            </div>
                            <div class="one-eight text-center">
                                <div class="display-tc">
                                    <a ng-click="delete(p.id)" class="closed"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-xl-5" style="border-left: 1px solid rgb(140, 139, 139);">
                <h2 class="text-center">Thông Tin Sản Phẩm</h2>

                <form:form action="/sandal-admin/detail/add" method="post" cssClass="colorlib-form"
                           onsubmit="return confirm('Thêm chi tiết sản phẩm')"
                           modelAttribute="ChiTietSP">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ma">Sản Phẩm</label>
                                <input type="text" id="ma" class="form-control" value="${ChiTietSP.sanPham.ten}"
                                       readonly>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Màu Sắc</label>
                                <div class="form-field">
                                    <form:select path="mauSac" cssClass="form-control" id="color"  >
                                        <form:options items="${mauSac}" itemValue="id" itemLabel="ten"></form:options>
                                    </form:select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Size</label>
                                <div class="form-field" id="a" >
                                    <select class="form-control" multiple name="size"  id="choices-multiple-size"  >
                                        <c:forEach items="${kichThuoc}" var="k">
                                            <option value="${k.id}">${k.ma}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Số Lượng</label>
                                <form:input path="soLuong" cssClass="form-control"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <button class="btn btn-primary" style="margin-left: 84%;">Add</button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cập Nhật Số Lượng</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="colorlib-form">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="ma">Sản Phẩm</label>
                                <input type="text" class="form-control" ng-model="sanPhamUpdate"
                                       readonly>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Màu Sắc</label>
                                <input type="text" class="form-control" ng-model="mauSacUpdate" readonly>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Size</label>
                                <input type="text" class="form-control" ng-model="sizeUpdate" readonly>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Số Lượng</label>
                                <input type="number" min="0" class="form-control" ng-model="soLuongUpdate">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Trở về</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" ng-click="update(productDetailId)">Cập Nhật</button>
                    </div>
                </form>
            </div>
        </div>
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.css">
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/choices.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<script src="/js/js/productDetailAdmin.js"></script>
<script>
    $(document).ready(function () {
        var multipleCancelButton = new Choices('#choices-multiple-size', {
            removeItemButton: true
        });
    });
</script>

</html>