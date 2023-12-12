package co.smartooth.premium.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import co.smartooth.premium.vo.DiagnosisVO;


/**
 * 작성자 : 정주현 
 * 작성일 : 2023. 02. 02
 */
@Mapper
public interface DiagnosisMapper {
	

	/** 유치원, 어린이집 **/
	/** WEB **/
	// 중위 진단 정보 조회 
	public List<DiagnosisVO> selectDiagDept2List() throws Exception;

	
	// 진단 키워드 DESCRIPT 조회 - teethType : M, B, P
	public String selectDiagDescript(@Param("descCd") String descCd, @Param("teethType") String teethType) throws Exception;
	
	
	// 진단 키워드 제목 조회
	public String selectDiagTitle(@Param("diagCd") String diagCd, @Param("teethType") String teethType) throws Exception;
	
	
	// 진단 키워드 별 태그 변환
	public String changeSalesKewordHtmlTag(@Param("keyword") String keyword) throws Exception;
	
	
}
