<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>수강정원변경</title>
	</head>
	<body>
 		<script>
 			var message = "";
		<%csid csname cname ename ecount

			String p_id = (String)session.getAttribute("user");
			String result = null;		       
			String csid[] = request.getParameterValues("csid");
			String csname[] = request.getParameterValues("csname");
			String cname[] = request.getParameterValues("cname");
			String ename[] = request.getParameterValues("ename");	
			String ecount[] = request.getParameterValues("ecount");		   
		   
			Connection myConn = null;     
			CallableStatement cstmt = null;
			String mySQL = "";
		
			String dburl = "jdbc:oracle:thin:@210.94.199.20:1521:DBLAB";
			String user = "ST2018112028";	// 본인 아이디(ex.ST0000000000)
			String passwd = "ST2018112028";	// 본인 패스워드(ex.ST0000000000)
			String dbdriver = "oracle.jdbc.driver.OracleDriver";    
			
			try {
				Class.forName(dbdriver);
				myConn = DriverManager.getConnection(dburl, user, passwd);
			} catch (SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			}

			try {	
				mySQL = "{call UPDATETEACH(?,?,?,?,?,?)}";
				for (int i = 0; i < csid.length; i++) {				
					cstmt = myConn.prepareCall(mySQL);
					cstmt.setString(1, csid[i]);
					cstmt.setString(2, csname[i]);
					cstmt.setString(3, cname[i]);
					cstmt.setString(4, ename[i]);
					cstmt.setInt(5, ecount[i]);
					cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);
					cstmt.execute();
					result = cstmt.getString(6);

		%>
				message = message + "<%=result%>" + "\n";      
		<%         
				}
			} catch(SQLException ex) {
				System.err.println("SQLException: " + ex.getMessage());
			} 
		%>
			alert(message);
			location.href = "update_teach.jsp";
		</script> 
	</body>
</html>