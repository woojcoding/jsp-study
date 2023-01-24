<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-24
  Time: PM 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2> 세션 연습 </h2>
    <%
        String name = "woojcoding";

        // 세션을 이용하여 데이터를 유지 -> 모든 페이지에서 데이터 사용이 가능해진다.
        session.setAttribute("name1",name);
        // 세션 유지 시간
        session.setMaxInactiveInterval(10); // 10초간 세션을 유지
    %>
    <a href="SessionName.jsp"> 세션네임페이지로 이동</a>
</body>
</html>
