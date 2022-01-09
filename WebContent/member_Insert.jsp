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
<%
	int no=0;
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	
	try{
		String sql="select member_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1);
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("sequence 조회 오류");
	}
%>

<form name="form" method="post" action="member_Insert_Process.jsp">
<h1>홈쇼핑 회원 등록</h1>
<table border=1 id="tab1">
	<tr>
		<th id="th1">회원번호(자동발생)</th>
		<td><input type="text" name="custno" value="<%=no %>"></td>
	</tr>
	<tr>
		<th id="th1">회원성명</th>
		<td><input type="text" name="custname"></td>
	</tr>
	<tr>
		<th id="th1">회원전화</th>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<th id="th1">회원주소</th>
		<td><input type="text" name="address"></td>
	</tr>
	<tr>
		<th id="th1">가입일자</th>
		<td><input type="text" name="joindate"></td>
	</tr>
	<tr>
		<th id="th1">고객등급[A:VIP,B:일반,C:직원]</th>
		<td><input type="text" name="grade"></td>
	</tr>
	<tr>
		<th id="th1">도시코드</th>
		<td><input type="text" name="city"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" id="btn1" value="등 록" onclick="check()">
			<input type="button" id="btn1" value="조 회" onclick="location.href=member_Select.jsp"> 
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.custname.value==""){
			alert("회원성명이 입력되지 않았습니다.");
			document.form.custname.focus();
		}else if(document.form.phone.value==""){
			alert("회원전화가 입력되지 않았습니다.");
			document.form.phone.focus();
		}else if(document.form.address.value==""){
			alert("회원주소가 입력되지 않았습니다.");
			document.form.address.focus();
		}else if(document.form.joindate.value==""){
			alert("가입일자가 입력되지 않았습니다.");
			document.form.joindate.focus();
		}else if(document.form.grade.value==""){
			alert("고객등급이 입력되지 않았습니다.");
			document.form.grade.focus();
		}else if(document.form.city.value==""){
			alert("도시코드가 입력되지 않았습니다.");
			document.form.city.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>