package co.smartooth.premium.vo;


public class LocationVO {
	
	
	// 시,도 지역코드
	private String sidoCd;
	// 시,도 지역 이름
	private String sidoNm;
	// 시,군,구,읍,면,동 지역 코드
	private String sggemdCd;
	// 시,군,구 지역 이름
	private String sigunguNm;
	// 읍,면,동 지역 이름
	private String eupmyeondongNm;
	// 지역별 기관 SEQ_NO
	private int ogSeqNo;
	
	
	// 나라 지역 코드 2자리
	private String isoAlpha2;
	// 나라 지역 코드 3자리
	private String isoAlpha3;
	// 나라 지역 코드 (숫자)
	private int isoNumeric;
	// 대륙코드
	private String continentCode;
	// 국가 이름 (국문)
	private String nationalNameKor;
	// 국가 이름 (영문)
	private String nationalNameEng;
	// 시간
	private int gmt;
	
	
	
	
	public String getSidoCd() {
		return sidoCd;
	}
	public void setSidoCd(String sidoCd) {
		this.sidoCd = sidoCd;
	}
	public String getSidoNm() {
		return sidoNm;
	}
	public void setSidoNm(String sidoNm) {
		this.sidoNm = sidoNm;
	}
	public String getSggemdCd() {
		return sggemdCd;
	}
	public void setSggemdCd(String sggemdCd) {
		this.sggemdCd = sggemdCd;
	}
	public String getSigunguNm() {
		return sigunguNm;
	}
	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
	}
	public String getEupmyeondongNm() {
		return eupmyeondongNm;
	}
	public void setEupmyeondongNm(String eupmyeondongNm) {
		this.eupmyeondongNm = eupmyeondongNm;
	}
	public int getOgSeqNo() {
		return ogSeqNo;
	}
	public void setOgSeqNo(int ogSeqNo) {
		this.ogSeqNo = ogSeqNo;
	}
	public String getIsoAlpha2() {
		return isoAlpha2;
	}
	public void setIsoAlpha2(String isoAlpha2) {
		this.isoAlpha2 = isoAlpha2;
	}
	public String getIsoAlpha3() {
		return isoAlpha3;
	}
	public void setIsoAlpha3(String isoAlpha3) {
		this.isoAlpha3 = isoAlpha3;
	}
	public int getIsoNumeric() {
		return isoNumeric;
	}
	public void setIsoNumeric(int isoNumeric) {
		this.isoNumeric = isoNumeric;
	}
	public String getContinentCode() {
		return continentCode;
	}
	public void setContinentCode(String continentCode) {
		this.continentCode = continentCode;
	}
	public String getNationalNameKor() {
		return nationalNameKor;
	}
	public void setNationalNameKor(String nationalNameKor) {
		this.nationalNameKor = nationalNameKor;
	}
	public String getNationalNameEng() {
		return nationalNameEng;
	}
	public void setNationalNameEng(String nationalNameEng) {
		this.nationalNameEng = nationalNameEng;
	}
	public int getGmt() {
		return gmt;
	}
	public void setGmt(int gmt) {
		this.gmt = gmt;
	}
}
