<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String custname=request.getParameter("custname");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	String joindate=request.getParameter("joindate");
	String grade=request.getParameter("grade");
	String city=request.getParameter("city");
	String custno=request.getParameter("custno");
	try{
		String sql="update member1213 set custname=?,phone=?,address=?,joindate=?,grade=?,city=? where custno=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		pstmt.executeUpdate();
		System.out.println("데이터 수정 성공");
%>
		<script>
			alert("수정이 완료되었습니다.")
			location.href="member_Select.jsp"
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 수정 실패");
	}
%>
		<script>
			alert("수정 실패");
			history.back(-1);
		</script>
</body>
</html>