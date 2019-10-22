<%@page import="com.todo.dbconnection.UserConnection"%>
<jsp:useBean id="t" class="com.todo.bean.Task"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>

<!-- 
	Calls the delete method, where a 
	task will be deleted.
 -->
<%
	UserConnection.delete(t);
	response.sendRedirect("viewtodolist.jsp");
%>