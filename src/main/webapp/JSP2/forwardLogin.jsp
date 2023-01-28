<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-25
  Time: PM 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <center>
        <form action="ResponseProc.jsp" method="post">
        <table width="400">
            <tr height="50">
                <td align="center" width="150"> 아이디 </td>
                <td width="200">
                    <input type="text" name="id">
                </td>
            </tr>
            <tr height="50">
                <td align="center" width="150"> 패스워드 </td>
                <td width="200">
                    <input type="password" name="id">
                </td>
            </tr>
            <tr height="50">
                <td align="center" colspan="2">
                    <input type="submit" value="로그인"> &nbsp; &nbsp;
                    <input type="reset" value="취소">
                </td>
            </tr>
        </table>
        </form>
    </center>
</body>
</html>
