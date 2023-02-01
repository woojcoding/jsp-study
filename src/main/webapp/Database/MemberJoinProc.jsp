<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-30
  Time: PM 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        request.setCharacterEncoding("utf-8"); // 한글 처리

        //취미 부분은 별도로 읽어서 다시 빈 클래스에 저장
        String[] hobby = request.getParameterValues("hobby");
        String texthobby = "";

        for (String s : hobby) {
            texthobby += s;
        }

    %>
    <!-- usebean을 사용하여 한꺼번에 데이터를 받아오기 -->
    <jsp:useBean id="mbean" class="model.MemberBean">
        <jsp:setProperty name="mbean" property="*" /> <!-- 매핑 시키시오-->
    </jsp:useBean>
    <%
        mbean.setHobby(texthobby); // 배열 주소가 저장된 것을 for문 돌려서 저장해준다.

        MemberDAO memberDAO = new MemberDAO();

        memberDAO.insertMember(mbean);

        //회원 가입 후 회원 정보 보여주는 페이지로 이동시킴
        response.sendRedirect("MemberList.jsp");
    %>



</body>
</html>
