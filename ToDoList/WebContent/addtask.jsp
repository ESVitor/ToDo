<%@page import="com.todo.dbconnection.UserConnection"%>
<jsp:useBean id="t" class="com.todo.bean.Task"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>

<!-- 
	Calls the method to save a new task.
	Retun i=1 if the task was created.
 -->
<%
	int i=UserConnection.saveTask(t);
	if(i>0){
		response.sendRedirect("viewtodolist.jsp");
	}else{
		response.sendRedirect("viewtodolist.jsp");
	}
%>