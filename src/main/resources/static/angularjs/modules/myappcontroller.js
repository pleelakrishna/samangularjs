 
  mainApp.controller('myappcontroller', function($scope, $http) {
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
