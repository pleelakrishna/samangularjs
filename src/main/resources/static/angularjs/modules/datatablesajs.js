mainApp2.controller('datatablesajs',  function($scope, $http,NgTableParams) {
	 $scope.departments = []
	 
	 $scope.users = [];
	 
	 
	 getDepartmentsList();
	 getUserDetails();
	 
	 
	$scope.isSubmit =false;
	
	 $scope.myFunc = function(val) {
		 alert(val);
	    };
	    
	    $scope.clearForm = function() 
	    {
	  	  $scope.studentform={};
	     
	    }
	    
	    $scope.saveStudent = function(status) 
	    {
	    	
	    	  $scope.isSubmit=true;
	    	alert(status);
	    	
	    	if(status)
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
	    }    
	    

	  function getDepartmentsList() {
	  $http({
	    method : 'GET',
	    url : 'deptList'
	   }).then(function successCallback(response) {
		   
		  // console.log(response);
		  // console.log(response.data);
		   
	   $scope.departments = response.data;
	   //console.log("hello");
	   //console.log($scope.departments);
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
	   //console.log("here user data");
	   console.log($scope.users);
	   //$scope.gridOptions.data = $scope.users;
	   $scope.tableParams = new NgTableParams({}, { dataset: $scope.users});
	   }, function errorCallback(response) {
	    console.log(response.statusText);
	   });
	  }

	  $scope.msg =function(msg)
	  {
		 // console.log(msg);
		  $scope.studentform =msg;
		  alert(msg.departmentid);
		 // $scope.studentform.departmentid = msg.departmentid;
		  
		  console.log(msg.departmentid);
		  
		  $scope.leela=msg.departmentid;
		  $scope.studentform.departmentid =$scope.leela;
	  	}
	  
	  
	 


	  
	  var edit ='<div class="ui-grid-cell-contents">{{ row.entity.id}}</div>';	  
	  var edit2= '<div>' +
                 '  <a href="{{row.entity.id}}">Click me</a>' +
                 '</div>';
                 
      var edit3 ='<input type="button" value="Click me" ng-click="grid.appScope.msg(row.entity)">';	     
     // var deleterow1 = "<a class='activate' onclick='deleteBranch("+ orderObj.id+ ",1)'><i class='fa fa-eye-slash'></i></a>"
      var deleterow = "<a class='activate'  ng-click='grid.appScope.msg(row.entity)'>delete</a>";
	  
	  
	  $scope.gridOptions = {

			  paginationPageSizes: [25, 50, 75],

			  paginationPageSize: 5,

			  columnDefs: [

			  { field: 'id' ,cellTemplate: '<div class="ui-grid-cell-contents">{{ row.entity.id}}</div>'  },

			  { field: 'name' },

			  { field: 'departmentid' },
			  { field: 'mobile' },
			  { field: 'sal' },
			  { field: 'Options' ,cellTemplate: deleterow}

			  ],



			  onRegisterApi: function (gridApi) {

			  $scope.grid1Api = gridApi;

			  }


			  };
	  
	  
	  
	/*  var data = [{name: "Moroni", age: 50} ,];
	  $scope.tableParams = new NgTableParams({}, { dataset: data});*/
	

});