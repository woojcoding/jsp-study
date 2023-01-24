<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-24
  Time: PM 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8");

        //db가 없기에 임의로 id와 pass 설정
        String dbId = "aaaa";
        String dbPass = "1234";

        // 사용자로부터 로그인을 통해 넘어온 데이터를 받아줌
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");

        if(dbId.equals(id) && dbPass.equals(pass)) {

            //아이디와 패스워드가 일치한다면 main 페이지를 보여준다.
            response.sendRedirect("ResponseMain.jsp?id="+id);
        } else {

    %>
        <script>
            alert("아이디와 패스워드가 일치하지 않습니다.");
            history.go(-1); //이전 페이지로 이동
        </script>
    <%
        }
    %>
</body>
</html>
