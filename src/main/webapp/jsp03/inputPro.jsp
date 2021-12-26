<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%--inputPro.jsp --%>
<%!
//선언부, 전역변수, 메서드 정의
String DRIVER="com.mysql.jdbc.Driver";
String URL="jdbc:mysql://127.0.0.1:3306/mydb2";
String USER="root";
String PWD="12345";
%>

<%
request.setCharacterEncoding("UTF-8");//post 요청 한글 처리
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inputPro.jsp</title>
</head>
<body>
<%
	try{
		Class.forName(DRIVER);//드라이버 로딩
		Connection con=DriverManager.getConnection(URL,USER,PWD);//DB연결
		
		//클라이언트가 보내준 데이터 받기
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		String sql="insert into test123 values(?,?,?,?,NOW())"; // <-- NOW()로 MySQL에서 현재 시스템 날짜 직접 받음
		PreparedStatement pstmt=con.prepareStatement(sql);
		
		//?값 채우기
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
		pstmt.setString(3,name);
		pstmt.setString(4,email);
		
		pstmt.executeUpdate();//쿼리 수행
		
		pstmt.close();
		con.close();
		
		out.println("회원 가입 성공");
		
	}catch(Exception ex){
		out.println("<script>");
		out.println("alert('SQL예외')");
		out.println("history.back()");
		out.println("</script>");
	}

%>

</body>
</html>