/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.60
 * Generated at: 2020-12-13 19:24:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.util.regex.*;

public final class update_005fteach_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/top.jsp", Long.valueOf(1607864167405L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("java.sql");
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("java.util.regex");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<title>수강정원변경</title>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t<body>\t\r\n");
      out.write("\t");
      out.write('\r');
      out.write('\n');

	String session_id = (String)session.getAttribute("user");
	String log;

	if (session_id==null) {
		log="<a href=login.jsp>로그인</a>";
	} else {
		log="<a href=logout.jsp>로그아웃</a>";
		Pattern p = Pattern.compile("[A-Z].*");
		Matcher m = p.matcher(session_id);
	}

      out.write("\r\n");
      out.write("<table width=\"75%\" align=\"center\" bgcolor=\"#FFFF99\" border>\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td align=\"center\"><b>");
      out.print(log);
      out.write("</b></td>\t\r\n");
      out.write("\t\t<td align=\"center\"><b><a href=\"update_professor.jsp\">교수정보변경</b></td>    \r\n");
      out.write("\t\t<td align=\"center\"><b><a href=\"insert_teach.jsp\">기자재 신청</b></td>\r\n");
      out.write("\t\t<td align=\"center\"><b><a href=\"update_teach.jsp\">기자재 수정</b></td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("</table>\r\n");
      out.write('\r');
      out.write('\n');
      out.write('	');
 if (session_id==null) response.sendRedirect("login.jsp"); 
      out.write("\r\n");
      out.write("\t\t<form method=\"post\" action=\"update_teach_verify.jsp\">\r\n");
      out.write("\t\t\t<table width=\"75%\" align=\"center\" border>\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<th>과목번호</th>\r\n");
      out.write("\t\t\t\t\t<th>과목명</th>\r\n");
      out.write("\t\t\t\t\t<th>카테고리</th>\r\n");
      out.write("\t\t\t\t\t<th>기자재이름</th>\r\n");
      out.write("\t\t\t\t\t<th>개수</th>\r\n");
      out.write("\t\t\t\t</tr><br>\r\n");
      out.write("\t");

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

		mySQL = "select distinct c.categoryID cid, c.name cname, c.subjectID csid, c.sujectName csname, e.equipmentID eid, e.name ename, e.count ecount, e.categoryID ecid, us.managerID mid from PJ_category c left outer join PJ_equipment e on (c.categoryID = e.categoryID) left outer join PJ_user_subject us on (us.subjectID=c.subjectID) order by c.categoryID , c.name";
			
		pstmt = conn.prepareStatement(mySQL);
		myResultSet = pstmt.executeQuery();
		
		while (myResultSet.next()) {
			String cid = myResultSet.getString("cid");
			String cid_no = myResultSet.getString("cname");
			String cname = myResultSet.getString("csubject");
			String cunit = myResultSet.getString("eid");
			String tmax = myResultSet.getString("ename");
			String tmax = myResultSet.getString("ecount");
			String tmax = myResultSet.getString("ecid");
			String tmax = myResultSet.getString("mid");
	
      out.write("\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
      out.print(csid);
      out.write("<input type=\"hidden\" name=\"csid\" value=\"");
      out.print(csid);
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
      out.print(csname);
      out.write("<input type=\"hidden\" name=\"csname\" value=");
      out.print(csname);
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
      out.print(cname);
      out.write("<input type=\"hidden\" name=\"cname\" value=");
      out.print(cname);
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\">");
      out.print(ename);
      out.write("<input type=\"hidden\" name=\"ename\" value=");
      out.print(ename);
      out.write("></td>\r\n");
      out.write("\t\t\t\t\t<td align=\"center\"><input type=\"text\" name=\"ecount\" size=5 value=\"");
      out.print(ecount);
      out.write("\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t");
	
		}
		pstmt.close();  
		conn.close();
	
      out.write("\r\n");
      out.write("\t\t\t</table><br>\r\n");
      out.write("\t\t\t<table align=\"center\">\r\n");
      out.write("\t\t\t\t<tr> \r\n");
      out.write("\t\t\t\t\t<td><input type=\"submit\" name=\"submit\" value=\"수강정원변경\"></td>\r\n");
      out.write("\t\t\t\t</tr>\r\n");
      out.write("\t\t\t</table>\r\n");
      out.write("\t\t</form>\t\t\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("    ");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
