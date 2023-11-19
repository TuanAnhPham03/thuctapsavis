var app = angular.module('cart', []);
app.controller('ctrl', function($scope, $http) {


    $http.get("/gio-hang/getprodctincart").then(function (response){
        $scope.productsInCart = response.data;
        console.log(response.data);
    })


    $scope.getTotal = function (){
        // $scope.getDonGiaSauGiam()
        var totalPrice = 0;
            for (let i = 0; i < $scope.productsInCart.length; i++) {
                totalPrice += $scope.productsInCart[i].sl * $scope.productsInCart[i].donGia
            }
        return totalPrice;
    }
    $scope.getTotalSoTienGiam = function (){
        var totalPrice = 0;
        for (let i = 0; i < $scope.productsInCart.length; i++) {
            totalPrice +=  ($scope.productsInCart[i].donGia * $scope.productsInCart[i].giamGia / 100 ) * $scope.productsInCart[i].sl
        }
        return totalPrice;
    }

    $scope.removeProductIncart = function (idCTSP){
        if(confirm("Xóa sản phẩm khỏi giỏ hàng?")) {
            $http.get("/gio-hang/remove/" + idCTSP).then(function (response) {
                alert("Success")
                $scope.productsInCart = response.data;
                $scope.getTotal();
            })
        }
    }

    $scope.getUpdateSL = function (id,sl){
        document.getElementById("slUpdate").value = sl
        document.getElementById("slUpdate").setAttribute("name",id)

    }
    $scope.setUpdateSL = function (){
        console.log(document.getElementById("slUpdate").getAttribute("name"))
        var id = document.getElementById("slUpdate").getAttribute("name")
        var sl = document.getElementById("slUpdate").value
        console.log(sl)
        if(sl <=0 || sl.split('.').length>1 || sl.split(',').length>1 ){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }
        if(!parseInt(sl)){
            alert("Số lượng phải là số nguyên > 0!!!")
            return
        }

        if (confirm("Cập nhật số lượng sản phẩm trong giỏ?")) {


            $http.get("/gio-hang/update-sl?idCTSP=" + id + "&sl=" + sl).then(function (response) {
                console.log(response.data)
                if(response.data == null || response.data.length == 0){
                    alert("Phân loại của sản phẩm không đủ số lượng!!!")
                }else {
                    alert("Success")
                    location.reload()
                }
            })
        }

    }

    $scope.thanhToan = function (){
        if($scope.productsInCart.length > 0) {
            if(confirm("Thanh Toán?")){
                window.location.assign("/don-hang/thanh-toan")
            }
        }else{
            alert("Không có sản phẩm trong giỏ hàng!!!")
        }
    }


})
