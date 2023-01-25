<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-25
  Time: PM 4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!-- TOP -->
    <table width="800">
        <tr height="100">
            <!-- 로고 이미지 -->
            <td colspan="2", align="center" width="130">
                <img src="/img/logo.png" width="200" height="70">
            </td>
            <td colspan="5" align="center">
                <font size="10"> 우주 캠핑 </font>
            </td>
        </tr>
        <tr height="50">
            <td width="110" align="center"> 텐트 </td>
            <td width="110" align="center"> 의자 </td>
            <td width="110" align="center"> 식기류 </td>
            <td width="110" align="center"> 침낭 </td>
            <td width="110" align="center"> 테이블 </td>
            <td width="110" align="center"> 화롯대 </td>
            <td width="140" align="center"><%=request.getParameter("id") %> </td>
        </tr>

    </table>

</body>
</html>
