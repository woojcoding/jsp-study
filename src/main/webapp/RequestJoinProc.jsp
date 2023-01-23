<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-23
  Time: PM 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h2> 회원 정보 보기</h2>
    <%
        // post 방식으로 데이터 넘어올 때 한글이 깨지는 것 방지.
        request.setCharacterEncoding("UTF-8");
        // 각종 사용자로부터 넘어온 데이터 저장.
        String id = request.getParameter("id");
        String pass1 = request.getParameter("pass1");
        String pass2 = request.getParameter("pass2");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        // 취미는 정보가 여러개 올 수 있기에 배열 타입으로 받기
        String[] hobbies = request.getParameterValues("hobby");

        String job = request.getParameter("job");
        String age = request.getParameter("age");
        String info = request.getParameter("info");

        if(!pass1.equals(pass2)) {
    %>
        <script type="text/javascript">
            alert("비밀번호가 틀립니다."); // 경고창
            history.go(-1); // 이전 페이지로 이동
        </script>
    <%
        }
    %>

    <table width="500" border="1">
        <tr height="50">
            <td width="150", align="center" > 아이디 </td>
            <td width="350", align="center"><%= id%> </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 이메일 </td>
            <td width="350", align="center"><%= email%> </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 전화번호 </td>
            <td width="350", align="center"><%= tel%> </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 당신의 관심분야 </td>
            <td width="350", align="center">
            <%
                for (int i = 0; i < hobbies.length; i++) {
                    out.write(hobbies[i] + " ");
                }
            %>
            </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 직업은? </td>
            <td width="350", align="center"><%= job%> </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 연령은? </td>
            <td width="350", align="center"><%= age%> </td>
        </tr>
        <tr height="50">
            <td width="150", align="center"> 하고싶은말 </td>
            <td width="350", align="center"><%= info%> </td>
        </tr>
    </table>

</center>
</body>
</html>
