<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-28
  Time: PM 8:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2> 이 페이지는 로그인 정보가 넘어오는 페이지 입니다.</h2>

    <%
        request.setCharacterEncoding("utf-8"); // post 방식 한글 처리

        String id = request.getParameter("id"); // request 객체에 담겨진 사용자 정보 중 id만 추출

        //response.sendRedirect("ResponseRedirect.jsp"); //흐름 제어 -> 페이지 자체를 이동하며 데이터는 사라짐
        //response.sendRedirect("ResponseRedirect.jsp?id="+id) // sendRedirect를 이렇게하면 id 넘길 수 있음
    %>

    <jsp:forward page="ResponseRedirect.jsp">
        <jsp:param name="id" value="ddddd"/>
        <jsp:param name="phone" value="010-1111-1111"/>
    </jsp:forward>
        <!-- 흐름 제어 -> forward 액션태그의 경우 forward 시킬 페이지를  이 페이지에서 보여준다. -->
    <!-- param 액션태그를 사용하여 원하는 데이터로 변경하여 보낼 수 있다. -->


</body>
</html>
