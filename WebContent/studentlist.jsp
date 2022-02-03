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

    <title>Student List</title>
  </head>
  
  <style>
    #stutable{
    	color: green;
        margin-left: 10px;
        margin-top:10px;
        margin-right:80px
        margin-top: 4%;
        border: 2px rgb(202, 158, 93) solid;
      }
  </style>
  
  <body>
  
<div class="card">
  <div class="card-header">
    Student Info Management
  </div>
  <div class="card-body">
    <h5 class="card-title">List of Students</h5>
    <h4>admin <c:out value="${admin}"/></h4>
	<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add student</a>
	<a href="<%=request.getContextPath()%>/logout" class="btn btn-success">Logout</a>
  </div>
      <table class="table table-striped" id="stutable">
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Gender</th>
            <th scope="col">Contact</th>
            <th scope="col">State</th>
            <th scope="col">City</th>
            <th scope="col">College</th>
            <th scope="col">Dob</th>
            <th scope="col">Actions</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}">
          <tr>
            <th scope="row"><c:out value="${student.id}"/></th>
            <td><c:out value="${student.name}"/></td>
            <td><c:out value="${student.email}"/></td>
            <td><c:out value="${student.gender}"/></td>
            <td><c:out value="${student.contact}"/></td>
            <td><c:out value="${student.state}"/></td>
            <td><c:out value="${student.city}"/></td>
            <td><c:out value="${student.college}"/></td>
            <td><c:out value="${student.dob}"/></td>
            <td><a href="edit?id=<c:out value='${student.id}'/>">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="remove?id=<c:out value='${student.id}'/>">Delete</a></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
</div>

	<c:if test="${not empty status}">
		<script type="text/javascript">
		window.addEventListener("load",function(){
			alert("${status}");
		});
		</script>
	</c:if>
	<c:remove var="status" scope="session"/>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>