<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<title>

Angularjs UI-Grid Paging Example

</title>

<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

<script src="http://ui-grid.info/release/ui-grid.js"></script>

<link rel="stylesheet" href="http://ui-grid.info/release/ui-grid.css" type="text/css">

<script type="text/javascript">

var app = angular.module("uigridApp", ["ui.grid", "ui.grid.pagination"]);

app.controller("uigridCtrl", function ($scope,$http) {
	
	 $scope.users = []
	 
	 getUserDetails();

	  function getUserDetails() {
	  $http({
	    method : 'GET',
	    url : 'userdetails'
	   }).then(function successCallback(response) {
	   $scope.users = response.data;
	   $scope.gridOptions.data = $scope.users;
	   }, function errorCallback(response) {
	    console.log(response.statusText);
	   });
	  }

	  
	  var edit ='<div class="ui-grid-cell-contents">{{ row.entity.id}}</div>';	  
	  var edit2= '<div>' +
                 '  <a href="{{row.entity.id}}">Click me</a>' +
                 '</div>';
                 
      var edit3 ='<input type="button" value="Click me" ng-click="grid.appScope.msg(row.entity)">';	           
	  
	  
	  
$scope.gridOptions = {

paginationPageSizes: [25, 50, 75],

paginationPageSize: 5,

columnDefs: [

{ field: 'id' ,cellTemplate: '<div class="ui-grid-cell-contents">{{ row.entity.id}}</div>'  },

{ field: 'name' },

{ field: 'department' },
{ field: 'Options' ,cellTemplate: edit3}

],



onRegisterApi: function (gridApi) {

$scope.grid1Api = gridApi;

}


};

$scope.msg =function(msg)
{
	alert(msg.name);
	}


});

</script>

<style type="text/css">

.myGrid {

width: 500px;

height: 230px;

}

</style>

</head>

<body ng-app="uigridApp">

<h2>AngularJS UI Grid Paging Example</h2>

<div ng-controller="uigridCtrl">

<div ui-grid="gridOptions" ui-grid-pagination class="myGrid"></div>

</div>

</body>

</html>