var app = angular.module('product-detail', []);
app.controller('ctrl', function ($scope, $http) {

    var pathName = window.location.pathname.split('/');
    var idSP = pathName[pathName.length - 1];
    $scope.idMS = "";

    $http.get("/khuyenmai-sanpham/getall").then(function (response) {
        console.log(response.data)
        $scope.productsOnKhuyenMai = response.data
        $scope.getDonGiaSauGiam()

    })
    // $scope.soLuong = "";
    $scope.showLength = function () {
        $scope.showLengthFoot = $scope.lengthFoot;
        var person = {
            name: "phyuoc",
            age: "20"
        }
        $http.get("/kich-thuoc/getByChieuDai/" + $scope.lengthFoot, person).then(function (reponse) {
            $scope.kichThuoc = reponse.data
        })
    }

    $scope.showColorName = function (colorName, idMS) {
        document.getElementById("colorName").innerText = colorName
        console.log(window.location.pathname)

        $scope.idMS = idMS
        $scope.soLuong = ""
        $scope.CTSP = null

        console.log("kich-thuoc/getbysp-ms?idSP=" + idSP + "&idMS=" + idMS)
        $http.get("/kich-thuoc/getbysp-ms?idSP=" + idSP + "&idMS=" + idMS).then(function (response) {
            console.log(response.data)

            var sizes = response.data

            var radioSize = document.getElementsByName("sizes")
            for (let i = 0; i < radioSize.length; i++) {
                radioSize[i].setAttribute("disabled", "");
                radioSize[i].checked = false
                for (let j = 0; j < sizes.length; j++) {
                    if (radioSize[i].id == sizes[j].id) radioSize[i].removeAttribute("disabled");
                }
                document.getElementById("quantity").value = 1
            }
        })
    }

    $scope.getKichThuoc = function (idKT) {
        $http.get(window.location.href + "/getchitietsp?idKT=" + idKT + "&idMS=" + $scope.idMS).then(function (response) {
            console.log(response.data)
            $scope.soLuongStatus = "Còn " + response.data.soLuong + " sản phẩm"
            $scope.CTSP = response.data;
            document.getElementById("quantity").value = 1

        })
    }

    $scope.addToCart = function () {

        if($scope.CTSP == null) {
            alert("Vui lòng chọn phân loại sản phẩm!!!")
            return;
        }

        var sl = document.getElementById("quantity").value
        console.log(sl.split('.').length)
        if(sl <=0 || sl.split('.').length>1 || sl.split(',').length>1 ){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }
        if(!parseInt(sl)){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }

        if (confirm("Thêm sản phẩm vào giỏ hàng?")) {


            $http.get("/gio-hang/add-to-cart?idCTSP=" + $scope.CTSP.id + "&sl=" + sl).then(function (response) {
                console.log(response.data)
                if(response.data == null || response.data.length == 0){
                    alert("Phân loại của sản phẩm không đủ số lượng!!!")
                }else {
                    alert("Success")
                    document.getElementById("quantity").value = 1
                }
            })
        }
    }
    $scope.muaNgay = function () {

        if($scope.CTSP == null) {
            alert("Vui lòng chọn phân loại sản phẩm!!!")
            return;
        }

        var sl = document.getElementById("quantity").value
        console.log(sl.split('.').length)
        if(sl <=0 || sl.split('.').length>1 || sl.split(',').length>1 ){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }
        if(!parseInt(sl)){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }

        if (confirm("Mua ngay sản phẩm vào giỏ hàng?")) {


            $http.get("/don-hang/mua-ngay?idCTSP=" + $scope.CTSP.id + "&sl=" + sl).then(function (response) {
                console.log(response.data)
                if(response.data == 0){
                    alert("Phân loại của sản phẩm không đủ số lượng!!!")
                }else {
                    alert("Mua Thành công")
                    location.reload()
                }
            })
        }
    }
    $scope.getDonGiaSauGiam = function () {
        var product = $scope.productsOnKhuyenMai
        for (let j = 0; j < product.length; j++) {
            if (idSP == product[j].sanPham.id) {
                document.getElementById("price").style.textDecoration = "line-through"
                var donGiaSauGiam = product[j].sanPham.giaBan - (product[j].sanPham.giaBan * (product[j].khuyenMai.mucGiam / 100))
                document.getElementById("donGiaSauGiam").innerText = donGiaSauGiam.toLocaleString('it-IT', {
                    style: 'currency',
                    currency: 'VND'
                });
            }
        }
    }

});
