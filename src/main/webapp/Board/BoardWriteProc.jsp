<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 2:42
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
  <!-- 게시글 작성한 데이터를 BoardBean으로 한번에 받는다. -->
  <jsp:useBean id="boardBean" class="model.BoardBean">
    <jsp:setProperty name="boardBean" property="*"/>
  </jsp:useBean>

  <%
    BoardDAO boardDAO = new BoardDAO();

    boardDAO.insertBoard(boardBean);

    response.sendRedirect("BoardList.jsp");
  %>
</body>
</html>
