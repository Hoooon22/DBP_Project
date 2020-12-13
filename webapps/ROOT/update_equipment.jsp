<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<html>
	<head>
		<title>수강정원변경</title>
	<head>
	<body>	
	<%@ include file="top.jsp" %>
	<% if (session_id==null) response.sendRedirect("login.jsp"); %>
		<form method="post" action="update_teach_verify.jsp">
			<table width="75%" align="center" border>
				<tr>
					<th>과목번호</th>
					<th>과목명</th>
					<th>카테고리</th>
					<th>기자재이름</th>
					<th>개수</th>
				</tr><br>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		CallableStatement cstmt1 = null;
		CallableStatement cstmt2 = null;
		String mySQL = "";
		String p_id = (String)session.getAttribute("user");
		int nYear = 0;
		int nSemester = 0;
		ResultSet myResultSet = null;
		
		String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
		String user = "ST2018112028";	// 본인 아이디(ex.ST0000000000)
		String passwd = "ST2018112028";	// 본인 패스워드(ex.ST0000000000)
		String dbdriver = "oracle.jdbc.driver.OracleDriver";    
	
		try {
			Class.forName(dbdriver);
			conn = DriverManager.getConnection(dburl, user, passwd);
			
		} catch(SQLException ex) {
			System.err.println("SQLException: " + ex.getMessage());
		}

		mySQL = "select distinct c.categoryID cid, c.name cname, c.subjectID csid , s.name csname, e.equipmentID eid, e.name ename, e.count ecount, e.categoryID ecid, us.managerID mid from PJ_category c left outer join PJ_equipment e on (c.categoryID = e.categoryID) left outer join PJ_user_subject us on (us.subjectID=c.subjectID) left outer join PJ_subject s on (s.subjectID=c.subjectID) order by c.categoryID , c.name";
			
		pstmt = conn.prepareStatement(mySQL);
		myResultSet = pstmt.executeQuery();
		
		while (myResultSet.next()) {
			String cid = myResultSet.getString("cid");
			String cname = myResultSet.getString("cname");
			String csid = myResultSet.getString("csid");
			String csname = myResultSet.getString("csname");
			String eid = myResultSet.getString("eid");
			String ename = myResultSet.getString("ename");
			String ecount = myResultSet.getString("ecount");
			String ecid = myResultSet.getString("ecid");
			String mid = myResultSet.getString("mid");
	%>

				<tr>
					<td align="center"><%=csid%><input type="hidden" name="csid" value="<%=csid%>"></td>
					<td align="center"><%=csname%><input type="hidden" name="csname" value=<%=csname%>></td>
					<td align="center"><%=cname%><input type="hidden" name="cname" value=<%=cname%>></td>
					<td align="center"><%=ename%><input type="hidden" name="ename" value=<%=ename%>></td>
					<td align="center"><input type="text" name="ecount" size=5 value="<%=ecount%>"></td>
				</tr>
	<%	
		}
		pstmt.close();  
		conn.close();
	%>
			</table><br>
			<table align="center">
				<tr> 
					<td><input type="submit" name="submit" value="기자재수정"></td>
				</tr>
			</table>
		</form>		
	</body>
</html>

    