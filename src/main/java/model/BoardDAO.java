package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

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

    public Vector<BoardBean> getAllBoard() {
        Vector<BoardBean> vector = new Vector<>();

        getCon();

        try {
            String sql = "select * from board order by ref desc, re_step asc";

            pstmt = con.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                BoardBean bean = new BoardBean();
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadCount(rs.getInt(10));
                bean.setContent(rs.getString(11));

                vector.add(bean);
            }

            con.close();
        } catch (Exception e){
            e.printStackTrace();
        }
        return vector;
    }

    public BoardBean getOneBoard(int num) {
        BoardBean bean = new BoardBean();

        getCon();

        try {
            // 조회수 증가 쿼리
            String readSql = "update board set readcount = readcount+1 where num=?";

            pstmt = con.prepareStatement(readSql);
            pstmt.setInt(1,num);

            pstmt.executeUpdate();

            // 글 찾기 쿼리
            String sql = "select * from board where num=?";

            this.pstmt = con.prepareStatement(sql);
            this.pstmt.setInt(1, num);

            rs = this.pstmt.executeQuery();

            if(rs.next()) {
                bean.setNum(rs.getInt(1));
                bean.setWriter(rs.getString(2));
                bean.setEmail(rs.getString(3));
                bean.setSubject(rs.getString(4));
                bean.setPassword(rs.getString(5));
                bean.setReg_date(rs.getDate(6).toString());
                bean.setRef(rs.getInt(7));
                bean.setRe_step(rs.getInt(8));
                bean.setRe_level(rs.getInt(9));
                bean.setReadCount(rs.getInt(10));
                bean.setContent(rs.getString(11));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return bean;
    }
}
