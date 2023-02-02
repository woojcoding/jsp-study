package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BoardDAO {
    String id = "system";
    String pass = "123456";
    String url= "jdbc:oracle:thin:@localhost:1521:XE";

    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;

    public void getCon() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(url, id, pass);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertBoard(BoardBean boardBean) {
        getCon();

        int ref = 0; // 글 그룹을 의미 = 쿼리를 실행 시켜 가장 큰 ref를 가져온 후 +1을 해준다
        int re_step = 1;
        int re_level = 1;

        try {
            //가장 큰 ref 값을 가져오는 쿼리
            String refSql = "select max(ref) from board";

            pstmt = con.prepareStatement(refSql);

            rs = pstmt.executeQuery();

            if(rs.next()) {
                ref = rs.getInt(1) + 1; // 글그룹 설정
            }
            // 게시글 값을 테이블에 저장
            String sql = "insert into board " +
                    "values(board_seq.NEXTVAL, ?, ?, ?, ?, sysdate, ?, ?, ?, 0, ?)";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, boardBean.getWriter());
            pstmt.setString(2, boardBean.getEmail());
            pstmt.setString(3, boardBean.getSubject());
            pstmt.setString(4, boardBean.getPassword());
            pstmt.setInt(5,ref);
            pstmt.setInt(6,re_step);
            pstmt.setInt(7,re_level);
            pstmt.setString(8,boardBean.getContent());

            pstmt.executeUpdate();

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
