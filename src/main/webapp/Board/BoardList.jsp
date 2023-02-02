<%@ page import="java.util.Vector" %>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 3:18
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

    Vector<BoardBean> vector = boardDAO.getAllBoard();
  %>

    <center>
        <h2> 전체 게시글 보기</h2>
        <table width="700" border="1" bgcolor="#808080">
            <tr height="40">
                <td width="50" align="center"> 번호 </td>
                <td width="320" align="center"> 제목 </td>
                <td width="100" align="center"> 작성자 </td>
                <td width="150" align="center"> 작성일 </td>
                <td width="80" align="center"> 조회수 </td>
            </tr>
    <%
        for(int i = 0; i < vector.size(); i++) {
            BoardBean bean = vector.get(i);
    %>
            <tr height="40">
                <td width="50" align="center"> <%= i + 1%> </td>
                <td width="320" align="Left">
                    <a href="BoardInfo.jsp?num=<%=bean.getNum()%>"
                       style="text-decoration:none"/>
                <%
                    if(bean.getRe_step() > 1) {
                        for(int j = 0; j < (bean.getRe_step() - 1) * 3; j++) {
                %>&nbsp;
                <%      }
                    }
                %>
                    <%=bean.getSubject()%> </td>
                <td width="100" align="center"> <%=bean.getWriter()%> </td>
                <td width="150" align="center"> <%=bean.getReg_date()%> </td>
                <td width="80" align="center"> <%=bean.getReadCount()%> </td>
            </tr>
    <% } %>
            <tr height="40">  
                <td align="center" colspan="5">
                    <input type="button"
                           value="글쓰기"
                           onclick="location.href='BoardWriteForm.jsp'">
                </td>
            </tr>
        </table>
    </center>
</body>
</html>
