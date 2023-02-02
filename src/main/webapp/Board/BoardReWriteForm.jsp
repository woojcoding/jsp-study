<%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <center>
    <h2> 답변글 입력하기</h2>
    <%
      // 게시글 읽기에서 답변 글 쓰기 클릭시 넘겨주는 데이터를 받음
      int num = Integer.parseInt(request.getParameter("num"));
      int ref = Integer.parseInt(request.getParameter("ref"));
      int re_step = Integer.parseInt(request.getParameter("re_step"));
      int re_level = Integer.parseInt(request.getParameter("re_level"));
    %>

      <table width="600" border="1" bgcolor="#808080">
        <form action="BoardReWriteProc.jsp" method="post">
        <tr height="40">
          <td width="150" align="center"> 작성자 </td>
          <td width="450" align="center">
            <input type="text" name="writer" size="60">
          </td>
        <tr height="40">
          <td width="150" align="center"> 제목 </td>
          <td width="450" align="center">
            <input type="text" name="subject" value="[답변]" size="60">
          </td>
        <tr height="40">
          <td width="150" align="center"> 이메일 </td>
          <td width="450" align="center">
            <input type="email" name="email" size="60">
          </td>
        </tr>
        <tr height="40">
          <td width="150" align="center"> 비밀번호 </td>
          <td width="450" align="center">
            <input type="password" name="password" size="60">
          </td>
        </tr>
        <tr height="40">
          <td width="150" align="center"> 글내용 </td>
          <td width="450" align="center">
            <textarea rows="10" cols="60" name="content"></textarea>
          </td>
        </tr>
        <!-- form에서 사용자로부터 입력받지 않고 데이터를 넘김 -->
        <tr height="40">
          <td align="center" colspan="2">
            <input type="hidden" name="ref" value="<%=ref%>">
            <input type="hidden" name="re_step" value="<%=re_step%>">
            <input type="hidden" name="re_level" value="<%=re_level%>">
            <input type="submit" value="답글쓰기완료"> &nbsp;&nbsp;
            <input type="reset" value="취소"> &nbsp;&nbsp;
        </form>
            <input type="button" onclick="location.href='BoardList.jsp'"
                   value="전체글보기">
          </td>
        </tr>
      </table>
  </center>
</body>
</html>
