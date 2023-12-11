
function changeToothColorByLevel(dataList, index, paramCaution, paramDanger) {
	
	// 값 비교를 위한 형변환
	var caution = parseInt(paramCaution);
	var danger = parseInt(paramDanger);

	// 1000이상이 넘을 경우 측정값이 보정된 것이므로 1000을 빼서 본래의 값으로 전달
	// 영구치 상악
	if(parseInt(dataList[index].t11) > 100){
		dataList[index].t11 = parseInt(dataList[index].t11)-1000;
	}
	if(parseInt(dataList[index].t12) > 100){
		dataList[index].t12 = parseInt(dataList[index].t12)-1000;
	}
	if(parseInt(dataList[index].t13) > 100){
		dataList[index].t13 = parseInt(dataList[index].t13)-1000;
	}
	if(parseInt(dataList[index].t14) > 100){
		dataList[index].t14 = parseInt(dataList[index].t14)-1000;
	}
	if(parseInt(dataList[index].t15) > 100){
		dataList[index].t15 = parseInt(dataList[index].t15)-1000;
	}
	// 영구치 어금니(혼합치에 해당하는 곳)
	if(parseInt(dataList[index].t16) > 100){
		dataList[index].t16 = parseInt(dataList[index].t16)-1000;
	}
	if(parseInt(dataList[index].t17) > 100){
		dataList[index].t17 = parseInt(dataList[index].t17)-1000;
	}
	if(parseInt(dataList[index].t18) > 100){
		dataList[index].t18 = parseInt(dataList[index].t18)-1000;
	}
	
	if(parseInt(dataList[index].t21) > 100){
		dataList[index].t21 = parseInt(dataList[index].t21)-1000;
	}
	if(parseInt(dataList[index].t22) > 100){
		dataList[index].t22 = parseInt(dataList[index].t22)-1000;
	}
	if(parseInt(dataList[index].t23) > 100){
		dataList[index].t23 = parseInt(dataList[index].t23)-1000;
	}
	if(parseInt(dataList[index].t24) > 100){
		dataList[index].t24 = parseInt(dataList[index].t24)-1000;
	}
	if(parseInt(dataList[index].t25) > 100){
		dataList[index].t25 = parseInt(dataList[index].t25)-1000;
	}
	// 영구치 어금니(혼합치에 해당하는 곳)
	if(parseInt(dataList[index].t26) > 100){
		dataList[index].t26 = parseInt(dataList[index].t26)-1000;
	}
	if(parseInt(dataList[index].t27) > 100){
		dataList[index].t27 = parseInt(dataList[index].t27)-1000;
	}
	if(parseInt(dataList[index].t28) > 100){
		dataList[index].t28 = parseInt(dataList[index].t28)-1000;
	}

	// 영구치 하악
	if(parseInt(dataList[index].t31) > 100){
		dataList[index].t31 = parseInt(dataList[index].t31)-1000;
	}
	if(parseInt(dataList[index].t32) > 100){
		dataList[index].t32 = parseInt(dataList[index].t32)-1000;
	}
	if(parseInt(dataList[index].t33) > 100){
		dataList[index].t33 = parseInt(dataList[index].t33)-1000;
	}
	if(parseInt(dataList[index].t34) > 100){
		dataList[index].t34 = parseInt(dataList[index].t34)-1000;
	}
	if(parseInt(dataList[index].t35) > 100){
		dataList[index].t35 = parseInt(dataList[index].t35)-1000;
	}
	// 영구치 어금니(혼합치에 해당하는 곳)
	if(parseInt(dataList[index].t36) > 100){
		dataList[index].t36 = parseInt(dataList[index].t36)-1000;
	}
	if(parseInt(dataList[index].t37) > 100){
		dataList[index].t37 = parseInt(dataList[index].t37)-1000;
	}
	if(parseInt(dataList[index].t38) > 100){
		dataList[index].t38 = parseInt(dataList[index].t38)-1000;
	}
	
	if(parseInt(dataList[index].t41) > 100){
		dataList[index].t41 = parseInt(dataList[index].t41)-1000;
	}
	if(parseInt(dataList[index].t42) > 100){
		dataList[index].t42 = parseInt(dataList[index].t42)-1000;
	}
	if(parseInt(dataList[index].t43) > 100){
		dataList[index].t43 = parseInt(dataList[index].t43)-1000;
	}
	if(parseInt(dataList[index].t44) > 100){
		dataList[index].t44 = parseInt(dataList[index].t44)-1000;
	}
	if(parseInt(dataList[index].t45) > 100){
		dataList[index].t45 = parseInt(dataList[index].t45)-1000;
	}
	// 영구치 어금니(혼합치에 해당하는 곳)
	if(parseInt(dataList[index].t46) > 100){
		dataList[index].t46 = parseInt(dataList[index].t46)-1000;
	}
	if(parseInt(dataList[index].t47) > 100){
		dataList[index].t47 = parseInt(dataList[index].t47)-1000;
	}
	if(parseInt(dataList[index].t48) > 100){
		dataList[index].t48 = parseInt(dataList[index].t48)-1000;
	}
	
	
	// 유치
	if(parseInt(dataList[index].t51) > 100){
		dataList[index].t51 = parseInt(dataList[index].t51)-1000;
	}
	if(parseInt(dataList[index].t52) > 100){
		dataList[index].t52 = parseInt(dataList[index].t52)-1000;
	}
	if(parseInt(dataList[index].t53) > 100){
		dataList[index].t53 = parseInt(dataList[index].t53)-1000;
	}
	if(parseInt(dataList[index].t54) > 100){
		dataList[index].t54 = parseInt(dataList[index].t54)-1000;
	}
	if(parseInt(dataList[index].t55) > 100){
		dataList[index].t55 = parseInt(dataList[index].t55)-1000;
	}
	
	
	if(parseInt(dataList[index].t61) > 100){
		dataList[index].t61 = parseInt(dataList[index].t61)-1000;
	}
	if(parseInt(dataList[index].t62) > 100){
		dataList[index].t62 = parseInt(dataList[index].t62)-1000;
	}
	if(parseInt(dataList[index].t63) > 100){
		dataList[index].t63 = parseInt(dataList[index].t63)-1000;
	}
	if(parseInt(dataList[index].t64) > 100){
		dataList[index].t64 = parseInt(dataList[index].t64)-1000;
	}
	if(parseInt(dataList[index].t65) > 100){
		dataList[index].t65 = parseInt(dataList[index].t65)-1000;
	}
	
	
	if(parseInt(dataList[index].t71) > 100){
		dataList[index].t71 = parseInt(dataList[index].t71)-1000;
	}
	if(parseInt(dataList[index].t72) > 100){
		dataList[index].t72 = parseInt(dataList[index].t72)-1000;
	}
	if(parseInt(dataList[index].t73) > 100){
		dataList[index].t73 = parseInt(dataList[index].t73)-1000;
	}
	if(parseInt(dataList[index].t74) > 100){
		dataList[index].t74 = parseInt(dataList[index].t74)-1000;
	}
	if(parseInt(dataList[index].t75) > 100){
		dataList[index].t75 = parseInt(dataList[index].t75)-1000;
	}
	
	
	if(parseInt(dataList[index].t81) > 100){
		dataList[index].t81 = parseInt(dataList[index].t81)-1000;
	}
	if(parseInt(dataList[index].t82) > 100){
		dataList[index].t82 = parseInt(dataList[index].t82)-1000;
	}
	if(parseInt(dataList[index].t83) > 100){
		dataList[index].t83 = parseInt(dataList[index].t83)-1000;
	}
	if(parseInt(dataList[index].t84) > 100){
		dataList[index].t84 = parseInt(dataList[index].t84)-1000;
	}
	if(parseInt(dataList[index].t85) > 100){
		dataList[index].t85 = parseInt(dataList[index].t85)-1000;
	}
	
	
	// 주의, 충지에 대한 치아 색 변경하는 부분
	// 영구치 상악
	if (dataList[index].t11< caution) { 														
		$("#tooth11").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t11 >= caution && dataList[index].t11  < danger) { 
		$("#tooth11").attr("src", "/imgs/tooth/t11_y.png");
	} else if (dataList[index].t11 >= danger && dataList[index].t11 < 100) {		
		$("#tooth11").attr("src", "/imgs/tooth/t11_r.png");
	}
	if (dataList[index].t12< caution) { 														
		$("#tooth12").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t12 >= caution && dataList[index].t12  < danger) { 
		$("#tooth12").attr("src", "/imgs/tooth/t12_y.png");
	} else if (dataList[index].t12 >= danger && dataList[index].t12 < 100) {		
		$("#tooth12").attr("src", "/imgs/tooth/t12_r.png");
	}
	if (dataList[index].t21< caution) { 														
		$("#tooth21").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t21 >= caution && dataList[index].t21  < danger) { 
		$("#tooth21").attr("src", "/imgs/tooth/t21_y.png");
	} else if (dataList[index].t21 >= danger && dataList[index].t21 < 100) {		
		$("#tooth21").attr("src", "/imgs/tooth/t21_r.png");
	}
	if (dataList[index].t22< caution) { 														
		$("#tooth22").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t22 >= caution && dataList[index].t22  < danger) { 
		$("#tooth22").attr("src", "/imgs/tooth/t22_y.png");
	} else if (dataList[index].t22 >= danger && dataList[index].t22 < 100) {		
		$("#tooth22").attr("src", "/imgs/tooth/t22_r.png");
	}
	
	// 영구치 하악
	if (dataList[index].t31< caution) { 														
		$("#tooth31").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t31 >= caution && dataList[index].t31  < danger) { 
		$("#tooth31").attr("src", "/imgs/tooth/t31_y.png");
	} else if (dataList[index].t31 >= danger && dataList[index].t31 < 100) {		
		$("#tooth31").attr("src", "/imgs/tooth/t31_r.png");
	}
	if (dataList[index].t32< caution) { 														
		$("#tooth32").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t32 >= caution && dataList[index].t32  < danger) { 
		$("#tooth32").attr("src", "/imgs/tooth/t32_y.png");
	} else if (dataList[index].t32 >= danger && dataList[index].t32 < 100) {		
		$("#tooth32").attr("src", "/imgs/tooth/t32_r.png");
	}
	if (dataList[index].t41< caution) { 														
		$("#tooth41").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t41 >= caution && dataList[index].t41  < danger) { 
		$("#tooth41").attr("src", "/imgs/tooth/t41_y.png");
	} else if (dataList[index].t41 >= danger && dataList[index].t41 < 100) {		
		$("#tooth41").attr("src", "/imgs/tooth/t41_r.png");
	}
	if (dataList[index].t42< caution) { 														
		$("#tooth42").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t42 >= caution && dataList[index].t42  < danger) { 
		$("#tooth42").attr("src", "/imgs/tooth/t42_y.png");
	} else if (dataList[index].t42 >= danger && dataList[index].t42 < 100) {		
		$("#tooth42").attr("src", "/imgs/tooth/t42_r.png");
	}
	
	// 영구치 어금니
	if (dataList[index].t16< caution) { 														
		$("#tooth16").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t16 >= caution && dataList[index].t16  < danger) { 
		$("#tooth16").attr("src", "/imgs/tooth/t16_y.png");
	} else if (dataList[index].t16 >= danger && dataList[index].t16 < 100) {		
		$("#tooth16").attr("src", "/imgs/tooth/t16_r.png");
	}
	if (dataList[index].t26 < caution) { 														
		$("#tooth26").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t26 >= caution && dataList[index].t26 < danger) { 
		$("#tooth26").attr("src", "/imgs/tooth/t26_y.png");
	} else if (dataList[index].t26 >= danger && dataList[index].t26 < 100) {		
		$("#tooth26").attr("src", "/imgs/tooth/t26_r.png");
	}
	if (dataList[index].t36 < caution) { 														
		$("#tooth36").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t36 >= caution && dataList[index].t36 < danger) { 
		$("#tooth36").attr("src", "/imgs/tooth/t36_y.png");
	} else if (dataList[index].t36 >= danger && dataList[index].t36 < 100) {		
		$("#tooth36").attr("src", "/imgs/tooth/t36_r.png");
	}
	if (dataList[index].t46 < caution) { 														
		$("#tooth46").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t46 >= caution && dataList[index].t46 < danger) { 
		$("#tooth46").attr("src", "/imgs/tooth/t46_y.png");
	} else if (dataList[index].t46 >= danger && dataList[index].t46 < 100) {		
		$("#tooth46").attr("src", "/imgs/tooth/t46_r.png");
	}
	
	
	
	// 유치
	if (dataList[index].t51 < caution) {
		$("#tooth51").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t51 >= caution && dataList[index].t51  < danger) {
		$("#tooth51").attr("src", "/imgs/tooth/t51_y.png");
	} else if (dataList[index].t51 >= danger && dataList[index].t51 < 100) {
		$("#tooth51").attr("src", "/imgs/tooth/t51_r.png");
	}

	if (dataList[index].t52 < caution) { 														
		$("#tooth52").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t52 >= caution && dataList[index].t52 < danger) { 
		$("#tooth52").attr("src", "/imgs/tooth/t52_y.png");
	} else if (dataList[index].t52 >= danger && dataList[index].t52 < 100) {		
		$("#tooth52").attr("src", "/imgs/tooth/t52_r.png");
	}

	if (dataList[index].t53 < caution) { 														
		$("#tooth53").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t53 >= caution && dataList[index].t53 < danger) { 
		$("#tooth53").attr("src", "/imgs/tooth/t53_y.png");
	} else if (dataList[index].t53 >= danger && dataList[index].t53 < 100) {		
		$("#tooth53").attr("src", "/imgs/tooth/t53_r.png");
	}

	if (dataList[index].t54 < caution) { 	
		$("#tooth54").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t54 >= caution && dataList[index].t54 < danger) {
		$("#tooth54").attr("src", "/imgs/tooth/t54_y.png");
	} else if (dataList[index].t54 >= danger && dataList[index].t54 < 100) {		
		$("#tooth54").attr("src", "/imgs/tooth/t54_r.png");
	}

	if (dataList[index].t55 < caution) { 														
		$("#tooth55").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t55 >= caution && dataList[index].t55 < danger) { 
		$("#tooth55").attr("src", "/imgs/tooth/t55_y.png");
	} else if (dataList[index].t55 >= danger && dataList[index].t55 < 100) {		
		$("#tooth55").attr("src", "/imgs/tooth/t55_r.png");
	}
	
	if (dataList[index].t61< caution) { 														
		$("#tooth61").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t61 >= caution && dataList[index].t61  < danger) { 
		$("#tooth61").attr("src", "/imgs/tooth/t61_y.png");
	} else if (dataList[index].t61 >= danger && dataList[index].t61 < 100) {		
		$("#tooth61").attr("src", "/imgs/tooth/t61_r.png");
	}

	if (dataList[index].t62 < caution) { 														
		$("#tooth62").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t62 >= caution && dataList[index].t62 < danger) { 
		$("#tooth62").attr("src", "/imgs/tooth/t62_y.png");
	} else if (dataList[index].t62 >= danger && dataList[index].t62 < 100) {		
		$("#tooth62").attr("src", "/imgs/tooth/t62_r.png");
	}

	if (dataList[index].t63 < caution) { 														
		$("#tooth63").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t63 >= caution && dataList[index].t63 < danger) { 
		$("#tooth63").attr("src", "/imgs/tooth/t63_y.png");
	} else if (dataList[index].t63 >= danger && dataList[index].t63 < 100) {		
		$("#tooth63").attr("src", "/imgs/tooth/t63_r.png");
	}

	if (dataList[index].t64 < caution) { 														
		$("#tooth64").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t64 >= caution && dataList[index].t64 < danger) { 
		$("#tooth64").attr("src", "/imgs/tooth/t64_y.png");
	} else if (dataList[index].t64 >= danger && dataList[index].t64 < 100) {		
		$("#tooth64").attr("src", "/imgs/tooth/t64_r.png");
	}

	if (dataList[index].t65 < caution) { 														
		$("#tooth65").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t65 >= caution && dataList[index].t65 < danger) { 
		$("#tooth65").attr("src", "/imgs/tooth/t65_y.png");
	} else if (dataList[index].t65 >= danger && dataList[index].t65 < 100) {		
		$("#tooth65").attr("src", "/imgs/tooth/t65_r.png");
	}

	if (dataList[index].t71< caution) { 														
		$("#tooth71").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t71 >= caution && dataList[index].t71 < danger) { 
		$("#tooth71").attr("src", "/imgs/tooth/t71_y.png");
	} else if (dataList[index].t71 >= danger && dataList[index].t71 < 100) {		
		$("#tooth71").attr("src", "/imgs/tooth/t71_r.png");
	}

	if (dataList[index].t72 < caution) { 														
		$("#tooth72").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t72 >= caution && dataList[index].t72 < danger) { 
		$("#tooth72").attr("src", "/imgs/tooth/t72_y.png");
	} else if (dataList[index].t72 >= danger && dataList[index].t72 < 100) {		
		$("#tooth72").attr("src", "/imgs/tooth/t72_r.png");
	}

	if (dataList[index].t73 < caution) { 														
		$("#tooth73").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t73 >= caution && dataList[index].t73 < danger) { 
		$("#tooth73").attr("src", "/imgs/tooth/t73_y.png");
	} else if (dataList[index].t73 >= danger && dataList[index].t73 < 100) {		
		$("#tooth73").attr("src", "/imgs/tooth/t73_r.png");
	}

	if (dataList[index].t74 < caution) { 														
		$("#tooth74").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t74 >= caution && dataList[index].t74 < danger) { 
		$("#tooth74").attr("src", "/imgs/tooth/t74_y.png");
	} else if (dataList[index].t74 >= danger && dataList[index].t74 < 100) {		
		$("#tooth74").attr("src", "/imgs/tooth/t74_r.png");
	}

	if (dataList[index].t75 < caution) { 														
		$("#tooth75").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t75 >= caution && dataList[index].t75 < danger) { 
		$("#tooth75").attr("src", "/imgs/tooth/t75_y.png");
	} else if (dataList[index].t75 >= danger && dataList[index].t75 < 100) {		
		$("#tooth75").attr("src", "/imgs/tooth/t75_r.png");
	}

	if (dataList[index].t81< caution) { 														
		$("#tooth81").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t81 >= caution && dataList[index].t81 < danger) { 
		$("#tooth81").attr("src", "/imgs/tooth/t81_y.png");
	} else if (dataList[index].t81 >= danger && dataList[index].t81 < 100) {		
		$("#tooth81").attr("src", "/imgs/tooth/t81_r.png");
	}

	if (dataList[index].t82 < caution) { 														
		$("#tooth82").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t82 >= caution && dataList[index].t82 < danger) { 
		$("#tooth82").attr("src", "/imgs/tooth/t82_y.png");
	} else if (dataList[index].t82 >= danger && dataList[index].t82 < 100) {		
		$("#tooth82").attr("src", "/imgs/tooth/t82_r.png");
	}

	if (dataList[index].t83 < caution) { 														
		$("#tooth83").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t83 >= caution && dataList[index].t83 < danger) { 
		$("#tooth83").attr("src", "/imgs/tooth/t83_y.png");
	} else if (dataList[index].t83 >= danger && dataList[index].t83 < 100) {		
		$("#tooth83").attr("src", "/imgs/tooth/t83_r.png");
	}

	if (dataList[index].t84 < caution) { 														
		$("#tooth84").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t84 >= caution && dataList[index].t84 < danger) { 
		$("#tooth84").attr("src", "/imgs/tooth/t84_y.png");
	} else if (dataList[index].t84 >= danger && dataList[index].t84 < 100) {		
		$("#tooth84").attr("src", "/imgs/tooth/t84_r.png");
	}

	if (dataList[index].t85 < caution) { 														
		$("#tooth85").attr("src", "/imgs/tooth/empty.png");
	} else if (dataList[index].t85 >= caution && dataList[index].t85 < danger) { 
		$("#tooth85").attr("src", "/imgs/tooth/t85_y.png");
	} else if (dataList[index].t85 >= danger && dataList[index].t85 < 100) {		
		$("#tooth85").attr("src", "/imgs/tooth/t85_r.png");
	}
	
}