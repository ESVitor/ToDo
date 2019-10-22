<%@page import="com.todo.dbconnection.UserConnection"%>
<jsp:useBean id="u" class="com.todo.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<!-- 
	Calls the connect method to validate a sign in.
 -->
<%
	int i=UserConnection.connect(u);
	if(i==1){
		response.sendRedirect("viewtodolist.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
%>