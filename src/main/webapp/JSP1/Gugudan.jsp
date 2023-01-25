<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-19
  Time: PM 2:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>구구단</title>
</head>
<body>
<h2> 구구단을 출력해보자</h2>
    <%
      for(int i = 2; i<=9; i++) {
        for(int j = 1; j <=9; j++) {

            System.out.println(i + "*" + j + " = " + i*j );
    %>
        <%=i%> * <%=j%> = <%= i*j%>&nbsp; &nbsp;
    <%

        }
    %>
        <br>
    <%
      }
    %>
    <br>
    <h2> 다른 방식으로 구구단 출력</h2>

<%
    for(int i = 2; i<=9; i++) {
        for(int j = 1; j <=9; j++) {
            out.write(i + " * " + j + " = " + i*j +" ");
        }
    }
%>
</body>
</html>
