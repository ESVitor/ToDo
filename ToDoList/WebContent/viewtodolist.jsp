<!DOCTYPE html>

<!-- 
	This file contains the main view of the application.
	Here we can see the list of tasks, create, read, update and delete a specific task.
 -->

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View ToDo List</title>
	</head>
	<style>
		body {
			font-family: lato;
			padding-left: 5%;
			padding-right: 5%;
		}
		form {
			border: 3px solid #f1f1f1;
			text-align: left;
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
		#deleteButton{
			float: right;
			color: white;
			text-decoration: none;
			background: #7f7f7f;
			padding: 5px;
		}
		
		#signOut{
			float: right;
			color: white;
			text-decoration: none;
			background: #7f7f7f;
			padding: 10px;
		}
		#addNewTask{
			border: currentColor;
			display:none
		}
		#tableTask{
			border: currentColor;
			display: inline-table;			
		}
		#tableDisplay{
			border: currentColor;
			display: inline-table;
			padding-right: 5%;
		}
		
	
	</style>	
	<body>
		<%@page import="com.todo.dbconnection.UserConnection,com.todo.bean.*,java.util.*"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
		<jsp:useBean id="u" class="com.todo.bean.User"></jsp:useBean>
		<jsp:setProperty property="*" name="u"/>
		
						
		<a id="signOut" href="index.jsp">Sign out</a>
		
		<h1>ToDo List</h1>
		
		<%
		List<Task> list=UserConnection.connect(u);		
			request.setAttribute("list",list);
		%>
		
		<button type="button" id="edit" onclick="doAddNewTask()">Create new Task</button>
		<form id="addNewTask" action="addtask.jsp" method="post">
			<table>
				<tr><td>userId:</td><td><input type="text" name="userId"/></td></tr>
				<tr><td>Description:</td><td><input id="limitDescription" type="text" name="description"/></td></tr>
				<tr><td>Text:</td><td><input type="text" name="text"/></td></tr>				
				<tr><td colspan="3"><input type="submit" value="Save task"/></td></tr>
			</table>
		</form>	
		<br>
		<table id="tableTask" border="1"">
			<tr><th colspan="5">Tasks</th></tr>
			<c:forEach items="${list}" var="t">
				<tr>
					<td><input type="checkbox" id="myCheck"  onclick="doComplete()"></td>
					<td id="complete">Task in progress...</td>
					<td>${t.getDescription()}</td>				
					<td><button type="button" id="edit" onclick="doEdit('${t.getId()}', '${t.getLastUpDated()}', '${t.getDescription()}', '${t.getText()}')">View Task</button></td>
					<td><a id="deleteButton" href="deletetask.jsp?id=${t.getId()}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>		
		<table id="tableDisplay" border="1" style="width:40%;float:right;">	
			<tr><td id="lastUpDated" style="width:200;" name="lastUpDated"></td></tr>
			<tr><td><textarea id="description" rows="1" cols="80" name="description"></textarea></td></tr>			
			<tr><td><textarea id="text" rows="20" cols="80" name="text"></textarea></td></tr>
		</table>
		
		<script>
			function doComplete() {
			  // Get the checkbox
			  var checkBox = document.getElementById("myCheck");
			  // Get the output text
			  var complete = document.getElementById("complete");
		
			  // If the checkbox is checked, display the output text
			  if (checkBox.checked == true){
				  document.getElementById("complete").innerHTML = "Task completed!";	
			  } else {
				  document.getElementById("complete").innerHTML = "Task in progress...";
			  }
			}
			function doEdit(id, lastUpDated, description, text){
				
			  
			  document.getElementById("lastUpDated").innerHTML = "Last UpDated: " + lastUpDated;	
			  document.getElementById("description").innerHTML = "Description: " + description;			  
			  document.getElementById("text").innerHTML = "text:\n " + text;
			}	
			function doAddNewTask(){
			  var addNewTask = document.getElementById("addNewTask");
			  addNewTask.style.display = "block";
			}
		</script>
	</body>
</html>