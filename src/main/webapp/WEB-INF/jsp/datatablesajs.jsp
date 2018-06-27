<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
  <script src = "/angularjs/modules/mainApp2.js"></script>
  <script src = "/angularjs/modules/datatablesajs.js"></script>
   <script src = "/angularjs/modules/customValidationangular.js"></script>
   <script src="http://ui-grid.info/release/ui-grid.js"></script>
   <link rel="stylesheet" href="http://ui-grid.info/release/ui-grid.css" type="text/css">
   <!-- for data tables css files starting -->
   <link rel="stylesheet"; href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">
<script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>

<!-- Add references to ngTable's javascript and css files. EG: -->
</head>
<style type="text/css">

.myGrid {
width: 80%;
height: 230px;
margin:0 auto;
}

p {
    color:red;
}

</style>
<body  ng-app = "mainApp2"  ng-controller = "datatablesajs">

<div class="container">
  <h2>Horizontal form</h2>
  <form class="form-horizontal" id="studentsForm" name="studentsForm"  ng-submit="saveStudent(studentsForm.$valid)" novalidate >
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name:</label>
       <input type="hidden" id="id" name="id" ng-model="studentform.id" />
      <div class="col-sm-10">
        <input type="textbox" class="form-control" id="name" placeholder="Enter name" name="name" ng-model ="studentform.name" ng-required="true" >
          <p ng-show= "isSubmit && studentsForm.name.$error.required">Please Enter name</p>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Mobile:</label>
      <div class="col-sm-10">
        <input type="textbox" class="form-control" id="mobile" maxlength="10" placeholder="Enter mobile" name="mobile" ng-model="studentform.mobile" mobile ng-required="true">
       <p ng-show= "isSubmit && studentsForm.mobile.$error.required">Please Enter Mobile</p>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Sal:</label>
      <div class="col-sm-10">          
        <input type="textbox" class="form-control" id="sal" placeholder="Enter sal" name="sal" ng-model="studentform.sal" numeric ng-required="true">
       <p ng-show= "isSubmit && studentsForm.mobile.$error.required">Please Enter Salary</p>
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2"  >Department:</label>
      <div class="col-sm-10">
       <!--  <select class="form-control" id="departmentid" name="departmentid" ng-model="studentform.departmentid" ng-change="myFunc(studentform.departmentid)">
         <option value="">Select</option>
          <option  ng-repeat="dept in departments " value="{{dept.id}}" >{{dept.name}}</option>
      </select> -->
      
       <select class="form-control" id="departmentid" name="departmentid" ng-model="studentform.departmentid" ng-change="myFunc(studentform.departmentid)"  ng-options="dept.id as dept.name for dept in departments">
        <option value="">Select Country</option>
      </select>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember" ng-model="remember" id="remember"> Remember me</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>
{{studentform.departmentid}}
{{studentform.name}}





<table ng-table="tableParams" class="table" show-filter="true">
    <tr ng-repeat="user in $data">
        <td title="'Name'" filter="{ name: 'text'}" sortable="'name'">
            {{user.name}}</td>
        <td title="'Mobile'" filter="{ mobile: 'number'}" sortable="'mobile'">
            {{user.mobile}}</td>
             <td title="'Sal'" filter="{ sal: 'number'}" sortable="'sal'">
            {{user.sal}}</td>
            <td title="'Department'" filter="{ departmentid: 'number'}" sortable="'departmentid'">
            {{user.departmentid}}</td>
            <td title="'Action'"><a href="#">Edit</a></td>
    </tr>
</table>


<div ui-grid="gridOptions" ui-grid-pagination class="myGrid"></div>

</body>
</html>