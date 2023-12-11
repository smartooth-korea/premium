package co.smartooth.premium.vo;

import java.io.Serializable;

public class OrganVO implements Serializable {
	
	
	private static final long serialVersionUID = 1L;
	
	// 유치원, 어린이집 코드
	private String schoolCode;
	// 유치원, 어린이집 이름
	private String schoolName;
	// 유치원, 어린이집 반 코드
	private String classCode;
	// 유치원, 어린이집 반 이름
	private String className;
	// 유치원, 어린이집 주소 (시도)
	private String organSidoNm;
	// 유치원, 어린이집 주소 (시군구)
	private String organSigunguNm;
	// 유치원, 어린이집 주소 (읍면동)
	private String organEupmyeondongNm;
	// 피측정자 시퀀스 번호
	private int userSeqNo;
	// 유치원, 어린이집 디스플레이 표시 여부
	private String isVisible;
	
	
	public String getSchoolCode() {
		return schoolCode;
	}
	public void setSchoolCode(String schoolCode) {
		this.schoolCode = schoolCode;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public String getClassCode() {
		return classCode;
	}
	public void setClassCode(String classCode) {
		this.classCode = classCode;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getUserSeqNo() {
		return userSeqNo;
	}
	public void setUserSeqNo(int userSeqNo) {
		this.userSeqNo = userSeqNo;
	}
	public String getOrganSidoNm() {
		return organSidoNm;
	}
	public void setOrganSidoNm(String organSidoNm) {
		this.organSidoNm = organSidoNm;
	}
	public String getOrganSigunguNm() {
		return organSigunguNm;
	}
	public void setOrganSigunguNm(String organSigunguNm) {
		this.organSigunguNm = organSigunguNm;
	}
	public String getOrganEupmyeondongNm() {
		return organEupmyeondongNm;
	}
	public void setOrganEupmyeondongNm(String organEupmyeondongNm) {
		this.organEupmyeondongNm = organEupmyeondongNm;
	}
	public String getIsVisible() {
		return isVisible;
	}
	public void setIsVisible(String isVisible) {
		this.isVisible = isVisible;
	}
	
}
