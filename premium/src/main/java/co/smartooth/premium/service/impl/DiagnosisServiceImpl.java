package co.smartooth.premium.service.impl;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.smartooth.premium.mapper.DiagnosisMapper;
import co.smartooth.premium.service.DiagnosisService;
import co.smartooth.premium.vo.DiagnosisVO;

/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 02. 02
 * 수정일 : 2023. 08. 04
 * 서버분리 : 2023. 08. 01
 */
@Service
public class DiagnosisServiceImpl implements DiagnosisService {
	
	
	
	@Autowired(required = false)
	DiagnosisMapper diagnosisMapper;
	
	
	
	/** 공통 기능 **/
	// 진단 키워드 제목 조회
	@Override
	public String selectDiagTitle(@Param("diagCd") String diagCd, @Param("teethType") String teethType) throws Exception {
		return diagnosisMapper.selectDiagTitle(diagCd, teethType);
	}

	
	
	// 중위 진단 정보 조회 
	@Override
	public List<DiagnosisVO> selectDiagDept2List(String teethType) throws Exception {
		return diagnosisMapper.selectDiagDept2List(teethType);
	}
	
	
	
	// 진단 키워드 DESCRIPT 조회 - teethType : M, B, P
	@Override
	public String selectDiagDescript(@Param("descCd") String descCd, @Param("teethType") String teethType) throws Exception {
		return diagnosisMapper.selectDiagDescript(descCd, teethType);
	}



	// 진단 키워드 별 태그 변환
	@Override
	public String changeSalesKewordHtmlTag(@Param("keyword") String keyword) throws Exception {
		return diagnosisMapper.changeSalesKewordHtmlTag(keyword);
	}

	
	
}
