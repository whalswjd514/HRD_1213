<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<%@ include file="DBConn.jsp" %>
<h1>회원목록조회/수정</h1>
<table border=1 id="tab2">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
		<th>관리</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd'),grade,city from member1213";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			int custno=rs.getInt(1);
			String custname=rs.getString(2);
			String phone=rs.getString(3);
			String address=rs.getString(4);
			String joindate=rs.getString(5);
			String grade=rs.getString(6);
			if(grade.equals("A")){
				grade="VIP";
			}else if(grade.equals("B")){
				grade="일반";
			}else{
				grade="직원";
			}
			String city=rs.getString(7);
			System.out.println("테이블 조회 성공");
%>
	<tr>
		<td><a href="member_Update.jsp?custno=<%=custno %>" id="a1"><%=custno %></a></td>
		<td><%=custname %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
		<td><%=joindate %></td>
		<td><%=grade %></td>
		<td><%=city %></td>
		<td><a href="member_Delete.jsp?custno=<%=custno %>">삭제</a></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>