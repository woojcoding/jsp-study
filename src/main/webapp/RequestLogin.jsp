<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-01-23
  Time: PM 2:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
     <center>
        <h2> 로그인 페이지 </h2>

         <form action="RequestLoginProc.jsp" method="post"> <%-- 보내고자 하는 데이터 부분을 form으로 묶어주자  // action :이 페이지에서 작성한 정보를 떠 넘겨주는 파일명 기술하는 공간 method : 전송 방식--%>
            <%-- table을 생성하고 tr로 열을 생성해 준다. td로는 셀을 만들어 준다 input의 name을 지정해야 정보를 읽어들일 수 있다. --%>
             <table width="400" border="1">
                 <tr>
                     <td align="center", width="150"> 아이디 </td>
                     <td align="left", width="250">
                         <input type="text" name="id">
                     </td>
                 </tr>
                 <tr height="60">
                    <td align="center", width="150"> 패스워드 </td>
                    <td align="left", width="250">
                     <input type="password" name="pass">
                    </td>>
                 </tr>
                 <tr height ="60">
                     <td colspan="2" align="center">
                         <input type="submit" value="전송"> <%--submit 누르면  폼에 지정해둔 jsp로 이동하게 된다. --%>
                     </td>
                 </tr>
             </table>
         </form>
     </center>
</body>
</html>
