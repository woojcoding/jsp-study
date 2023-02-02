<%@ page import="model.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: AM 9:57
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
    %>
    <jsp:useBean id="mbean" class="model.MemberBean">
        <jsp:setProperty name="mbean" property="*"/>
    </jsp:useBean>
    <%
        MemberDAO memberDAO = new MemberDAO();
        //DB에서 가져온 패스워드
        String pass = memberDAO.getPass(mbean.getId());
        // 수정하기 위해 작성한 패스워드 값과 기존 DB에서 가져온 패스워드 비교
        if(mbean.getPass1().equals(pass)) {
            //회원 수정 메서드 호출
            memberDAO.updateMember(mbean);
            response.sendRedirect("MemberList.jsp");
        } else {
    %>
        <script type="text/javascript">
            alert("패스워드가 틀렷습니다.");
            history.go(-1);
        </script>
    <%
        }
    %>

</body>
</html>
