<!DOCTYPE html>
<!-- 
	This file contains the form to update a existing user.
 -->
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Edit Form</title>
	</head>
	<style>
		body {font-family: lato;}
		form {
			border: 3px solid #f1f1f1;
			text-align: right;
			display: -webkit-inline-box;
			background: rgba(0,0,0,0.5);
			color: #fff;
			position: absolute;
			width: 320px;			
			top: 30%;
    		left: 37%;
		}
		
		input {
		  background-color: #ffffff54;
		  color: white;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: auto;
		  padding: 10px 18px;
		  background-color: #a5a5a5;
		}
		
		button:hover {
		  opacity: 0.8;
		}
		
		#createUser{
			float: right;
			color: white;
			text-decoration: none;
			background: #7f7f7f;
			padding: 10px;
		}	
	</style>
	<body>
		<%@page import="com.todo.dbconnection.UserConnection,com.todo.bean.User"%>
	
		<%
		String id=request.getParameter("id");
		User u=UserConnection.getRecordById(Integer.parseInt(id));
		%>
	
		<h1>Edit Form</h1>
		<form action="edituser.jsp" method="post">
			<table>
				<tr><td>First Name:</td><td><input type="text" name="firstName"/></td></tr>
				<tr><td>Last Name:</td><td><input type="text" name="lastName"/></td></tr>
				<tr><td>User Name:</td><td><input type="text" name="userName"/></td></tr>
				<tr><td>Password:</td><td><input type="password" name="password"/></td></tr>
				</td></tr>
				<tr><td colspan="2"><input type="submit" value="Add User"/></td></tr>
			</table>
		</form>	
	</body>
</html>