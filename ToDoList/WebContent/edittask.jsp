<%@page import="com.todo.dbconnection.UserConnection"%>
<jsp:useBean id="t" class="com.todo.bean.Task"></jsp:useBean>
<jsp:setProperty property="*" name="t"/>

<!-- 
	Calls the method update for tasks.
 -->
 
<%
	int i=UserConnection.update(t);
	response.sendRedirect("viewtodolist.jsp");
%>