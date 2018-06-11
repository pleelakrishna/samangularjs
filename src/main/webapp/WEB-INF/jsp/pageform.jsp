<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
      <script src = "/angularjs/modules/mainApp.js"></script>
      <script src = "/angularjs/modules/pageformController.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
</head>
<body  ng-app = "mainApp" ng-controller = "pageformController">
 <div  class="container" >
 <form novalidate>
    First Name:
    <input type="text" ng-model="user.Name"><br>
    Last Name:
    <input type="text" ng-model="user.lastName">
    <br><br>
    <button ng-click="reset()">RESET</button>
  </form>
   </div>
   
   <div class="container">
  <h2>Horizontal form</h2>
  <form class="form-horizontal">
 <!--  <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" ng-model="name" only-digits>
      </div>
    </div> -->
   <!--  <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
      </div>
    </div> -->
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="comment">Comment:</label>
      <div class="col-sm-10">
        <textarea rows="5" class="form-control" id="comment" placeholder="Enter comment" name="comment" ng-model="comment"></textarea>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="gender">Gender:</label>
      <div class="col-sm-10">
      <label class="radio-inline" for="male">male:</label>
        <input type="radio"  id="male"  name="gender" ng-model="gender" ng-value="'male'" >
        <label class="radio-inline" for="female">Female:</label>
         <input type="radio"  id="female"  name="gender" ng-model="gender" ng-value="'female'">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="age">Age</label>
      <div class="col-sm-10">
        <select class="form-control" ng-model="age" name="type" ng-dropdown ng-change="myFunc(age)">
          <option ng-option value="">Select</option>
          <option ng-option value="{{i}}" ng-repeat="i in ranges">{{i}}</option>
            </select>
        
      </div>
      <div class="col-sm-10">
        <select class="form-control" ng-model="age" name="type" ng-dropdown ng-change="myFunc(age)">
          <option ng-option value="">Select</option>
          <option ng-option value="{{k.id}}" ng-repeat="(k,v) in numbers ">{{v.name}}</option>
            </select>
        
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
        <label class="control-label col-sm-2" for="checkboxModel">Remember Me</label>
        <input type="checkbox" ng-model="checkboxModel.value1" name="checkboxModel"
           ng-true-value="'YES'" ng-false-value="'NO'">
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
 <div class="container">
  <h2> Rows</h2>
  <table class="table table-striped">
    <thead>
      <tr>
        <th>Name</th>
        <th>Comment</th>
        <th>Gender</th>
       <th> Remember Me</th>
        <th>Age</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>{{name}}</td>
        <td>{{comment}}</td>
        <td>{{gender}}</td>
        <td>{{checkboxModel.value1}}</td>
         <td>{{age3}}</td>
         <div ng-if= "age != null">
         <p>{{age%2==0 ? age*2 : age*1+2}}</p>
         </div>
          <div ng-if= "age == null">
         <p></p>
         </div>
       <!-- <td> <div ng-if="age==='2'">
<h1>{{age*2}}</h1>
</div></td>  -->
<!--  <td> <div ng-if="$even">
<h1>{{age*1 + age*1}}</h1>
</div></td>  -->
      </tr>
    </tbody>
  </table>
  
<table width="100%" border="1" rules="all">
   <tr>
   <th>ID</th>
   <th>Name</th>
   <th>status</th>
   <th>Edit</th>
   </tr>
    <tr ng-repeat ="user in users">
    <td>{{$index+1}}</td>
    <td>{{user.name}}</td>
    <td>{{user.status ==1 ? 'Active':'Inactive'}}</td>
     <td>  <input type="button" id="editUser" name="editUser" value="Edit" ng-click="getUser(user,$index)">
        <input type="button" id="editUser" name="editUser" value="Delete" ng-click="deleteUser(user,$index)"></td>
    </tr> 
    <tr>
    <td>
    <form>
    <input type="text" id="name" name="name" ng-model="name" allow-only-numbers /></form>
     Active <input type="radio" id="status" name="status" value="1" ng-model="status">
     Inactive <input type="radio" id="status" name="status" value="0" ng-model="status">
    <input type="button" value="add" ng-show = "!IsVisible"    ng-click="addUser()">  
    <input type="button" value="Update" ng-show ="IsVisible" ng-click="updateUser()">   
    </td>
    </tr>
  
  </table>
</div>
 

</body>
</html>