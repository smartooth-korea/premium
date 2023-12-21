package co.smartooth.premium.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.smartooth.premium.mapper.UserMapper;
import co.smartooth.premium.service.UserService;
import co.smartooth.premium.vo.DentistInfoVO;
import co.smartooth.premium.vo.UserVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 08
 */
@Service
public class UserServiceImpl implements UserService{
	
	
	@Autowired(required = false)
	UserMapper userMapper;
	
	
	/** 공통 기능 **/
	// 계정 정보 조회
	@Override
	public UserVO selectUserInfo(@Param("userId") String userId) throws Exception {
		return userMapper.selectUserInfo(userId);
	}
	
	
	
	// 계정 비밀번호 변경
	@Override
	public void updateUserPwd(@Param("userId") String userId, @Param("userPwd") String userPwd) throws Exception {
		userMapper.updateUserPwd(userId, userPwd);
	}
	
	
	
	// 계정 정보 수정(업데이트)
	@Override
	public void updateUserInfo(UserVO userVo) throws Exception {
		userMapper.updateUserInfo(userVo);
	}
	
	
	
	// 계정 정보 삭제
	@Override
	public void deleteUserInfo(@Param("userId") String userId) throws Exception {
		userMapper.deleteUserInfo(userId);
	}
	
	
	
	@Override
	public void updatePushToken(@Param("userId") String userId, @Param("pushToken") String pushToken) throws Exception {
		userMapper.updatePushToken(userId, pushToken);
	}
	
	
	
	
	

	
	
	
	/** 치과서비스 측정 앱 **/
	// 부서ID로 해당 피측정자 목록 조회
	@Override
	public List<UserVO> selectMeasuredUserList(@Param("userId") String userId, @Param("orderBy") String orderBy) throws Exception {
		return userMapper.selectMeasuredUserList(userId, orderBy);
	}
	
	
	
	// 개인정보 제공을 동의한 환자 목록(SYSDATE)
	@Override
	public List<HashMap<String, Object>> selectInfomationAgreeUserList(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception {
		return userMapper.selectInfomationAgreeUserList(dentalHospitalCd);
	}

	
	
	// 치과 소속 의사 목록 조회
	@Override
	public List<HashMap<String, Object>>  selectDentistList(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception {
		return userMapper.selectDentistList(dentalHospitalCd);
	}
	
	
	
	// 현재 측정된 자료가 없는 T00~T99 사이의 환자 할당
	@Override
	public UserVO selectNoMeasureValueUserId(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception {
		return userMapper.selectNoMeasureValueUserId(dentalHospitalCd);
	}


	
	// 빠른등록으로 할당된 환자의 차이 형태 (유치,영구치) 업데이트
	@Override
	public void updateUserTeethType(@Param("userId") String userId, @Param("teethType") String teethType) throws Exception {
		userMapper.updateUserTeethType(userId, teethType);
	}
	
	
	
	// 치과 회원 상세 정보 등록
	@Override
	public void insertUserDetail(UserVO userVO) throws Exception {
		userMapper.insertUserDetail(userVO);
	}
	
	
	
	// 치과 소속 의사 목록 조회
	@Override
	public String selectDentistId(@Param("dentalHospitalCd") String dentalHospitalCd) throws Exception {
		return userMapper.selectDentistId(dentalHospitalCd);
	}


	
	// 치과 소속 의사 등록
	@Override
	public void insertDentistInfo(DentistInfoVO dentistInfoVO) throws Exception {
		userMapper.insertDentistInfo(dentistInfoVO);
	}
	
	
	
	
	
	
	
	
	
	/** 유치원, 어린이집 서비스 측정 앱 **/
	// 측정자 목록 조회
	@Override
	public List<HashMap<String, Object>> selectMeasurerList() throws Exception {
		return userMapper.selectMeasurerList();
	}

	
	
	// 반 소속 학생(측정예정) 목록 조회
	@Override
	public List<HashMap<String, Object>> selectStudentUserListByClassCode(@Param("userId") String userId, @Param("orderBy") String orderBy) throws Exception {
		return userMapper.selectStudentUserListByClassCode(userId, orderBy);
	}

	
	
	
	
	
	
	
	
	/** 유치원, 어린이집 서비스 조회 앱 **/
	// 아이디 중복 체크
	@Override
	public int duplicateChkId(String userId) throws Exception {
		return userMapper.duplicateChkId(userId);
	}
	
	
	
	// 계정 등록
	@Override
	public void insertUserInfo(UserVO userVO) throws Exception {
		userMapper.insertUserInfo(userVO);
	}
	
	
	
	// 계정(피측정자-원아) 상세 정보 등록 
	@Override
	public void insertStudentUserDetail(String userId, String schoolType, String classCode) throws Exception {
		userMapper.insertStudentUserDetail(userId, schoolType, classCode);
	}
	
	
	
	// 계정(법정대리인) 상세 정보 등록 
	@Override
	public void insertParentUserDetail(@Param("userId") String userId, @Param("childId") String childId) throws Exception {
		userMapper.insertParentUserDetail(userId, childId);
	}

	

	// 법정대리인 계정 정보로 자녀 계정 정보 조회
	@Override
	public List<UserVO> selectStudentUserInfoByParentUserId(@Param("userId") String userId) throws Exception {
		return userMapper.selectStudentUserInfoByParentUserId(userId);
	}
	
	
	
	// 법정대리인 계정 정보로 자녀 계정 정보 조회 (MAP)
	@Override
	public List<HashMap<String, String>> selectStudentUserInfoByParentUserIdForMap(@Param("userId") String userId) throws Exception {
		return userMapper.selectStudentUserInfoByParentUserIdForMap(userId);
	}



	// 법정대리인과 피측정자의 연결고리 삭제
	@Override
	public void deleteParentUserDetailInfo(@Param("userId") String userId, @Param("childId") String childId) {
		userMapper.deleteParentUserDetailInfo(userId, childId);
	}



	// 피측정자와 유치원, 어린이집 반의 연결고리 삭제
	@Override
	public void deleteStudentUserDetailInfo(@Param("userId") String userId) {
		userMapper.deleteStudentUserDetailInfo(userId);
	}


	
	// 유치원, 어린이집 내 피측정자 목록 조회
	@Override
	public List<HashMap<String, Object>> selectDepartUserList(@Param("classCode") String classCode, @Param("measureDt") String measureDt) throws Exception {
		return userMapper.selectDepartUserList(classCode, measureDt);
	}



}