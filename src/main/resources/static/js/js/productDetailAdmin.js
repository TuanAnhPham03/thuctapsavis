var app = angular.module('form-detail', []);
app.controller('ctrl', function($scope, $http) {
    // const pathName = window.location.pathname.split('/');
    // const idSP = pathName[pathName.length - 1]

    $http.get("/sandal-admin/productDetails").then(function(response) {
            $scope.productDetais = response.data;
            console.log(response.data)
    });

    $scope.delete = function (id){
        if(confirm("Xóa Chi tiết sản phẩm?")) {
            $http.get("/sandal-admin/detail/delete/" + id).then(function (response) {
                $http.get("/sandal-admin/productDetails").then(function (response) {
                    $scope.productDetais = response.data;
                    console.log(response.data)
                });
                alert("Xóa thành công")
            });
        }
    }
    $scope.viewupdate = function (id){
        $http.get("/sandal-admin/detail/view-update/"+id).then(function(response) {
            console.log(response.data)
            $scope.productDetailId = response.data.id
            $scope.sanPhamUpdate = response.data.sanPham.ten
            $scope.mauSacUpdate = response.data.mauSac.ten
            $scope.sizeUpdate = response.data.kichThuoc.ma
            $scope.soLuongUpdate = response.data.soLuong
        });
    }
    $scope.update = function (id){
        if(confirm("Cập nhật số lượng?")) {
            $http.put("/sandal-admin/detail/update/" + id, $scope.soLuongUpdate).then(function (response) {
                $http.get("/sandal-admin/productDetails").then(function (response) {
                    $scope.productDetais = response.data;
                    console.log(response.data)
                });
                alert("Cập nhật thành công")
            });
        }
    }

    $scope.getSizeByColor = function (){
        var idColor = document.getElementById("color").value
        $http.get("/sandal-admin/detail/getsize?idMS="+idColor).then(function(response) {
            var sizes = response.data
            console.log(sizes)
            $scope.options = "";
            for (let i = 0;i<sizes.length;i++) { console.log(sizes[i].ma)
                $scope.options += '<option value=\''+sizes[i].id +'\'>' + sizes[i].ma +'</option>'
            }
            document.getElementById("a").innerHTML = " <select class=\"form-control\" multiple name=\"size\"  id=\"choices-multiple-size\" >" + $scope.options + "</select>"
            multilSelect()
        });
    }
});
function multilSelect(){
    $(document).ready(function () {
        var multipleCancelButton = new Choices('#choices-multiple-size', {
            removeItemButton: true
        });
    });
}
