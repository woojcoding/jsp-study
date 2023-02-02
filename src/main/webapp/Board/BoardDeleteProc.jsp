<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 8:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String pass = request.getParameter("password");
    int num = Integer.parseInt(request.getParameter("num"));

    BoardDAO boardDAO = new BoardDAO();
    String password = boardDAO.getPass(num);

    //기존 password와 form에서 작성한 pass 비교

    if (password.equals(pass)) {
        boardDAO.deleteBoard(num);

        response.sendRedirect("BoardList.jsp");
    } else {
%>
    <script>
        alert("패스워드가 일치하지 않습니다.")
        history.go(-1);
    </script>
<%
    }
%>
</body>
</html>
