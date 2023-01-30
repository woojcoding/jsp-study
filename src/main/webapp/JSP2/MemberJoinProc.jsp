<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-29
  Time: PM 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <center>
    <h2> 회원 정보 보기 </h2>
      <%
        request.setCharacterEncoding("utf-8");
      %>
      <!-- request로 넘어온 데이터를 자바빈즈와 매핑시켜주는 userBean -->
      <jsp:useBean id="mbean" class="main.bean.MemberBean"> <!-- 객체생성 MemberBean mbean = new MemberBean() -->
        <!-- JSP 내용을 자바빈 클래스에 데이터를 매핑 -->
          <jsp:setProperty name="mbean" property="*"/>
      </jsp:useBean>

      <h2> 당신의 아이디는 <jsp:getProperty name="mbean" property="id"/> </h2>
      <h2> 당신의 비밀번호는 <jsp:getProperty name="mbean" property="pass1"/> </h2>
      <h2> 당신의 이메일은 <jsp:getProperty name="mbean" property="email"/> </h2>

      <%= mbean.getTel() %>

  </center>

</body>
</html>
