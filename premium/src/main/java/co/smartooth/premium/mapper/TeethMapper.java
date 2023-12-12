package co.smartooth.premium.mapper;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import co.smartooth.premium.vo.TeethInfoVO;
import co.smartooth.premium.vo.TeethMeasureVO;

/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Mapper
public interface TeethMapper {
	
	
	/** 공통 기능 **/
	// 피측정자 치아 상태 값 INSERT
	public void insertUserTeethInfo(@Param("userId") String userId) throws Exception;
	
	
	// 충치 단계별 수치 조회
	public HashMap<String, Integer> selectCavityLevel() throws Exception;
	
	
	// 측정일 목록 조회
	public List<String> selectUserMeasureDtList(@Param("userId") String userId) throws Exception;
	
	
	// 피측정자 치아 측정 값 조회 (기준:측정일)
	public TeethMeasureVO selectUserMeasureValue(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
	
	
	// 진단 내용 (DIAG_DECRIPT) 수정(업데이트) 
	public void updateDiagDescript(@Param("userId") String userId, @Param("measureDt") String measureDt, @Param("diagDescript") String diagDescript) throws Exception;
	
	
	// 피측정자 충치 개수 수정(업데이트) - (기준:측정일)
	public void updateUserCavityCntByMeasureDt(TeethMeasureVO teethMeasureVO) throws Exception;
	
 	
	
	
	
	
	/** 유치원, 어린이집 **/
 	// 유치원,어린이집 소속 자녀(피측정자) 측정 값 목록
 	public List<HashMap<String, Object>> selectUserMeasureStatisticsList(@Param("schoolCode") String schoolCode, @Param("measureDt") String measureDt) throws Exception;
 	
 	
 	// 악화 지수 점수 업데이트 
 	public void updateUserDeteriorateScore(TeethMeasureVO teethMeasureVO) throws Exception;
 	
 	
 	// 진단 내용 업데이트 여부
 	public void updateDiagDescriptFlag(@Param("userId") String userId, @Param("measureDt") String measureDt) throws Exception;
 	
	
 	// 비고 (memo) 업데이트
 	public void updateMemo(@Param("userId") String userId, @Param("measureDt") String measureDt, @Param("memo") String memo) throws Exception;


}
