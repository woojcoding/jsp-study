<%@ page import="model.MemberDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="model.MemberBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-01
  Time: PM 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <!-- 1. DB에서 모든 회원의 정보를 가져옴 2. table 태그를 이용하여 화면에 회원들의 정보를 출력 -->

  <%
    MemberDAO memberDAO = new MemberDAO();

    //가변길이 Vector를 이용하여 데이터를 저장해준다.
    Vector<MemberBean> vector = memberDAO.allSelectMember();

  %>

  <center>
    <h2> 모든 회원 보기</h2>
    <table width="800" border="1">
      <tr height="50">
        <td align="center" width="150"> 아이디 </td>
        <td align="center" width="250"> 이메일 </td>
        <td align="center" width="200"> 전화번호 </td>
        <td align="center" width="200"> 취미 </td>
      </tr>
      <%
        for(int i = 0; i< vector.size(); i++) {
          MemberBean bean = vector.get(i);

      %>
      <tr height="50">
        <td align="center" width="150">
          <a href="MemberInfo.jsp?id=<%=bean.getId()%>">
          <%=bean.getId()%></a></td>
        <td align="center" width="250"> <%=bean.getEmail()%>> </td>
        <td align="center" width="200"> <%=bean.getTel()%> </td>
        <td align="center" width="200"> <%=bean.getHobby()%> </td>
      </tr>
      <% } %>
    </table>
  </center>
</body>
</html>
