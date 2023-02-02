<%@ page import="java.util.Vector" %>
<%@ page import="model.BoardDAO" %>
<%@ page import="model.BoardBean" %><%--
  Created by IntelliJ IDEA.
  User: 82103
  Date: 2023-02-02
  Time: PM 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <center>
        <h2> 전체 게시글 보기</h2>
        <!-- 게시글 보기에서 카운터링을 설정하기 위한 변수들을 선언 -->
        <%
            int pageSize = 10;  // 화면에 보여질 게시글의 개수

            String pageNum = request.getParameter("pageNum"); // 현재 카운터를 클릭한 번호

            if (pageNum == null) { // 다른 페이지에서 이 페이지로 넘어올 경우의 null처리
                pageNum = "1";
            }
            int count = 0; // 전체 글의 개수

            int number = 0; // 페이지 넘버링

            int currentPage = Integer.parseInt(pageNum); // 현재 페이지의 숫자

            BoardDAO boardDAO = new BoardDAO();

            // 전체 게시글의 개수 확인하는 메서드 호출
            count = boardDAO.getAllCount();
            // 현재 페이지에 보여줄 시작번호를 설정(DB에서 불러올 시작번호)
            int startRow = (currentPage-1)*pageSize+1; // 1,11,21 ...
            int endRow = currentPage*pageSize; // 10,20,30 ...
            // 테이블에 표시할 번호 지정
            number = count - (currentPage -1)*pageSize;

            // 최신글 10개를 기준으로 게시글을 리턴받는 메서드 호출
            Vector<BoardBean> vector = boardDAO.getAllBoard(startRow, endRow);
        %>
        <table width="700" border="1" bgcolor="#808080">
            <tr height="40">
                <td align="right" colspan="5">
                    <input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
                </td>
            </tr>
            <tr height="40">
                <td width="50" align="center"> 번호 </td>
                <td width="320" align="center"> 제목 </td>
                <td width="100" align="center"> 작성자 </td>
                <td width="150" align="center"> 작성일 </td>
                <td width="80" align="center"> 조회수 </td>
            </tr>
    <%
        for(int i = 0; i < vector.size(); i++) {
            BoardBean bean = vector.get(i);
    %>
            <tr height="40">
                <td width="50" align="center"> <%=number--%> </td>
                <td width="320" align="Left">
                    <a href="BoardInfo.jsp?num=<%=bean.getNum()%>" style="text-decoration:none"/>
                <%
                    if(bean.getRe_step() > 1) {
                        for(int j = 0; j < (bean.getRe_step() - 1) * 3; j++) {
                %>&nbsp;
                <%      }
                    }
                %>
                    <%=bean.getSubject()%> </td>
                <td width="100" align="center"> <%=bean.getWriter()%> </td>
                <td width="150" align="center"> <%=bean.getReg_date()%> </td>
                <td width="80" align="center"> <%=bean.getReadCount()%> </td>
            </tr>
    <% } %>
        </table>
        <p><!-- 페이지 카운터링 소스를  작성-->
        <%
            if (count > 0) {
                int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 카운터링 숫자를 얼마까지 보여줄 것인지 결정

                int startPage = 1; // 시작 페이지 숫자

                if (currentPage % 10 != 0) {
                    startPage = (int) (currentPage / 10) * 10 + 1;
                } else {
                    startPage = (int) ((currentPage / 10 ) - 1) * 10 + 1;
                }
                int pageBlock = 10; // 카운터링 처리 숫자
                int endPage = startPage + pageBlock - 1; // 페이지 마지막 숫자

                if (endPage > pageCount) endPage = pageCount;

                // 이전 링크 만들지 파악
                if (startPage > 10) {
        %>
            <a href="BoardList.jsp?pageNum=<%=startPage-10%>"> [이전] </a>
        <%
                }
                //페이지 처리
                for (int i = startPage; i <= endPage; i++) {
        %>
            <a href="BoardList.jsp?pageNum=<%=i%>"> [<%=i%>] </a>
        <%
                }
                // 다음이라는 링크 만들지 파악
                if (endPage < pageCount) {
        %>
            <a href="BoardList.jsp?pageNum=<%=startPage+10%>"> [다음] </a>
        <%
                }
            }
        %>

        </p>
    </center>
</body>
</html>
