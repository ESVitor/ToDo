<%@page import="com.todo.dbconnection.UserConnection"%>
<jsp:useBean id="u" class="com.todo.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<!-- 
	Calls the method to save a new user.
	Retun i=1 if user is created.
 -->
<%
	int i=UserConnection.save(u);
	if(i>0){
		response.sendRedirect("adduser-success.jsp");
	}else{
		response.sendRedirect("adduser-error.jsp");
	}
%>