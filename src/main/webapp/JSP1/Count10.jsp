<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-19
  Time: PM 1:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2> 1 - 10 까지의 숫자를 화면에 표시하기</h2>
<%
  //1~10까지 숫자를 화면에 출력하시오.
    for(int i =1; i <= 10; i++) {
        System.out.println(i); // 이 경우 콘솔창에 숫자가 출력된다.
%>
        <%= i %><br>
<%
    }  //표현식은 스크립트릿 밖에 써준다
%>


</body>
</html>
