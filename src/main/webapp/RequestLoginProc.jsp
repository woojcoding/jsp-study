<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-23
  Time: PM 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

<%-- RequestLogin에서 넘어 온 아이디와 패스워드를 읽어낸다.   --%>

<%
    //request에는 사용자 정보가 저장되어있다. getParameter()를 통해 사용자 정보를 추출한다.
    String id = request.getParameter("id"); // 파라미터를 읽어서 변수에 지정.
    String pass = request.getParameter("pass");
%>
    당신의 아이디는 <%= id%> 이고 패스워드는 <%= pass%> 입니다.
    <br>
    <a href="RequestForward.jsp"> 다음페이지</a>
</head>
<body>

</body>
</html>
