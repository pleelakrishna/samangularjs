mainApp.controller('pageformController', function($scope) {
	var ranges = [];
	for(var i=1;i<10;i++) {
	  ranges.push(i);
	}
	$scope.ranges = ranges;
	$scope.name="";
	$scope.status="";
	$scope.comment="";
	
	$scope.IsVisible  = false;
	
	$scope.myFunc = function(age) {
		var agevalue =parseInt(age);
		if(agevalue%2==0)
			{
			 $scope.age3=agevalue+2;
			}
			else
				 $scope.age3=agevalue*2;
    };
    $scope.checkboxModel = {
    	       value1 : true,
    	       value2 : 'YES'
    	     };
	
    $scope.users =[{'name':'krishna','status':0},{'name':'leela','status':1}]
    
    $scope.numbers =[{'id':'1','name':'leela'},{'id':'2','name':'leela2'},{'id':'3','name':'leela3'}]
    
    $scope.addUser = function(){
    	
    	 if($scope.status =="")
    		 {
    		alert("Select User staus"); 
    		 
    		 }
    	 else
    	 if($scope.name =="")
		 {
		alert("Enter Username"); 
		 
		 }
    	 
       if($scope.name !="" &&$scope.status !="")
    	   {
    	   $scope.users.push({'name':$scope.name,'status':1})
    	   $scope.name="";
    	   }
       
    }
    
    $scope.id="";
    $scope.getUser = function(user,index){
    	 $scope.id=index;
    	 $scope.IsVisible = true;
    	 $scope.name=user.name;
    	 $scope.status=user.status;
    	
    }
    $scope.updateUser = function(){
    	$scope.users[$scope.id].name=$scope.name;
    	$scope.users[$scope.id].status=$scope.status;
    	alert("Record Updated Successfully");
    	$scope.name="";
    	$scope.status="";
    	 $scope.IsVisible = false;
   	
   }
    
    $scope.deleteUser = function(user,index){
   	$scope.users.splice( index, 1);
    alert("Deleted successfully");
   	
   	if ($scope.users.length() === 0){
        $scope.users = [];
      }
   	
   }

	console.log(123);
    
    
    
    $scope.master = {Name:"krishna", lastName:""};
    $scope.reset = function() {
        $scope.user = angular.copy($scope.master);
    };
    $scope.reset();
});


mainApp.directive('allowOnlyNumbers', function () {
    return {  
        restrict: 'A',  
        link: function (scope, elm, attrs, ctrl) {
            elm.on('keydown', function (event) {  
                var $input = $(this);  
                var value = $input.val();  
                value = value.replace(/[^0-9]/g, '')  
                $input.val(value);  
                if (event.which == 64 || event.which == 16) {  
                    // to allow numbers  
                    return false;  
                } else if (event.which >= 48 && event.which <= 57) {  
                    // to allow numbers  
                    return true;  
                } else if (event.which >= 96 && event.which <= 105) {  
                    // to allow numpad number  
                    return true;  
                } else if ([8, 13, 27, 37, 38, 39, 40].indexOf(event.which) > -1) {  
                    // to allow backspace, enter, escape, arrows  
                    return true;  
                } else {  
                    event.preventDefault();  
                    // to stop others  
                    //alert("Sorry Only Numbers Allowed");  
                    return false;  
                }  
            });  
        }  
    }  
});  