<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-23
  Time: PM 3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- Request의 범위는 submit을 누르고 넘어간 페이지까지이다.--%>

<%
  String id = request.getParameter("id");  // null
  String pass = request.getParameter("pass"); // null
%>
    request에는 정보가 안담겨 있기에 null이 나오게 된다.<br>
    당신의 아이디는 <%= id%> 이고 패스워드는 <%= pass%> 입니다.
</body>
</html>
