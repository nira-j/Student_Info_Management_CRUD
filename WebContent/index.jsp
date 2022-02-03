<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<style>
      .container{
          padding: 8%;
          color: green;
        }
        form{
            background-color: rgb(102, 192, 102);
      }
  </style>
 <body>
      <div class="container">
          <div class="card text-center">
              <div class="card-header">
                  Student Info Management
                </div>
                <div class="card-body">
                    <label for="exampleInputEmail1"><strong>Admin Console</strong></label>
                <div class="container">
                    <form action="login" method="POST">
                        <div class="form-group">
                          <label for="exampleInputEmail1">Enter Name</label>
                          <input type="text" name="adminname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Admin name">
                        </div>
                        <div class="form-group">
                          <label for="exampleInputPassword1">Enter password</label>
                          <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-success">Login</button>
                      </form>
                </div>
            </div>
      </div>
        <div class="card-footer text-muted">
          
        </div>
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