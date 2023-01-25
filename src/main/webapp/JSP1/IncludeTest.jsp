<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-25
  Time: PM 3:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table width="600" border="1">
        <!-- TOP-->
        <tr height="150">
            <td width="600" align="center">
            <%@ include file="Top.jsp"%>
            </td>
        </tr>

        <!-- Center -->
        <tr height="400">
            <td width="600" align="center">
            <img src="../img/canon.png" width="400" height="300">
            </td>
        </tr>

        <!-- Bottom -->
        <tr height="100">
            <td width="600" align="center">
                <%@include file="Bottom.jsp"%>
            </td>
        </tr>
    </table>
</body>
</html>
