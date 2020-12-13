<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.util.*, eduBean.*"%>
<html>
	<head>
		<title>기자재 신청</title>
	<head>
	<body>	
	<%@ include file="top.jsp" %>
	<% 
		if (session_id==null) response.sendRedirect("login.jsp"); 
	%>
		<table width="75%" align="center" border>
			<tr>
				<th>과목번호</th>
				<th>카테고리</th>
				<th>기자재 이름</th>
				<th>기자재 개수</th>
			</tr><br>
			
	<jsp:useBean id="EquipmentMgr" class="eduBean.EquipmentMgr" />
	<%
		Vector vlist = EquipmentMgr.getEquipmentList();		
	
		for(int i=0; i<vlist.size(); i++) {
			Equipment en = (Equipment)vlist.elementAt(i);
	%>
			<tr>
				<td align="center"><%=en.getCId()%></td>
				<td align="center"><%=en.getCName()%></td>
				<td align="center">
			<% if(session_id.equals(en.getMID())) { %>
					<a href="update_class.jsp?p_id=<%=en.getMID()%>&c_id=<%= en.getCId() %>&c_id_no=<%= en.getCIdNo() %>"><%}%><%=en.getCName()%>
				</td>
				<td align="center"><%=en.getECount()%></td>
				<td align="center">
			<% if (en.getCName() == null) { %>
					&nbsp;
			<% } else { %>
				<%=en.getCName()%>
			<% } %>
				</td>
				<td align="center">
			<% if(en.getMID() == null) { %>
					<a href="insert_teach_verify.jsp?c_id=<%= en.getCId() %>&c_id_no=<%= en.getCIdNo() %>&type=1">신청</a>
			<% } else if(session_id.equals(en.getMID())) { %>
					<a href="insert_teach_verify.jsp?c_id=<%= en.getCId() %>&c_id_no=<%= en.getCIdNo() %>&type=2">취소</a>
			<% } else { %>
					&nbsp;
			<% } %>
				</td>	
			<% } %>
			</tr>
		</table> 
	</body>
</html>
