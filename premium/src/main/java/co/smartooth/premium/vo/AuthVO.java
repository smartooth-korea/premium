package co.smartooth.premium.vo;


public class AuthVO {
	

	private String userNo;
	private String userId;
	private String userPwd;
	private String userType;
	private String loginDt;
	private String loginResult;
	private String loginIp;
//	private boolean rememberId;
	
	
	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getLoginDt() {
		return loginDt;
	}
	public void setLoginDt(String loginDt) {
		this.loginDt = loginDt;
	}
	public String getLoginResult() {
		return loginResult;
	}
	public void setLoginResult(String loginResult) {
		this.loginResult = loginResult;
	}
	public String getLoginIp() {
		return loginIp;
	}
	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}
		
//		public boolean isRememberId() {
//			return rememberId;
//		}
//		public void setRememberId(boolean rememberId) {
//			this.rememberId = rememberId;
//		}
}
