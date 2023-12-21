package co.smartooth.premium.service;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import co.smartooth.premium.vo.TeethMeasureVO;
import co.smartooth.premium.vo.ToothMeasureVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
public interface TeethService {
	
	
	/** 공통 기능 **/
	// 피측정자 치아 정보 등록
	public void insertUserTeethInfo(@Param("userId") String userId) throws Exception;
	
	
	// 충치 단계별 수치 조회
	public HashMap<String, Integer> selectCavityLevel() throws Exception;
	
	
	// 측정일 목록 조회
	public List<String> selectUserMeasureDtList(@Param("userId") String userId) throws Exception;
	
	
	// 피측정자 치아 측정 값 조회 (기준:측정일)
	public TeethMeasureVO selectUserMeasureValue(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
	
	
	// 진단 내용 (DIAG_DECRIPT) 수정(업데이트) 
	public void updateDiagDescript(@Param("userId") String userId, @Param("measureDt") String measureDt, @Param("diagDescript") String diagDescript) throws Exception;
	
	
	// 피측정자 치아 측정 값 등록
	public void insertUserTeethMeasureValue(TeethMeasureVO teethMeasureVO) throws Exception;

	
	// 피측정자 개별 치아 측정 값 업데이트
	public void updateUserToothMeasureValue(ToothMeasureVO ToothMeasureVO) throws Exception;
	
	
	// 피측정자 충치 개수 수정(업데이트) - (기준:측정일)
	public void updateUserCavityCntByMeasureDt(TeethMeasureVO teethMeasureVO) throws Exception;
	
	
	// 피측정자의 SYSDATE(오늘)의 측정 값이 있는지 여부 확인 (0 : 오늘X, 1: 오늘)
	public Integer isExistSysDateRow(@Param("userId") String userId) throws Exception;

		
	// 피측정자의 기존 치아 측정 값 있는지 여부 반환(0 : 없음 / 1이상: 있음)
	public Integer isExistOldRow(@Param("userId") String userId) throws Exception;

	
	// 피측정자 치아 측정 값 조회 (기간)
	public List<TeethMeasureVO> selectUserTeethMeasureValue(TeethMeasureVO teethMeasureVO) throws Exception;
	
	
	// 피측정자 치아 개별 측정 값 조회 (기간)
	public List<ToothMeasureVO> selectUserToothMeasureValue(ToothMeasureVO ToothMeasureVO) throws Exception;
	
	
	// 피측정자 진단 정보 조회 (측정일)
	public TeethMeasureVO selectDiagCd(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
		
		
	// 피측정자 진단 정보 업데이트
	public void updateDiagCd(@Param("userId") String userId, @Param("diagCd") String diagCd , @Param("measureDt") String measureDt) throws Exception;
	
	
	// 피측정자 비고(메모) 정보 조회 (측정일)
	public TeethMeasureVO selectMemo(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
		
		
	// 피측정자 비고(메모) 정보 업데이트
	public void updateMemo(@Param("userId") String userId, @Param("memo") String memo, @Param("measureDt") String measureDt) throws Exception;
	
	
	// 피측정자 치아 정보 조회
	public String selectTeethStatus(@Param("userId") String userId) throws Exception;
	
	
	// T00~T99의 측정 기록을 일반 회원의 측정 기록으로 전환
	public void updateMeasureValueUserId(@Param("userId") String userId, @Param("testUserId") String testUserId) throws Exception;
	
	
	// T00~T99의 측정 기록 삭제
	public void deleteMeasureValueUserId(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
	
	
	// 빠른 전환 고객 첫 측정 날짜 조회
	public String selectUserTeethMeasureDt(@Param("userId") String userId) throws Exception;
	
	
	// 측정 기록에 측정자 아이디 업데이트
	public void updateMeasurerId(@Param("userId") String userId, @Param("measurerId") String measurerId, @Param("measureDt") String measureDt) throws Exception;
	
	
	// 피측정자 치아 정보 등록
	public void insertTeethStatus(@Param("userId") String userId, @Param("teethStatus") String teethStatus) throws Exception;

	
	// 피측정자 치아 정보 업데이트
	public void updateTeethStatus(@Param("userId") String userId, @Param("teethStatus") String teethStatus, @Param("recordDt") String recordDt) throws Exception;
	
	
	// 피측정자 치아 정보 갯수 조회
	public int selectCountTeethInfo(@Param("userId") String userId, @Param("recordDt") String recordDt) throws Exception;
	
	
	
	
	
	
	/** 치과서비스 측정 앱 **/
	// 피측정자 치아 유형 조회
	public String selectUserTeethType(@Param("userId") String userId) throws Exception;
	
	
	
	
	
	
	/** 유치원, 어린이집 측정 앱 **/
	// 피측정자 최근 측정일 조회
	public String selectMeasureDt(@Param("userId") String userId) throws Exception;
	
	
	
	

	
	/** 유치원, 어린이집서비스 조회 앱 **/
 	// 유치원,어린이집 소속 자녀(피측정자) 측정 값 목록
 	public List<HashMap<String, Object>> selectUserMeasureStatisticsList(@Param("schoolCode") String schoolCode, @Param("measureDt") String measureDt) throws Exception;
 	
 	
 	// 악화 지수 점수 업데이트 
 	public void updateUserDeteriorateScore(TeethMeasureVO teethMeasureVO) throws Exception;
 	
 	
 	// 진단 내용 업데이트 여부
 	public void updateDiagDescriptFlag(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
 	
	


}
