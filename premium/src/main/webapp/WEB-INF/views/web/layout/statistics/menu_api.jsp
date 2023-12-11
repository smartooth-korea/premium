<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- WEB -->
<!-- menu -->
<script type="text/javascript">
function logout(){
	if (!confirm("로그아웃 하시겠습니까?")) {
        return false;
    } else {
    	window.location.href = "/web/statistics/logout.do";
    }
}
</script>
<div class="menu">
	<div id="diagnosis_data_btn" class="menu_btn" onclick="location.href='/admin/school/statistics/diagnosis.do?userId=${userId}&measureDt=${measureDt}&schoolCode=${schoolCode}'">진단 결과지</div>
	<div id="diagnosis_graph_btn" class="menu_btn"  onclick="location.href='/admin/school/statistics/graph.do?userId=${userId}&measureDt=${measureDt}&schoolCode=${schoolCode}'">구강관리에 따른 원아 순위</div>
</div>
<!-- End of menu -->