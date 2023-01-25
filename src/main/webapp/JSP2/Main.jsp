<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-25
  Time: PM 7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <center>
    <table width="800" border="1">
      <!-- top -->
      <tr height="150">
        <td align="center" colspan="2">
          <jsp:include page="TOP.jsp">
            <jsp:param name="id" value="wooj"/> <!-- 액션 태크 include 사용 시 TOP.JSP로 파라미터를 넘길 수 있다. 반면 페이지 디렉티브 include로는 불가능하다 -->
          </jsp:include>
        </td>
      </tr>
      <!-- left -->
      <tr height="400">
        <td align="center" width="200">
          <jsp:include page="Left.jsp"/>
        </td>
      <!-- center -->
        <td align="center" width="600">
          <jsp:include page="Center.jsp"/>
        </td>
      </tr>
      <!-- bottom -->
      <tr height="100">
        <td align="center" colspan="2">
          <jsp:include page="Bottom.jsp"/>
        </td>
      </tr>
    </table>

  </center>
</body>
</html>
