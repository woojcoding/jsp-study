<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
     BoardDAO boardDAO = new BoardDAO();

     int num = Integer.parseInt(request.getParameter("num"));

        BoardBean bean = boardDAO.getOneUpdateBoard(num);
    %>
<center>
    <h2> 게시글 삭제 </h2>
        <table width="600" border="1" bgcolor="#808080">
            <form action="BoardDeleteProc.jsp" method="post">
            <tr height="40">
                <td width="120" align="center"> 작성자 </td>
                <td width="180" align="center"><%=bean.getWriter()%></td>
                <td width="120" align="center"> 작성일 </td>
                <td width="180" align="center"><%=bean.getReg_date()%></td>
            </tr>
            <tr>
                <td width="120" align="center"> 제목 </td>
                <td align="left" colspan="3"><%=bean.getContent()%></td>
            </tr>
            <tr>
                <td width="120" align="center"> 패스워드 </td>
                <td align="left" colspan="3">
                    <input type="password" name="password" size="60">
                </td>
            </tr>
            <tr>
                <td align="center" colspan="4">
                    <input type="submit" value="글삭제"> &nbsp;&nbsp;
                    <input type="hidden" name="num" value="<%=bean.getNum()%>">
            </form>
                    <input type="button" onclick="location.href='BoardList.jsp'" value="목록보기">
                </td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>
