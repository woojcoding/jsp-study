<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-24
  Time: PM 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
    String name = "네임";
  %>
  스트립트로 표현 시 <%=name%>이 화면에 출력.
  <p>
  <%
    out.println(name + "이 화면에 출력.");
  %>



</body>
</html>
