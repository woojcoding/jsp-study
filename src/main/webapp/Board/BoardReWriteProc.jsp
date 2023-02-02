<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 5:49
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
  <jsp:useBean id="boarBean" class="model.BoardBean">
    <jsp:setProperty name="boarBean" property="*"/>
  </jsp:useBean>
  <%
    BoardDAO boardDAO = new BoardDAO();
    boardDAO.reWriteBoard(boarBean);

    response.sendRedirect("BoardList.jsp");
  %>
</body>
</html>
