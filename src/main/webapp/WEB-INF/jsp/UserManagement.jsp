<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>User Management</title>
  <script
     src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <script type="text/javascript">
  var app = angular.module('myapp', []);

  app.controller('myappcontroller', function($scope, $http) {
  $scope.users = []
  $scope.userform = {
  name : "",
  department : "",
  id : ""
	 
   };
  
  
 

  getUserDetails();

  function getUserDetails() {
  $http({
    method : 'GET',
    url : 'userdetails'
   }).then(function successCallback(response) {
   $scope.users = response.data;
   }, function errorCallback(response) {
    console.log(response.statusText);
   });
  }

  $scope.processUser = function() 
  {
    $http({
    method : 'POST',
    url : 'user',
    data : angular.toJson($scope.userform),
    headers : {
    'Content-Type' : 'application/json'
    }
    }).then( getUserDetails(),clearForm())
      .success(function(data){
      });
  }
  $scope.editUser = function(user) 
  {
	  console.log(user);
    $scope.userform.name = user.name;
    $scope.userform.department = user.department;
    $scope.userform.id = user.id;

    disableName();
  }
  $scope.clearsForm = function() 
  {
	  $scope.userform.name = "";
	  $scope.userform.department = "";
   
  }
  $scope.deleteUser = function(user) {
   $http({
     method : 'DELETE',
     url : 'deleteuser',
     data : angular.toJson(user),
     headers : {
     'Content-Type' : 'application/json'
   }
   }).then( getUserDetails());
  }
 
  function clearForm() {
    $scope.userform.name = "";
    $scope.userform.department = "";
    $scope.userform.id = "";
    document.getElementById("id").disabled = false;
  };
  function disableName()
  {
    document.getElementById("id").disabled = true;
  };
  $scope.checkUser = function(data)
  {
	 alert(data); 
  }
 });
</script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body ng-app="myapp" ng-controller="myappcontroller">
 <h3>User Registration Form</h3>
 
   <form name="studentForm" >
    <div class="table-responsive">
      <table class="table table-bordered" style="width: 600px">
       
     
       <input type="hidden"id" ng-model="userform.id" size="30" ng-keypress="checkUser(userform.id)" />
   
       
        <tr>
        
         
          <td>Name</td>
          <td><input type="text" id="name"  name = "name" ng-model="userform.name" size="30" required/></td>
          <span style = "color:red" ng-show = "userform.name.$dirty && userform.name.$invalid">  
         <span ng-show = "userform.name.$error.required">First Name is required.</span>  
        
        </tr>
        <tr>
          <td>Department</td>
          <td><input type="text" id="department" ng-model="userform.department"
             size="30" /></td>
       </tr>
       <tr>
          <td colspan="2"><input type="submit"
            class="btn btn-primary btn-sm" ng-click="processUser()"
            value="Create / Update User" />
            
              <button ng-click = "clearsForm()">Reset</button>  </td>
       </tr>
     </table>
   </div>
 </form>
 <h3>Registered Users</h3>
   <div class="table-responsive">
     <table class="table table-bordered" style="width: 600px">
       <tr>
         <th>Id</th>
         <th>Name</th>
         <th>Department</th>
         <th>Actions</th>
      </tr>

      <tr ng-repeat="user in users">
       <td>{{ user.id}}</td>
        <td>{{ user.name}}</td>
        <td>{{ user.department }}</td>
        <td><a ng-click="editUser(user)" class="btn btn-primary btn-sm">Edit</a>
           | <a ng-click="deleteUser(user)" class="btn btn-danger btn-sm">Delete</a></td>
      </tr>
    </table>
  </div>
</body>
</html>
