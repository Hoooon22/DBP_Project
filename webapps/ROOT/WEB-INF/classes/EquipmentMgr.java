package eduBean;
import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import eduBean.*;

public class EquipmentMgr {
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public EquipmentMgr() {
		try{
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
			ocpds.setUser("ST2018112028");   // 본인 아이디(ex.FE0000000000)
			ocpds.setPassword("ST2018112028");  // 본인 패스워드(ex.FE0000000000)

			pool = ocpds.getPooledConnection();
		} catch(Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}
    
	// 기자재 조회
	public Vector getEquipmentList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_mid = null;
		ResultSet rs = null;
		ResultSet rs_mid = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();
			String mySQL = "select distinct c.categoryID cid, c.name cname, c.subjectID csubject, e.equipmentID eid, e.name ename, e.count ecount, e.categoryID ecid, us.managerID mid from PJ_category c left outer join PJ_equipment e on (c.categoryID = e.categoryID) left outer join PJ_user_subject us on (us.subjectID=c.subjectID) order by c.categoryID , c.name";
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Equipment en = new Equipment();
				en.setCId(rs.getString("cid"));
				en.setCName(rs.getString("cname"));
				en.setCSubject(rs.getString("csubject"));
				en.setEID(rs.getString("eid"));
				en.setEName(rs.getString("ename"));
				en.setECount(rs.getInt("ecount"));
				en.setECID(rs.getString("ecid"));
				en.setMID(rs.getString("mid"));
				vecList.add(en);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}
	
}
