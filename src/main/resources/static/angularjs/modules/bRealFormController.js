mainApp.controller('brealController', function($scope, $http) {
	 $scope.departments = []
	 
	 $scope.users = []
	 
	 $scope.studentform = {
			  name : "",
			  departmentid : "",
			  mobile : "",
			  sal : ""
			   };
	 
	 
	 getDepartmentsList();
	 getUserDetails();
	
	 $scope.myFunc = function(val) {
		 alert(val);
			
	    };
	    
	    $scope.clearForm = function() 
	    {
	  	  $scope.studentform={};
	     
	    }
	    
	    $scope.saveStudent = function() 
	    {
	      $http({
	      method : 'POST',
	      url : 'savestudent',
	      data : angular.toJson($scope.studentform),
	      headers : {
	      'Content-Type' : 'application/json'
	      }
	      }).then( $scope.clearForm())
	        .success(function(data){
	        });
	    }    
	    

	  function getDepartmentsList() {
	  $http({
	    method : 'GET',
	    url : 'deptList'
	   }).then(function successCallback(response) {
	   $scope.departments = response.data;
	   console.log($scope.departments);
	   }, function errorCallback(response) {
	    console.log(response.statusText);
	   });
	  }
	
	  
	  
	 

	  function getUserDetails() {
	  $http({
	    method : 'GET',
	    url : 'userdetails'
	   }).then(function successCallback(response) {
	   $scope.users = response.data;
	   console.log($scope.users);
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

			  { field: 'departmentid' },
			  { field: 'mobile' },
			  { field: 'sal' },
			  { field: 'Options' ,cellTemplate: edit3}

			  ],



			  onRegisterApi: function (gridApi) {

			  $scope.grid1Api = gridApi;

			  }


			  };
	

});