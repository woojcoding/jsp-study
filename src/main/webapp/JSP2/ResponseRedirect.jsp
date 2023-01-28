<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-28
  Time: PM 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <h2> 이 페이지는 ResponseRedirect.jsp 페이지 입니다.</h2>

  <%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String phone = request.getParameter("phone");
  %>

<h3> 아이디 = <%=id %></h3> &nbsp; <h3> 폰 = <%=phone%></h3>
</body>
</html>
