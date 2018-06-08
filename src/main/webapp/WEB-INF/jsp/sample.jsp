<!doctype html>
<html ng-app="MYApp">
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
	<title>jQuery Table Barchart Plugin Demo</title>
	<script type="text/javascript">
		var app=angular.module("MYApp", []);
		app.controller("myCtrl", function($scope){
			$scope.users=[{'name':'Ramesh','status':0},{'name':'Srinivas','status':1}];
			$scope.name='';
			$scope.status='';
			$scope.addUser=function(){
				if($scope.name!='' && $scope.status!='')
				{
					console.log($scope.status);
					$scope.users.push({'name':$scope.name,'status':$scope.status});
					$scope.name='';
					$scope.status='';
				}
				else alert("Please enter usernmame");
			}
		});
	</script>
</head>
<body ng-controller="myCtrl">
	Total Users: {{users.length}}
<table width="100%" border="1" rules="all">
	<tr>
		<th>Sl.No</th>
		<th>Name</th>
		<th>Status</th>
	</tr>
	<tr ng-repeat="user in users">
		<td>{{$index+1}}.</td>
		<td>{{user.name}}</td>
		<td align="center">{{user.status==1 ? 'On' : 'Off'}}</td>
	</tr>
	<tr>
		<td align="center" colspan="3"><input type="text" name="name" id="name" ng-model="name">
			<input type="radio" name="status" id="status" ng-model="status" value="1" /> On
			<input type="radio" name="status" id="status" ng-model="status" value="0" /> Off
		<input ng-click="addUser()" type="button" value="Add"></td>
	</tr>
</table>
</body>
</html>