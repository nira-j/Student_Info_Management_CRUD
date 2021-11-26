<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Student info management</title>
  </head>
  
  <style>
    .container{
      padding: 50px;
      width: 100%;
      margin-top: 1%;
      border: 2px rgb(202, 158, 93) solid;
    }
    .radio-btn{
      margin-bottom: 15px;
      margin-left: 80px;
    }
    .form-check-input{
    color: red;
    background-color: green;
    }
  </style>
  
  <body>
 <div class="card">
  <div class="card-header">
    Student Info Management
  </div>
  <div class="card-body">
    <h5 class="card-title">Insert a record of Student</h5>
  	<a href="<%=request.getContextPath()%>/list" class="btn btn-primary">Student List</a>
    
  </div>
  <div class="container">
  <c:if test="${student == null}">
    <h3>Add New Student</h3>
   </c:if>
   <c:if test="${student != null}">
    <h3>Edit Student</h3>
   </c:if>
   <c:if test="${student != null}">
    <form action="update" method="post">
   </c:if>
   <c:if test="${student == null}">
    <form name="addform" action="add" method="post" onsubmit="return validate()">
   </c:if>
   
   <c:if test="${student != null}">
   <input type="hidden" name="id" value="<c:out value='${student.id}'/>"/>
   </c:if>
      <div class="form-group">
        <label for="formGroupExampleInput">Name</label>
        <input type="text" name="name" value="<c:out value='${student.name}'/>" class="form-control" id="formGroupExampleInput" placeholder="Student name">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">Email</label>
        <input type="text" name="email" value="<c:out value='${student.email}'/>" class="form-control" id="formGroupExampleInput2" placeholder="Email">
      </div>
      <label for="formGroupExampleInput2">Gender</label>
      <div class="radio-btn">
        <div class="form-check form-check-inline">
        
          <label class="form-check-label" for="inlineRadio1">Male</label>
          <input class="form-check-input" type="radio" name="gender" id="inlineRadio1" value="male">
        </div>
        <div class="form-check form-check-inline">
          <label class="form-check-label" for="inlineRadio2">Female</label>
          <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="female">
        </div>
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput">Contact</label>
        <input type="text" name="contact" value="<c:out value='${student.contact}'/>" class="form-control" id="formGroupExampleInput" placeholder="Enter Contact no.">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">State</label>
        <input type="text" name="state" value="<c:out value='${student.state}'/>" class="form-control" id="formGroupExampleInput2" placeholder="State">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput">City</label>
        <input type="text" name="city" value="<c:out value='${student.city}'/>" class="form-control" id="formGroupExampleInput" placeholder="City">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">College</label>
        <input type="text" name="college" value="<c:out value='${student.college}'/>" class="form-control" id="formGroupExampleInput2" placeholder="College">
      </div>
      <div class="form-group">
        <label for="formGroupExampleInput2">Date of Birth</label>
        <input type="text" name="dob" value="<c:out value='${student.dob}'/>" class="form-control" id="formGroupExampleInput2" placeholder="Date Of Birth">
      </div>
      <button type="submit" class="btn btn-primary">Save</button>
    </form>
  </div>
</div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script>
  	function validate(){
  		var name=document.addform.name.value;
  		var email=document.addform.email.value;
  		var gender=document.addform.gender.value;
  		var contact=document.addform.contact.value;
  		var state=document.addform.state.value;
  		var city=document.addform.city.value;
  		var college=document.addform.college.value;
  		var dob=document.addform.dob.value;
  		
  		if (name == null || name == ""){
  			alert("name field can not be blank !");
			return false;
  		}else if (email == null || email == ""){
  			alert("email field can not be blank !");
			return false;
  		}else if (gender == null || gender == ""){
  			alert("must select one of the gender !");
			return false;
  		}else if (contact == null ||contact == ""){
  			alert("contact field can not be blank !");
			return false;
  		}else if (state == null || state == ""){
  			alert("state field can not be blank !");
			return false;
  		}else if (city == null || city == ""){
  			alert("city field can not be blank !");
			return false;
  		}else if (college == null || college == ""){
  			alert("college field can not be blank !");
			return false;
  		}else if (name == null || name == ""){
  			alert("date of birth can not be blank !");
			return false;
  		}
  		
  	}
  </script>
  </body>
</html>