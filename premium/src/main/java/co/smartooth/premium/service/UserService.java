package co.smartooth.premium.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import co.smartooth.premium.vo.DentistInfoVO;
import co.smartooth.premium.vo.UserVO;


/**
 * 작성자 : 정주현
 * 작성일 : 2023. 11. 08
 */
public interface UserService {
	
	
	/** 공통 기능 **/
	// 계정 정보 조회
	public UserVO selectUserInfo(@Param("userId") String userId) throws Exception;
	
	
	// 계정 비밀번호 변경
	public void updateUserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd) throws Exception;
	
	
	// 계정 정보 수정(업데이트)
	public void updateUserInfo(UserVO userVO) throws Exception;
	
	
	// 계정 정보 삭제
	public void deleteUserInfo(@Param("userId") String userId) throws Exception;
	
	
	// 푸시토큰 업데이트(수정)
	public void updatePushToken(@Param("userId") String userId, @Param("pushToken") String pushToken) throws Exception;
	
	
	
	
	
	
	/** 치과 서비스 측정 **/
	// 부서ID로 해당 피측정자 목록 조회
	public List<UserVO> selectMeasuredUserList(@Param("userId") String userId, @Param("orderBy") String orderBy) throws Exception;
	
	
	// 개인정보 제공을 동의한 환자 목록(SYSDATE)
	public List<HashMap<String, Object>> selectInfomationAgreeUserList(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception;	
	
	
	// 치과 소속 의사 목록 조회
	public List<HashMap<String, Object>> selectDentistList(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception;
	
	
	// 현재 측정된 자료가 없는 T00~T99 사이의 환자 할당
	public UserVO selectNoMeasureValueUserId(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception;
	
	
	// 빠른등록으로 할당된 환자의 차이 형태 (유치,영구치) 업데이트
	public void updateUserTeethType(@Param("userId") String userId, @Param("teethType") String teethType) throws Exception;
	
	
	// 치과 회원 상세 정보 등록
	public void insertUserDetail(UserVO dentalUserVO) throws Exception;
	
	
	// 최근 등록한 의사 아이디 조회
	public String selectDentistId(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception;
	
	
	// 치과 소속 의사 등록
	public void insertDentistInfo(DentistInfoVO dentistInfoVO) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 측정 앱 **/
	// 측정자 목록 조회
	public List<HashMap<String, Object>> selectMeasurerList() throws Exception;
	
	
	// 반 소속 학생(측정예정) 목록 조회
	public List<HashMap<String, Object>> selectStudentUserListByClassCode(@Param("userId") String userId, @Param("orderBy") String orderBy) throws Exception;
	

	
	
	
	
	/** 유치원, 어린이집 조회 앱 **/
	// 아이디 중복 체크
	public int duplicateChkId(@Param("userId") String userId) throws Exception;

	
	// 계정 등록
	public void insertUserInfo(UserVO userVO) throws Exception;
	
	
	// 계정(피측정자-원아) 상세 정보 등록 
	public void insertStudentUserDetail(@Param("userId") String userId, @Param("schoolType") String schoolType, @Param("classCode") String classCode) throws Exception;
		
		
	// 계정(법정대리인) 상세 정보 등록 
	public void insertParentUserDetail(@Param("userId") String userId, @Param("childId") String childId) throws Exception;
	
	
	// 법정대리인 계정 정보로 자녀 계정 정보 조회
	public List<UserVO> selectStudentUserInfoByParentUserId(@Param("userId") String userId) throws Exception;

	
	// 법정대리인 계정 정보로 자녀 계정 정보 조회 (MAP)
	public List<HashMap<String, String>> selectStudentUserInfoByParentUserIdForMap(@Param("userId") String userId) throws Exception;
	
	
	// 법정대리인과 피측정자의 연결고리 삭제
	public void deleteParentUserDetailInfo(@Param("userId") String userId, @Param("childId") String childId);
	
	
	// 피측정자와 유치원, 어린이집 반의 연결고리 삭제
	public void deleteStudentUserDetailInfo(@Param("userId") String userId);
	
	
	// 유치원, 어린이집 내 피측정자 목록 조회
	public List<HashMap<String, Object>> selectDepartUserList(@Param("classCode") String classCode, @Param("measureDt") String measureDt) throws Exception;
	

}
