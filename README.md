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
- response
- out
- session
- application
- pageContext
- page
- config
- exception
</div>
</details>
