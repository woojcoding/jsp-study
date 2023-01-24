<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-24
  Time: PM 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String name1 = (String) session.getAttribute("name1");
    %>
    <%= name1%> 님 반갑습니다.
</body>
</html>
