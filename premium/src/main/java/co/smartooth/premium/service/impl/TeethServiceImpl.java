package co.smartooth.premium.service.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import co.smartooth.premium.mapper.TeethMapper;
import co.smartooth.premium.service.TeethService;
import co.smartooth.premium.vo.TeethInfoVO;
import co.smartooth.premium.vo.TeethMeasureVO;
import co.smartooth.premium.vo.ToothMeasureVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Service
public class TeethServiceImpl implements TeethService{
	
	
	
	@Autowired(required = false)
	TeethMapper teethMapper;

	
	
	/** 공통 기능 **/
	// 피측정자 치아 정보 등록
	@Override
	public void insertUserTeethInfo(@Param("userId") String userId) throws Exception {
		teethMapper.insertUserTeethInfo(userId);
	}
	
	
	
    // 충치 단계별 수치 조회
	@Override
	public HashMap<String, Integer> selectCavityLevel() throws Exception {
		return teethMapper.selectCavityLevel();
	}
	
	
	
	// 측정일 목록 조회
	@Override
	public List<String> selectUserMeasureDtList(@Param("userId") String userId) throws Exception {
		return teethMapper.selectUserMeasureDtList(userId);
	}
	
	
	
	// 피측정자 치아 측정 값 조회 (기준:측정일)
	@Override
    public TeethMeasureVO selectUserMeasureValue(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception {
		return teethMapper.selectUserMeasureValue(userId, measureDt);
	}
	
	
	
	// 진단 내용 (DIAG_DECRIPT) 수정(업데이트) 
	@Override
	public void updateDiagDescript(@Param("userId") String userId, @Param("measureDt") String measureDt, @Param("diagDescript") String diagDescript) throws Exception {
		teethMapper.updateDiagDescript(userId, measureDt ,diagDescript);
	}
	
	
	
	// 피측정자 치아 측정 값 INSERT 
	@Override
	public void insertUserTeethMeasureValue(TeethMeasureVO teethMeasureVO) throws Exception {
		teethMapper.insertUserTeethMeasureValue(teethMeasureVO);
	}

	

	// 피측정자 개별 치아 측정 값 UPDATE
	@Override
	public void updateUserToothMeasureValue(ToothMeasureVO ToothMeasureVO) throws Exception {
		teethMapper.updateUserToothMeasureValue(ToothMeasureVO);
	}
	

	
	// 피측정자 충치 개수 수정(업데이트) - (기준:측정일)
	@Override
	public void updateUserCavityCntByMeasureDt(TeethMeasureVO teethMeasureVO) throws Exception {
		teethMapper.updateUserCavityCntByMeasureDt(teethMeasureVO);
	}
	
	
	
	// 피측정자의 SYSDATE(오늘)의 측정 값이 있는지 여부 확인 (0 : 오늘X, 1: 오늘)
	@Override
	public Integer isExistSysDateRow(@Param("userId") String userId) throws Exception {
		return teethMapper.isExistSysDateRow(userId);
	}
		
		
		
	// 피측정자의 기존 치아 측정 값 있는지 여부 반환(0 : 없음 / 1이상: 있음)
	@Override
	public Integer isExistOldRow(@Param("userId") String userId) throws Exception {
		return teethMapper.isExistOldRow(userId);
	}
	
	
	
	// 피측정자 치아 측정 값 조회 (기간)
	@Override
	public List<TeethMeasureVO> selectUserTeethMeasureValue(TeethMeasureVO dentistTeethMeasureVO) throws Exception {
		return teethMapper.selectUserTeethMeasureValue(dentistTeethMeasureVO);
	}
	
	
	
	// 피측정자 치아 개별 측정 값 조회 (기간)
	@Override
	public List<ToothMeasureVO> selectUserToothMeasureValue(ToothMeasureVO toothMeasureVO) throws Exception {
		return teethMapper.selectUserToothMeasureValue(toothMeasureVO);
	}
	
	
	
	// 피측정자 진단 정보 조회 (측정일)
	@Override
	public TeethMeasureVO selectDiagCd(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception{
		return teethMapper.selectDiagCd(userId, measureDt);
	}


	// 피측정자 진단 정보 업데이트 
	@Override
	public void updateDiagCd(@Param("userId") String userId, @Param("diagCd") String diagCd , @Param("measureDt") String measureDt) throws Exception {
		teethMapper.updateDiagCd(userId, diagCd, measureDt);
	}


	// 피측정자 비고(메모) 정보 조회 (측정일)
	@Override
	public TeethMeasureVO selectMemo(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception{
		return teethMapper.selectMemo(userId, measureDt);
	}
	
	
	// 피측정자 비고(메모) 정보 업데이트
	@Override
	public void updateMemo(@Param("userId") String userId, @Param("memo") String memo, @Param("measureDt") String measureDt) throws Exception {
		teethMapper.updateMemo(userId, memo, measureDt);
	}


	
	// 피측정자 치아 정보 조회
	@Override
	public String selectTeethStatus(@Param("userId") String userId) throws Exception {
		return teethMapper.selectTeethStatus(userId);
	}


	
	// T00~T99의 측정 기록을 일반 회원의 측정 기록으로 전환
	@Override
	public void updateMeasureValueUserId (@Param("userId") String userId, @Param("testUserId") String testUserId) throws Exception{
		teethMapper.updateMeasureValueUserId(userId, testUserId);
	}

	
	
	// T00~T99의 측정 기록 삭제
	@Override
	public void deleteMeasureValueUserId (@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception{
		teethMapper.deleteMeasureValueUserId(userId, measureDt);
	}



	// 빠른 전환 고객 첫 측정 날짜 조회
	@Override
	public String selectUserTeethMeasureDt(@Param("userId") String userId) throws Exception {
		return teethMapper.selectUserTeethMeasureDt(userId);
	}



	// 측정 기록에 측정자 아이디 업데이트
	@Override
	public void updateMeasurerId(String userId, String measurerId, String measureDt) throws Exception {
		teethMapper.updateMeasurerId(userId, measurerId, measureDt);
	}
	
	
	
	// 피측정자 치아 정보 등록
	@Override
	public void insertTeethStatus(@Param("userId") String userId, @Param("teethStatus") String teethStatus) throws Exception {
		teethMapper.insertTeethStatus(userId, teethStatus);
	}

	
	
	// 피측정자 치아 정보 업데이트
	@Override
	public void updateTeethStatus(@Param("userId") String userId, @Param("teethStatus") String teethStatus, @Param("recordDt") String recordDt) throws Exception {
		teethMapper.updateTeethStatus(userId, teethStatus, recordDt);
	}

	
	
	// 피측정자 치아 정보 갯수 조회
	@Override
	public int selectCountTeethInfo(@Param("userId") String userId, @Param("recordDt") String recordDt) throws Exception {
		return teethMapper.selectCountTeethInfo(userId, recordDt);
	}

	
	
	
	
	
	
	
	
	/** 치과서비스 **/
	@Override
	public String selectUserTeethType(@Param("userId") String userId) throws Exception{
		return teethMapper.selectUserTeethType(userId);
	}
	
	
	
	
	
	
	
	
	
	/** 유치원서비스 **/
	// 유치원,어린이집 소속 자녀(피측정자) 측정 값 목록
	@Override
	public List<HashMap<String, Object>> selectUserMeasureStatisticsList(@Param("schoolCode") String schoolCode, @Param("measureDt") String measureDt) throws Exception{
		return teethMapper.selectUserMeasureStatisticsList(schoolCode, measureDt); 
	}


	
	// 악화 지수 점수 업데이트 
	@Override
	public void updateUserDeteriorateScore(TeethMeasureVO teethMeasureVO) throws Exception {
		teethMapper.updateUserDeteriorateScore(teethMeasureVO);
	}


	
	// 진단 내용 업데이트 여부
	@Override
	public void updateDiagDescriptFlag(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception {
		teethMapper.updateDiagDescriptFlag(userId, measureDt);
	}




	
	
	
}