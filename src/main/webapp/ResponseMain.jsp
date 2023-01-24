<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-24
  Time: PM 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    request.setCharacterEncoding("utf-8");
  %>
    <h2> <%= request.getParameter("id")%> 님 반갑습니다.</h2>
</body>
</html>
