<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- 
	This form will first call the connect file to validate the user.
	If the userName and password match in the database the user will see the viwtodolist file,
	with the list of tasks.
 -->
 
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>ToDo application</title>
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
		<a id="createUser" href="adduserform.jsp">Create User</a>		
		
		<form id="form" action="viewtodolist.jsp" method="post">
			<table>
				<th colspan="2">Sign in</th>
				<tr><td>User Name:</td><td><input type="text" name="userName"/></td></tr>
				<tr><td>Password:</td><td><input type="password" name="password"/></td></tr>
				<tr><td colspan="2"><input type="submit" value="Sign in"/></td></tr>
			</table>
		</form>	
	</body>
</html>