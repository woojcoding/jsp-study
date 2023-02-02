<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: AM 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String id = request.getParameter("id");

    MemberDAO memberDAO = new MemberDAO();
    MemberBean mbean = memberDAO.oneSelectMember(id);
%>
<h2>회원 정보 수정하기</h2>
<center>
    <table width="400" border="1">
        <form action="MemberUpdateProc.jsp" method="post">
        <tr height="50">
            <td width="150" align="center"> 아이디 </td>
            <td width="250"> <%=mbean.getId()%> </td>
        </tr>
        <tr height="50">
            <td width="150" align="center"> 이메일 </td>
            <td width="250"><input type="email" name="email" value="<%=mbean.getEmail()%>"> </td>
        </tr>
        <tr height="50">
            <td width="150" align="center"> 전화 </td>
            <td width="250"><input type="text" name="tel" value="<%=mbean.getTel()%>"> </td>
        </tr>
        </tr>
        <tr height="50">
            <td width="150" align="center"> 패스워드 </td>
            <td width="250"><input type="password" name="pass1"> </td>
        </tr>

        <tr height="50">
            <td align="center" colspan="2" >
                <input type="hidden" name="id" value="<%=mbean.getId()%>">
                <input type="submit" value="회원수정하기"> &nbsp;&nbsp;
        </form>
        <button onclick="location.href='MemberList.jsp'"> 회원 전체 보기</button>
            </td>
        </tr>
    </table>
</center>
</body>
</html>
