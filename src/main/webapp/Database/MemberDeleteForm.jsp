<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: AM 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>회원 정보 수정하기</h2>
<center>
    <table width="400" border="1">
        <form action="MemberDeleteProc.jsp" method="post">
            <tr height="50">
                <td width="150" align="center"> 아이디 </td>
                <td width="250"> <%=request.getParameter("id")%> </td>
            </tr>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 패스워드 </td>
                <td width="250"><input type="password" name="pass1"> </td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2" >
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <input type="submit" value="회원삭제하기"> &nbsp;&nbsp;
        </form>
        <button onclick="location.href='MemberList.jsp'"> 회원 전체 보기</button>
        </td>
        </tr>
    </table>
</center>
</body>
</html>
