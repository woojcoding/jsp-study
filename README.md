# jsp-study
JSP를 공부하여 자바 게시판을 구현해보자!
<details>
<summary>JSP 동작 원리</summary>
<div markdown="1">

url 입력 WWW.XXX.COM -> DNS서버 -> IP 주소로 변화 -> PC에서 JSP 페이지 요청
-> 웹서버(톰캣) -> JSP/서블릿컨테이너에 INDEX.JSP에 보내면 JSP를 자바로 바꿔줌(서블릿)
-> 서블릿이 클래스 파일로 컴파일 -> 버퍼에 담은 뒤 PC로 보냄 -> JVM이 HTML로 변환하여 화면을 구성해줌

</div>
</details>

<details>
<summary>페이지 디렉티브</summary>
<div markdown="1">

JSP 페이지를 구성하는 구성요소
- language : jsp 스크립트요소에서 사용할 언어를 지정 language="java"  (기본값 : JAVA)

- contentType : jsp페이지가 어떻게 바뀔 것인지 지정, 문자열 지정 
(기본값 : text/html) contentType="text/html; charset=EUC-KR"

- pageEncoding : JSP 페이지 자체의 캐릭터 인코딩을 지정 pageEncoding = "EUC-KR"

- import : JSP 페이지에서 사용할 자바 클래스 지정

- session : JSP 페이지의 세션 사용 여부를 지정 (기본값 : true)

- buffer: JSP 페이지의 출력 버퍼크기를 지정 (최소 8kb)

- autoFlush : 출력 버퍼가 다 찼을경우 자동으로 버퍼의 데이터를 출력 스트림으로 보내고 비울지 여부 (기본값 : true)
- errorPage : JSP 페이지 실행 중 에러 발생 시 보여줄 페이지를 지정
- isErrorPage: 에러 페이지 여부를 지정 -> true인 경우 이 페이지는 에러페이지 (기본값 false)

include 디렉티브 : 포함될 page를 한 page로 병합하고 각각 컴파일 하는 것이 아닌 하나의 page로 인식 및 변환 후 compile 

<%@ include file="top.jsp%> 

<%@ include file="bottom.jsp%>

</div>
</details>

<details>
<summary>JSP 페이지 스크립트 요소</summary>
<div markdown="1">

- 스크립트릿 <%&nbsp;&nbsp; %> : 가장 일반적으로 jsp페이지에서 많이 쓰이는 스크립트요소, 주로 프로그래밍 로직 기술에 사용.  
- 스크립트릿 변수 : 서블릿으로 변환될 때 지역변수로 사용된다.
    

- <%  
자바 코드 삽입  
  %>  
  
  

- 선언문 <%!&nbsp;&nbsp;  %> : 선언문은 jsp페이지에서 멤버변수 또는 멤버 메소드로 사용하고자 할 때 주로 사용되는 프로그래밍의 로직
-  선언문의 변수 : 서블릿으로 변환 시 멤버변수로 반환
-  선언문의 메소드 : 서블릿에서 메소드로 반환
- <%!  
    자바 코드 삽입  
    %>  

-  표현식 <%= %> : JSP페이지에서 System.out.println()과 유사하게 사용되는 데이터 출력용 로직 기술
- <%=  
    자바 코드 삽입  
    %>
</div>
</details>

<details>
<summary>내장 객체</summary>
<div markdown="1">

내장 객체 : jsp에서 자주 사용하는 객체들을 묶어 놓은 것
- request(javax.servlet.http.HttpServletRequest) : 웹 브라우저의 요청 정보를 저장하고 있는 객체
- response(javax.servlet.http.HttpServletResponse) : 웹 브라우저의 요청에 대한 응답 정보를 저장하고 있는 객체
- out(javax.servlet.jsp.jsp.jspWriter) : jsp 페이지에 출력할 내용을 가지고 있는 출력 스트림 객체
- session(javax.servlet.http.HttpSession) : 하나의 웹 브라우저의 정보를 유지하기 위한 세션 정보를 저장하고 있는 객체
- application(javax.servlet.servletContext) : 웹 어플리케이션 Context의 정보를 저장하고 있는 객체
- pageContext(javax.servlet.jsp.pageContext) : jsp 페이지에 대한 정보를 저장하고 있는 객체
- page(java.lang.Object) : jsp 페이지를 구현한 자바 클래스 객체
- config(javax.servlet.ServletConfig) : jsp 페이지에 대한 설정 정보를 저장하고 있는 객체
- exception(java.lang.Throwable) : jsp 페이지서 예외가 발생한 경우에 사용되는 객체
</div>
</details>

<details>
<summary>액션 태그</summary>
<div markdown="1">

- include : 다른 페이지의 실행 결과를 현재 페이지에 포함시킬 때 사용 -> 한번에 병합되어 컴파일되는 것이 아니라 각각 컴파일되어 결과가 한 페이지에 보여지는 것이다.
 

