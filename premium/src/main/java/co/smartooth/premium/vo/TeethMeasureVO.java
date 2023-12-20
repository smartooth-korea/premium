package co.smartooth.premium.vo;

import java.io.Serializable;

public class TeethMeasureVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	// 회원 이름 : 추가된 내용
	private String userName;
	// 회원 번호
	private String userNo;
	// 회원 아이디
	private String userId;
	// 검색 (시작일)
	private String startDt;
	// 검색 (종료일)
	private String endDt;
	// 조회 개수
	private int limit;
	// 치아 측정 일자
	private String measureDt;
	// 32개의 치아 변수
	private int t01, t02, t03 ,t04 ,t05 ,t06 ,t07 ,t08 ,t09 ,t10
	,t11 ,t12 ,t13 ,t14 ,t15 ,t16 ,t17 ,t18 ,t19 ,t20 ,t21 ,t22
	,t23 ,t24 ,t25 ,t26 ,t27 ,t28 ,t29 ,t30 ,t31 ,t32
	,t33, t34 ,t35, t36, t37, t38 ,t39 ,t40 ,t41 ,t42, t43, t44
	,t45, t46, t47, t48 ,t49 ,t50 ,t51 ,t52, t53, t54, t55, t56;
	
	/**충치 상태에 따른 치아 개수*/
	// 유치 - 정상 수치 개수
	private int cavityNormal;
	// 유치 - 주의 수치 개수 
	private int cavityCaution;
	// 유치 - 충치 수치 개수
    private int cavityDanger;
    // 유치 - 정상 수치 개수
    private int permCavityNormal;
    // 유치 - 주의 수치 개수 
    private int permCavityCaution;
    // 유치 - 충치 수치 개수
    private int permCavityDanger;
    // 측정인 아이디
    private String measurerId;
    // 진단 코드
    private String diagCd;
    // 진단 코드
    private String diagList;
    // 모든 메모
    private String memo;
    // 코멘트 제목
    private String diagTitle;
    // 진단 설명 모아놓은 변수
    private String diagDescript;
    // 진단 설명 업데이트 여부
    private String diagDescriptFl;
    // 악화지수 점수
    private double deteriorateScore;

    
    private String schoolCode;
	private String schoolName;

    
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
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
	public String getStartDt() {
		return startDt;
	}
	public void setStartDt(String startDt) {
		this.startDt = startDt;
	}
	public String getEndDt() {
		return endDt;
	}
	public void setEndDt(String endDt) {
		this.endDt = endDt;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public String getMeasureDt() {
		return measureDt;
	}
	public void setMeasureDt(String measureDt) {
		this.measureDt = measureDt;
	}
	public int getT01() {
		return t01;
	}
	public void setT01(int t01) {
		this.t01 = t01;
	}
	public int getT02() {
		return t02;
	}
	public void setT02(int t02) {
		this.t02 = t02;
	}
	public int getT03() {
		return t03;
	}
	public void setT03(int t03) {
		this.t03 = t03;
	}
	public int getT04() {
		return t04;
	}
	public void setT04(int t04) {
		this.t04 = t04;
	}
	public int getT05() {
		return t05;
	}
	public void setT05(int t05) {
		this.t05 = t05;
	}
	public int getT06() {
		return t06;
	}
	public void setT06(int t06) {
		this.t06 = t06;
	}
	public int getT07() {
		return t07;
	}
	public void setT07(int t07) {
		this.t07 = t07;
	}
	public int getT08() {
		return t08;
	}
	public void setT08(int t08) {
		this.t08 = t08;
	}
	public int getT09() {
		return t09;
	}
	public void setT09(int t09) {
		this.t09 = t09;
	}
	public int getT10() {
		return t10;
	}
	public void setT10(int t10) {
		this.t10 = t10;
	}
	public int getT11() {
		return t11;
	}
	public void setT11(int t11) {
		this.t11 = t11;
	}
	public int getT12() {
		return t12;
	}
	public void setT12(int t12) {
		this.t12 = t12;
	}
	public int getT13() {
		return t13;
	}
	public void setT13(int t13) {
		this.t13 = t13;
	}
	public int getT14() {
		return t14;
	}
	public void setT14(int t14) {
		this.t14 = t14;
	}
	public int getT15() {
		return t15;
	}
	public void setT15(int t15) {
		this.t15 = t15;
	}
	public int getT16() {
		return t16;
	}
	public void setT16(int t16) {
		this.t16 = t16;
	}
	public int getT17() {
		return t17;
	}
	public void setT17(int t17) {
		this.t17 = t17;
	}
	public int getT18() {
		return t18;
	}
	public void setT18(int t18) {
		this.t18 = t18;
	}
	public int getT19() {
		return t19;
	}
	public void setT19(int t19) {
		this.t19 = t19;
	}
	public int getT20() {
		return t20;
	}
	public void setT20(int t20) {
		this.t20 = t20;
	}
	public int getT21() {
		return t21;
	}
	public void setT21(int t21) {
		this.t21 = t21;
	}
	public int getT22() {
		return t22;
	}
	public void setT22(int t22) {
		this.t22 = t22;
	}
	public int getT23() {
		return t23;
	}
	public void setT23(int t23) {
		this.t23 = t23;
	}
	public int getT24() {
		return t24;
	}
	public void setT24(int t24) {
		this.t24 = t24;
	}
	public int getT25() {
		return t25;
	}
	public void setT25(int t25) {
		this.t25 = t25;
	}
	public int getT26() {
		return t26;
	}
	public void setT26(int t26) {
		this.t26 = t26;
	}
	public int getT27() {
		return t27;
	}
	public void setT27(int t27) {
		this.t27 = t27;
	}
	public int getT28() {
		return t28;
	}
	public void setT28(int t28) {
		this.t28 = t28;
	}
	public int getT29() {
		return t29;
	}
	public void setT29(int t29) {
		this.t29 = t29;
	}
	public int getT30() {
		return t30;
	}
	public void setT30(int t30) {
		this.t30 = t30;
	}
	public int getT31() {
		return t31;
	}
	public void setT31(int t31) {
		this.t31 = t31;
	}
	public int getT32() {
		return t32;
	}
	public void setT32(int t32) {
		this.t32 = t32;
	}
	public int getT33() {
		return t33;
	}
	public void setT33(int t33) {
		this.t33 = t33;
	}
	public int getT34() {
		return t34;
	}
	public void setT34(int t34) {
		this.t34 = t34;
	}
	public int getT35() {
		return t35;
	}
	public void setT35(int t35) {
		this.t35 = t35;
	}
	public int getT36() {
		return t36;
	}
	public void setT36(int t36) {
		this.t36 = t36;
	}
	public int getT37() {
		return t37;
	}
	public void setT37(int t37) {
		this.t37 = t37;
	}
	public int getT38() {
		return t38;
	}
	public void setT38(int t38) {
		this.t38 = t38;
	}
	public int getT39() {
		return t39;
	}
	public void setT39(int t39) {
		this.t39 = t39;
	}
	public int getT40() {
		return t40;
	}
	public void setT40(int t40) {
		this.t40 = t40;
	}
	public int getT41() {
		return t41;
	}
	public void setT41(int t41) {
		this.t41 = t41;
	}
	public int getT42() {
		return t42;
	}
	public void setT42(int t42) {
		this.t42 = t42;
	}
	public int getT43() {
		return t43;
	}
	public void setT43(int t43) {
		this.t43 = t43;
	}
	public int getT44() {
		return t44;
	}
	public void setT44(int t44) {
		this.t44 = t44;
	}
	public int getT45() {
		return t45;
	}
	public void setT45(int t45) {
		this.t45 = t45;
	}
	public int getT46() {
		return t46;
	}
	public void setT46(int t46) {
		this.t46 = t46;
	}
	public int getT47() {
		return t47;
	}
	public void setT47(int t47) {
		this.t47 = t47;
	}
	public int getT48() {
		return t48;
	}
	public void setT48(int t48) {
		this.t48 = t48;
	}
	public int getT49() {
		return t49;
	}
	public void setT49(int t49) {
		this.t49 = t49;
	}
	public int getT50() {
		return t50;
	}
	public void setT50(int t50) {
		this.t50 = t50;
	}
	public int getT51() {
		return t51;
	}
	public void setT51(int t51) {
		this.t51 = t51;
	}
	public int getT52() {
		return t52;
	}
	public void setT52(int t52) {
		this.t52 = t52;
	}
	public int getT53() {
		return t53;
	}
	public void setT53(int t53) {
		this.t53 = t53;
	}
	public int getT54() {
		return t54;
	}
	public void setT54(int t54) {
		this.t54 = t54;
	}
	public int getT55() {
		return t55;
	}
	public void setT55(int t55) {
		this.t55 = t55;
	}
	public int getT56() {
		return t56;
	}
	public void setT56(int t56) {
		this.t56 = t56;
	}
	public int getCavityNormal() {
		return cavityNormal;
	}
	public void setCavityNormal(int cavityNormal) {
		this.cavityNormal = cavityNormal;
	}
	public int getCavityCaution() {
		return cavityCaution;
	}
	public void setCavityCaution(int cavityCaution) {
		this.cavityCaution = cavityCaution;
	}
	public int getCavityDanger() {
		return cavityDanger;
	}
	public void setCavityDanger(int cavityDanger) {
		this.cavityDanger = cavityDanger;
	}
	public int getPermCavityNormal() {
		return permCavityNormal;
	}
	public void setPermCavityNormal(int permCavityNormal) {
		this.permCavityNormal = permCavityNormal;
	}
	public int getPermCavityCaution() {
		return permCavityCaution;
	}
	public void setPermCavityCaution(int permCavityCaution) {
		this.permCavityCaution = permCavityCaution;
	}
	public int getPermCavityDanger() {
		return permCavityDanger;
	}
	public void setPermCavityDanger(int permCavityDanger) {
		this.permCavityDanger = permCavityDanger;
	}
	public String getMeasurerId() {
		return measurerId;
	}
	public void setMeasurerId(String measurerId) {
		this.measurerId = measurerId;
	}
	public String getDiagCd() {
		return diagCd;
	}
	public void setDiagCd(String diagCd) {
		this.diagCd = diagCd;
	}
	public String getDiagList() {
		return diagList;
	}
	public void setDiagList(String diagList) {
		this.diagList = diagList;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getDiagTitle() {
		return diagTitle;
	}
	public void setDiagTitle(String diagTitle) {
		this.diagTitle = diagTitle;
	}
	public String getDiagDescript() {
		return diagDescript;
	}
	public void setDiagDescript(String diagDescript) {
		this.diagDescript = diagDescript;
	}
	public String getDiagDescriptFl() {
		return diagDescriptFl;
	}
	public void setDiagDescriptFl(String diagDescriptFl) {
		this.diagDescriptFl = diagDescriptFl;
	}
	public double getDeteriorateScore() {
		return deteriorateScore;
	}
	public void setDeteriorateScore(double deteriorateScore) {
		this.deteriorateScore = deteriorateScore;
	}
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
	
}
