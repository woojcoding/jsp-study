<%@ page import="model.BoardDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 8:06
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
  <jsp:useBean id="boardBean" class="model.BoardBean">
      <jsp:setProperty name="boardBean" property="*"/>
  </jsp:useBean>
<%
    //DB에서 글번호를 기준으로 패스워드를 가져옴
    BoardDAO boardDAO = new BoardDAO();
    String pass = boardDAO.getPass(boardBean.getNum());

    //기존 패스워드와 수정 요청시 패스워드와 같은지 비교
    if (pass.equals(boardBean.getPassword())) {
        boardDAO.updateBoard(boardBean);

        response.sendRedirect("BoardList.jsp");
    } else {
%>
    <script type="text/javascript">
        alert("패스워드가 일치하지 않습니다.");
        history.go(-1);
    </script>
<%
    }
%>
</body>
</html>