- <include 디렉티브>
    <%@ include file="Top.jst" %> : include 디렉티브는 한번에 병합되어 컴파일이 된다.

- <include 액션태그>
  <jsp:include page="Top.jsp"> : include 액션태그는 각각 따로 컴파일되어 결과만 하나의 페이지로 보여주는 것으로
  <jsp:param value="값" name="파라미터명"/> 을 통해 파라미터 값을 해당 jsp 페이지로 넘겨 줄 수 있다.
 

- forward : 페이지 사이의 제어를 이동시킬 때 사용 // 데이터가 존재하여 따로 넘겨줄 필요가 없다.
- <jsp:forward page="이동할 페이지.jsp"/> 
 

- response.sendRedirect : 단순히 페이지만 이동 시키며 데이터 이동은 불가하다.
 
- plug-in : 웹 브라우저에서 자바 애플릿을 실행시킬 때 사용
- useBean : 자바빈을 jsp 페이지에서 사용할 때 사용
    
- 자바빈 : 여러개의 데이터를 하나의 클래스로 저장해 놓고 그 클래스를 ArrayList 이런 곳에 저장할 때 자바빈이라는 용어를 쓴다. jsp와 db간 데이터를 쉽게 주고 받기 위해 만듦
- setProperty : 프로퍼티의 값을 세팅할 때 사용
- getProperty : 프로퍼티의 값을 얻어낼 때 사용
</div>
</details>

<details>
<summary>db 연동</summary>
<div markdown="1">
오라클 db 연동하기
ojdbc11.jar 를 다운로드 받은 후 FILE -> Project Structure을 눌러 Libraries에 다운 받은 .jar 파일을 등록해주면 된다.

```java
// 오라클에 접속하는 소스를 작성
String id = "system"; // 접속아이디
String pass = "123456";
String url= "jdbc:oracle:thin:@localhost:1521:XE"; //접속 URL
     try{
        //1. 해당 데이터 베이스를 사용한다고 선언(클래스를 등록 = 오라클용을 사용)
        Class.forName("oracle.jdbc.driver.OracleDriver");

        //2. 해당 데이터 베이스에 접속
        Connection con = DriverManager.getConnection(url, id, pass);

        //3. 접속 후 쿼리를 준비하여
        String sql = "insert into member values(?, ?, ?, ?, ?, ?, ? , ?)";

        // 쿼리를 사용하도록 설정
        PreparedStatement pstmt = con.prepareStatement(sql);

        // ?에 맞게 데이터를 매핑
        pstmt.setString(1, mbean.getId());
        pstmt.setString(2, mbean.getPass1());
        pstmt.setString(3, mbean.getEmail());
        pstmt.setString(4, mbean.getTel());
        pstmt.setString(5, mbean.getHobby());
        pstmt.setString(6, mbean.getJob());
        pstmt.setString(7, mbean.getAge());
        pstmt.setString(8, mbean.getInfo());

        // 4. 오라클에서 쿼리 실행
        pstmt.executeUpdate(); // insert, update, delete 시 사용하는 메서드

        //5. 자원 반납
        con.close();
        } catch (Exception e) {
        e.printStackTrace();
        }

```

        

jsp 내에서 db연동
- jsp로 데이터를 받아서 DAO java class를 이용해서 db에 넣고 뺀다.
-  DAO(DATA ACCESS OBJECT) : DB에 접근하는 클래스를 별도로 만들어서 사용 -> DB에 연결하고 사용해야한다.
 

- connection pool : DAO 패턴이나 커넥션을 직접 연결이 아닌 커넥션 풀을 이용하여 사용하는 방법 
JDBC를 통해 DB에 연결하기 위해서는 드라이버를 로드하고  커넥션 객체를 받아와야하는데 사용자 요청시 매번 로드, 커넥션객체 생성 후 연결하고 종료하기 때문에 매우 비효율적이므로 커넥션풀(DBCP)을 사용한다.
- 커넥션을 미리 풀에 생성해 두기때문에 DB에 부하를 줄이고 유동적으로 관리 가능하다.
- connection pool을 사용하기 위해선 server.xml 파일에 수정을 해야한다.
````
<Context>
<Resource name="jdbc/pool" auth="Container" type="javax.sql.DataSource"  
driverClassName="oracle.jdbc.driver.OracleDriver" loginTimeout="10" maxwait="5000" 
username="system" password="123456" url="jdbc:oracle:thin:@Localhost:1521:xe"/>
</context>
````

DB에 접근할 수 있도록 해주는 getCon() 메서드를 수정해준다.
````
public getCon() {
    try {
    // 외부에서 데이터를 읽기 위해
    Context initctx = new InitailContext();
    // 톰캣 서버 정보를 담아 놓은 곳으로 이동
    Context envctx = (Context) initctx.lookup("java:comp/env");
    // 데이터 소스 객체를 선언
    DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
    // 데이터 소스를 기준으로 커넥션 연결
    con = ds.getConnection();
    } catch (Exception e) {
        handle exception
    }
}
 ````
</div>
</details>
