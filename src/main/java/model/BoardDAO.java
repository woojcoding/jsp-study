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

    public void reWriteBoard(BoardBean bean) {
        // 부모글 그룹과 글레벨 글 스텝을 얻어온다.
        int ref = bean.getRef();
        int re_step = bean.getRe_step();
        int re_level = bean.getRe_level();

        getCon();

        try {
            // 부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌
            String levelSql = "update board set re_level = re_level + 1 " +
                    "where ref=? and re_level > ?";

            pstmt = con.prepareStatement(levelSql);
            pstmt.setInt(1,ref);
            pstmt.setInt(2,re_level);

            pstmt.executeQuery();

            //답변글 데이터를 저장
            String sql = "insert into board " +
                    "values(board_seq.NEXTVAL, ?, ?, ?, ?, sysdate, ?, ?, ?, 0, ?)";

            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, bean.getWriter());
            pstmt.setString(2, bean.getEmail());
            pstmt.setString(3, bean.getSubject());
            pstmt.setString(4, bean.getPassword());
            pstmt.setInt(5,ref); // 부모의 ref 넣어줌
            pstmt.setInt(6,re_step + 1); // 답글이니 부모글의 re_step에  + 1 해준다.
            pstmt.setInt(7,re_level + 1); // 부모글 다음에 오기위해 + 1
            pstmt.setString(8,bean.getContent());

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BoardBean getOneUpdateBoard(int num) {
        BoardBean bean = new BoardBean();

        getCon();

        try {
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

    public String getPass(int num) {
        String pass = "";
        getCon();

        try {
            String sql = "select password from board where num=?";

            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);

            rs = pstmt.executeQuery();

            if(rs.next()) {
                pass = rs.getString(1);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return pass;
    }

    public void updateBoard(BoardBean boardBean) {
        getCon();

        try {
            String sql = "update board set subject=?, content = ? where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, boardBean.getSubject());
            pstmt.setString(2, boardBean.getContent());
            pstmt.setInt(3,boardBean.getNum());

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteBoard(int num) {
        getCon();

        try {
            String sql = "delete from board where num=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,num);

            pstmt.executeUpdate();

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
