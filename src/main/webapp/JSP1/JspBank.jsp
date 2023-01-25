<%@ page import="java.io.FilterOutputStream" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-19
  Time: PM 3:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public void increment() { // service 메소드안에 메소드가 들어갈 수 없으니 선언문에 메소드를 작성한다
    }                         // 실무에선 class를 만들고 그 안에 메소드를 구현한다.
%>
<%!
    int a = 10; // 멤버 변수
%>
<%
    int a = 100; // 지역 변수
%>
<%
    int a = 1; // -> 에러 발생 : 지역 변수는 중복될 수 없기에 에러가 발생한다.
%>

</body>
</html>
