<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- WEB -->
<!-- menu -->
<div class="menu">
	<div id="diagnosis_data_btn" class="menu_btn" onclick="location.href='/web/statistics/diagnosis'">Result</div>
	<div id="diagnosis_graph_btn" class="menu_btn"  onclick="location.href='/web/statistics/graph'">Graph</div>
	<div id="logout" onclick="location.href='/web/statistics/general/logout.do?lang=en&urlType=${urlType}'">
		<img id="logout_btn" alt="logout" src="/imgs/layout/btn/logout_btn.png">
	</div>
</div>
<!-- End of menu -->