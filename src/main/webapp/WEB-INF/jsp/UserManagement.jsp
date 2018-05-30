<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>User Management</title>
  <script
     src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
      <script src = "/angularjs/modules/mainApp.js"></script>
       <script src = "/angularjs/modules/myappcontroller.js"></script>
 
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body ng-app="mainApp" ng-controller="myappcontroller">
 <h3>User Registration Form</h3>
 
   <form name="usersform" novalidate>
    <div class="table-responsive">
      <table class="table table-bordered" style="width: 600px">
       
     
       <input type="hidden"id" ng-model="userform.id" size="30" ng-keypress="checkUser(userform.id)" />
   
       
        <tr>
        
         
          <td>Name</td>
          <td><input type="text" id="name"  name = "name" ng-model="userform.name" size="30" required/></td>
          <span style = "color:red" ng-show = "userform.name.$dirty && userform.name.$invalid"> </span>
         <span  style ="color:red;"ng-show = "usersform.name.$error.required">First Name is required.</span>  
        
        
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
            
              <button ng-click = "clearsForm()">Reset</button>  
              
                     <button ng-disabled = "userform.name.$dirty &&
                        userform.name.$invalid || studentForm.department.$dirty &&
                        studentForm.department.$invalid" ng-click="processUser()">Submit</button>
                  </td>
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
