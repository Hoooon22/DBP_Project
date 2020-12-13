package eduBean;

public class Equipment {
	private String cid;
	private String cname;
	private String csubject;
	private String eid;
	private String ename;
	private int ecount;
	private String ecid;
	private String mid;

	public Equipment() {
		cid = null;
		cname = null;
		csubject = null;
		eid = null;
		ename = null;
		ecount = 0;
		ecid = null;
		mid = null;
	}

	public void setCId(String cid) {
		this.cid = cid;
	}

	public void setCName(String cname) {
		this.cname = cname;
	}

	public void setCSubject(String csubject) {
		this.csubject = csubject;
	}

	public void setEID(String eid) {
		this.eid = eid;
	}

	public void setEName(String ename) {
		this.ename = ename;
	}

	public void setECount(int ecount) {
		this.ecount = ecount;
	}

	public void setECID(String ecid) {
		this.ecid = ecid;
	}

	public void setMID(String mid) {
		this.mid = mid;
	}

	public String getCId() {
		return cid;
	}
	public String getCName() {
		return cname;
	}
	public String getCSubject() {
		return csubject;
	}
	public String getEID() {
		return eid;
	}
	public String getEName() {
		return ename;
	}
	public int getECount() {
		return ecount;
	}
	public String getECID() {
		return ecid;
	}
	public String getMID() {
		return mid;
	}

}
