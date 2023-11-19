var app = angular.module('product-admin', []);
app.controller('ctrl', function($scope, $http) {
    $scope.keyWord =""
    $scope.page = 0;
    $http.get("/sandal-admin/getProducts?page=0").then(function (response){
        $scope.products = response.data
        $scope.pageNumbers = response.data.totalPages
    })

    $scope.updateStatus = function (id){
            $http.get("/sandal-admin/update-status/" + id).then(function (response) {
            })

    }
    $scope.delete = function (id){
        if(confirm('Xóa sản phẩm')){
            $http.get("/sandal-admin/delete/"+id).then(function (response){
                alert('Xóa thành công')
                // $scope.products = response.data
                // console.log(response.data)
                $scope.getPage($scope.page)
            })
        }
    }



    $scope.getByName= function (){
        $scope.page = 0;
        $http.get("/sandal-admin/getProducts?page=0"+"&keyWord="+$scope.keyWord).then(function (response) {
            console.log(response.data)
            $scope.products = response.data
            $scope.pageNumbers = response.data.totalPages
            if($scope.pageNumbers > 1) document.getElementById("next").style.display = "inline"
            document.getElementById("prev").style.display = "none"
            $scope.getPageNumbers()
        })

        for (let i = 0;i<$scope.pageNumbers;i++){
            document.getElementById(i).removeAttribute("class");
        }
    }
    $scope.getPageNumbers = function (){
        if($scope.pageNumbers == 1){
            document.getElementById("prev").style.display = "none"
            document.getElementById("next").style.display = "none"
        }else {

            let pages = []
            for (let i = 0; i < $scope.pageNumbers; i++) {
                pages.push(i)
            }
            return pages;
        }
    }
    $scope.getPage = function (pageNumber){
        console.log(pageNumber)
        $scope.page = pageNumber;
        $scope.removeActive(pageNumber)
        $http.get("/sandal-admin/getProducts?page=" + pageNumber+"&keyWord="+$scope.keyWord).then(function (response) {
            console.log(response.data)
            $scope.products = response.data
        })
    }
    $scope.removeActive = function (pageNumber){
        for (let i = 0;i<$scope.pageNumbers;i++){
            document.getElementById(i).removeAttribute("class");
        }
        // disabled prev
        if (pageNumber <= 0) document.getElementById("prev").style.display = "none"
        else document.getElementById("prev").style.display = "inline"
        // disabled next
        if (pageNumber >= $scope.pageNumbers - 1) document.getElementById("next").style.display = "none"
        else document.getElementById("next").style.display = "inline"
        //Add class active
        document.getElementById(pageNumber).setAttribute("class", "active")
    }
})