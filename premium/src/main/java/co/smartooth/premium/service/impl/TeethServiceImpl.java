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


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 11. 09
 */
@Service
public class TeethServiceImpl implements TeethService{
	
	
	
	@Autowired(required = false)
	TeethMapper teethMapper;

	
	
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
	
	
	
	// 피측정자 충치 개수 수정(업데이트) - (기준:측정일)
	@Override
	public void updateUserCavityCntByMeasureDt(TeethMeasureVO teethMeasureVO) throws Exception {
		teethMapper.updateUserCavityCntByMeasureDt(teethMeasureVO);
	}
	
	
	
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


	// 비고 (memo) 업데이트
	@Override
	public void updateMemo(@Param("userId") String userId, @Param("measureDt") String measureDt, @Param("memo") String memo) throws Exception {
		teethMapper.updateMemo(userId, measureDt, memo);
	}
	
	
	
}