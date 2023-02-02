<%@ page import="model.MemberDAO" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-01
  Time: PM 8:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 1. DB에서 한명의 회원의 정보를 가져옴 2. table 태그를 이용하여 화면에 회원들의 정보를 출력 -->
    <%
        String id = request.getParameter("id");

        MemberDAO memberDAO = new MemberDAO();
        MemberBean mbean = memberDAO.oneSelectMember(id);
    %>
    <h2>회원 정보 보기</h2>
    <center>
        <table width="400" border="1">
            <tr height="50">
                <td width="150" align="center"> 아이디 </td>
                <td width="250"> <%=mbean.getId()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 이메일 </td>
                <td width="250"> <%=mbean.getEmail()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 전화 </td>
                <td width="250"> <%=mbean.getTel()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 취미 </td>
                <td width="250"> <%=mbean.getHobby()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 직업 </td>
                <td width="250"> <%=mbean.getJob()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 나이 </td>
                <td width="250"> <%=mbean.getAge()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center"> 정보 </td>
                <td width="250"> <%=mbean.getInfo()%> </td>
            </tr>
            <tr height="50">
                <td width="150" align="center" colspan="2" >
                    <button onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'"> 회원 수정 </button>  <!-- form이 아니기에 JS가 적용된 이 방식을 사용해야 한다. -->
                    <button onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'"> 회원 삭제 </button>
                    <button onclick="location.href='MemberList.jsp'"> 목록 보기 </button>
                    <button onclick="location.href='MemberJoin.jsp'"> 회원가입 </button>
                </td>
            </tr>
        </table>
    </center>
</body>
</html>
