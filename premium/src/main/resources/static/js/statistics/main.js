
var caution = 9;
var danger = 16;

function movePage(str){
	if(str=="1"){
		//main 화면으로 redirect : ID를 실어보내야하는지 그거 체크
		location.href="/premium/statistics/main.do"
	}else{
		//차트 화면으로 redirect
		location.href="/premium/statistics/logout.do"
	}
}

function changeToothColorByLevel(dataList, index) {
	
	if (dataList[index].t51< caution) { 														// 8이하일 경우 정상 치아
		$("#tooth51").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t51 > caution && dataList[index].t51  < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth51").attr("src", "/imgs/tooth/t51_y.png");
	} else if (dataList[index].t51 > danger && dataList[index].t51 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth51").attr("src", "/imgs/tooth/t51_r.png");
	}

	if (dataList[index].t52 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth52").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t52 > caution && dataList[index].t52 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth52").attr("src", "/imgs/tooth/t52_y.png");
	} else if (dataList[index].t52 > danger && dataList[index].t52 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth52").attr("src", "/imgs/tooth/t52_r.png");
	}

	if (dataList[index].t53 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth53").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t53 > caution && dataList[index].t53 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth53").attr("src", "/imgs/tooth/t53_y.png");
	} else if (dataList[index].t53 > danger && dataList[index].t53 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth53").attr("src", "/imgs/tooth/t53_r.png");
	}

	if (dataList[index].t54 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth54").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t54 >= caution && dataList[index].t54 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth54").attr("src", "/imgs/tooth/t54_y.png");
	} else if (dataList[index].t54 >= danger && dataList[index].t54 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth54").attr("src", "/imgs/tooth/t54_r.png");
	}

	if (dataList[index].t55 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth55").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t55 > caution && dataList[index].t55 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth55").attr("src", "/imgs/tooth/t55_y.png");
	} else if (dataList[index].t55 > danger && dataList[index].t55 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth55").attr("src", "/imgs/tooth/t55_r.png");
	}
	
	
	
	
	if (dataList[index].t61< caution) { 														// 8이하일 경우 정상 치아
		$("#tooth61").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t61 > caution && dataList[index].t61  < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth61").attr("src", "/imgs/tooth/t61_y.png");
	} else if (dataList[index].t61 > danger && dataList[index].t61 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth61").attr("src", "/imgs/tooth/t61_r.png");
	}

	if (dataList[index].t62 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth62").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t62 > caution && dataList[index].t62 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth62").attr("src", "/imgs/tooth/t62_y.png");
	} else if (dataList[index].t62 > danger && dataList[index].t62 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth62").attr("src", "/imgs/tooth/t62_r.png");
	}

	if (dataList[index].t63 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth63").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t63 > caution && dataList[index].t63 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth63").attr("src", "/imgs/tooth/t63_y.png");
	} else if (dataList[index].t63 > danger && dataList[index].t63 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth63").attr("src", "/imgs/tooth/t63_r.png");
	}

	if (dataList[index].t64 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth64").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t64 > caution && dataList[index].t64 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth64").attr("src", "/imgs/tooth/t64_y.png");
	} else if (dataList[index].t64 > danger && dataList[index].t64 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth64").attr("src", "/imgs/tooth/t64_r.png");
	}

	if (dataList[index].t65 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth65").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t65 > caution && dataList[index].t65 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth65").attr("src", "/imgs/tooth/t65_y.png");
	} else if (dataList[index].t65 > danger && dataList[index].t65 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth65").attr("src", "/imgs/tooth/t65_r.png");
	}
	
	
	
	
	if (dataList[index].t71< caution) { 														// 8이하일 경우 정상 치아
		$("#tooth71").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t71 > caution && dataList[index].t71 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth71").attr("src", "/imgs/tooth/t71_y.png");
	} else if (dataList[index].t71 > danger && dataList[index].t71 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth71").attr("src", "/imgs/tooth/t71_r.png");
	}

	if (dataList[index].t72 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth72").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t72 > caution && dataList[index].t72 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth72").attr("src", "/imgs/tooth/t72_y.png");
	} else if (dataList[index].t72 > danger && dataList[index].t72 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth72").attr("src", "/imgs/tooth/t72_r.png");
	}

	if (dataList[index].t73 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth73").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t73 > caution && dataList[index].t73 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth73").attr("src", "/imgs/tooth/t73_y.png");
	} else if (dataList[index].t73 > danger && dataList[index].t73 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth73").attr("src", "/imgs/tooth/t73_r.png");
	}

	if (dataList[index].t74 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth74").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t74 > caution && dataList[index].t74 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth74").attr("src", "/imgs/tooth/t74_y.png");
	} else if (dataList[index].t74 > danger && dataList[index].t74 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth74").attr("src", "/imgs/tooth/t74_r.png");
	}

	if (dataList[index].t75 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth75").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t75 > caution && dataList[index].t75 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth75").attr("src", "/imgs/tooth/t75_y.png");
	} else if (dataList[index].t75 > danger && dataList[index].t75 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth75").attr("src", "/imgs/tooth/t75_r.png");
	}
	
	
	
	
	if (dataList[index].t81< caution) { 														// 8이하일 경우 정상 치아
		$("#tooth81").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t81 > caution && dataList[index].t81 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth81").attr("src", "/imgs/tooth/t81_y.png");
	} else if (dataList[index].t81 > danger && dataList[index].t81 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth81").attr("src", "/imgs/tooth/t81_r.png");
	}

	if (dataList[index].t82 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth82").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t82 > caution && dataList[index].t82 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth82").attr("src", "/imgs/tooth/t82_y.png");
	} else if (dataList[index].t82 > danger && dataList[index].t82 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth82").attr("src", "/imgs/tooth/t82_r.png");
	}

	if (dataList[index].t83 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth83").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t83 > caution && dataList[index].t83 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth83").attr("src", "/imgs/tooth/t83_y.png");
	} else if (dataList[index].t83 > danger && dataList[index].t83 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth83").attr("src", "/imgs/tooth/t83_r.png");
	}

	if (dataList[index].t84 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth84").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t84 > caution && dataList[index].t84 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth84").attr("src", "/imgs/tooth/t84_y.png");
	} else if (dataList[index].t84 > danger && dataList[index].t84 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth84").attr("src", "/imgs/tooth/t84_r.png");
	}

	if (dataList[index].t85 < caution) { 														// 8이하일 경우 정상 치아
		$("#tooth85").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t85 > caution && dataList[index].t85 < danger) { // 9이상 15이하일 경우 충치 상태 주의
		$("#tooth85").attr("src", "/imgs/tooth/t85_y.png");
	} else if (dataList[index].t85 > danger && dataList[index].t85 < 100) {		// 16이상 99이하일 경우 충치
		$("#tooth85").attr("src", "/imgs/tooth/t85_r.png");
	}
	
}