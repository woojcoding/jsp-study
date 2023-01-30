<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-29
  Time: PM 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2> 회원 가입 </h2>
    <form action="MemberJoinProc.jsp" method="post">
        <table width="500" border="1">
            <tr height="50">
                <td width="150", align="center" > 아이디 </td>
                <td width="350", align="center">
                    <input type="text" name="id" size="40" placeholder="ID를 입력하세요.">
                </td>
            </tr>
            <tr height="50">
                <td width="150", align="center"> 패스워드 </td>
                <td width="350", align="center">
                    <input type="password" name="pass1" size="40" placeholder="영문과 숫자를 조합하여 입력하세요.">
                </td>
            <tr height="50">
                <td width="150", align="center"> 이메일 </td>
                <td width="350", align="center">
                    <input type="email" name="email" size="40">
                </td>
            </tr>
            <tr height="50">
                <td width="150", align="center"> 전화번호 </td>
                <td width="350", align="center">
                    <input type="tel" name="tel" size="40">
                </td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2">
                    <input type="submit" value="회원가입">
                </td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>
