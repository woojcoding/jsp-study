<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 6:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <center>
    <h2> 게시글 수정</h2>
  <%
    int num = Integer.parseInt(request.getParameter("num").trim());

    BoardDAO boardDAO = new BoardDAO();

    BoardBean bean = boardDAO.getOneUpdateBoard(num);
  %>

    <table width="600"  border="1" bgcolor="#808080">
      <form action="BoardUpdateProc.jsp" method="post">
       <tr heigh="=40">
         <td width="120" align="center"> 작성자 </td>
         <td width="180" align="center"><%=bean.getWriter()%></td>
         <td width="120" align="center"> 작성일 </td>
         <td width="180" align="center"><%=bean.getReg_date()%></td>
       </tr>
      <tr heigh="=40">
        <td width="120" align="center"> 제목 </td>
        <td width="480" colspan="3">
          &nbsp; <input type="text" name="subject" value="<%=bean.getSubject()%>" size="60">
        </td>
      </tr>
      <tr heigh="=40">
        <td width="120" align="center"> 패스워드 </td>
        <td width="480" colspan="3">
          &nbsp; <input type="password" name="password" size="60">
        </td>
      </tr>
      <tr heigh="=40">
        <td width="120" align="center"> 글내용 </td>
        <td width="480" colspan="3">
          <textarea rows="10" cols="60" name="content" style="text-align: left"><%=bean.getContent()%></textarea>
        </td>
      </tr>
      </tr>
      <tr heigh="=40">
        <td colspan="4" align="center">
          <input type="hidden" name="num" value="<%=bean.getNum()%>">
          <input type="submit" value="글수정"> &nbsp;&nbsp; &nbsp;&nbsp;
      </form>
          <input type="button" onclick="location.href='BoardList.jsp'" value="전체글 보기">
        </td>
      </tr>

    </table>

  </center>
</body>
</html>
