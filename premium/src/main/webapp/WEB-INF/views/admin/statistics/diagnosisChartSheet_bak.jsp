<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="㈜스마트코리아" />
<meta name="description" content="Smartooth" />
<title>Smartooth :: 차트 :: main</title>
<!-- FAVICON ICO ERROR 방지 -->
<link rel="shortcut icon" type="image/x-icon" href="/imgs/common/logo_img_ori.png">
<script type="text/javascript" src="/js/jquery/jquery.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-base.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-ui.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/js/anychart-exports.min.js"></script>
<script src="https://cdn.anychart.com/releases/v8/themes/monochrome.min.js"></script>
<link href="https://cdn.anychart.com/releases/v8/css/anychart-ui.min.css" type="text/css" rel="stylesheet">
<link href="https://cdn.anychart.com/releases/v8/fonts/css/anychart-font.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="/css/common/layout.css">
<link rel="stylesheet" href="/css/premium/admin/statistics/diagnosis.css">
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<style type="text/css">
.menu {
	display: flex;
	margin-left: 15px;
}

html, body, #container {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>

	<div id="container"></div>


	<script>

    anychart.onDocumentReady(function () {
		// 차트 테마
		anychart.theme('monochrome');
		// create data set
		var dataSet = anychart.data.set(getData());

		// map data for the first series, take x from the zero column and value from the first column of data set
		var firstSeriesData = dataSet.mapAs({
			x : 0,
			value : 1
		});

		// map data for the second series, take x from the zero column and value from the second column of data set
		var secondSeriesData = dataSet.mapAs({
			x : 0,
			value : 2
		});

		// create bar chart
		var chart = anychart.bar();

		// turn on chart animation
		chart.animation(true);

		// set padding
		chart.padding([ 10, 20, 5, 20 ]);

		// force chart to stack values by Y scale.
		chart.yScale().stackMode('value');

		// format y axis labels so they are always positive
		chart.yAxis().labels().format(function() {
			return Math.abs(this.value).toLocaleString();
		});

		// set title for Y-axis
		chart.yAxis(0).title('Revenue in Dollars');

		// allow labels to overlap
		chart.xAxis(0).overlapMode('allow-overlap');

		// turn on extra axis for the symmetry
		chart.xAxis(1).enabled(true).orientation('right')
				.overlapMode('allow-overlap');

		// 차트 제목
		chart.title('Cosmetic Sales by Gender');

		chart.interactivity().hoverMode('by-x');

		chart
				.tooltip()
				.title(false)
				.separator(false)
				.displayMode('separated')
				.positionMode('point')
				.useHtml(true)
				.fontSize(12)
				.offsetX(5)
				.offsetY(0)
				.format(
						function() {
							return ('<span style="color: #D9D9D9">$</span>' + Math
									.abs(this.value)
									.toLocaleString());
						});

		// temp variable to store series instance
		var series;

		// create first series with mapped data
		series = chart.bar(firstSeriesData);
		series.name('Females').color('HotPink');
		series.tooltip().position('right')
				.anchor('left-center');

		// create second series with mapped data
		series = chart.bar(secondSeriesData);
		series.name('Males');
		series.tooltip().position('left')
				.anchor('right-center');

		// turn on legend
		chart.legend().enabled(true).inverted(true)
				.fontSize(13).padding([ 0, 0, 20, 0 ]);

		// set container id for the chart
		chart.container('container');

		// initiate chart drawing
		chart.draw();
	});

	function getData() {
		return [ [ 'Nail polish', 5376, -229 ],
				[ 'Eyebrow pencil', 10987, -932 ],
				[ 'Rouge', 7624, -5221 ], [ 'Lipstick', 8814, -256 ],
				[ 'Eyeshadows', 8998, -308 ],
				[ 'Eyeliner', 9321, -432 ],
				[ 'Foundation', 8342, -701 ],
				[ 'Lip gloss', 6998, -908 ], [ 'Mascara', 9261, -712 ],
				[ 'Shampoo', 5376, -9229 ],
				[ 'Hair conditioner', 10987, -13932 ],
				[ 'Body lotion', 7624, -10221 ],
				[ 'Shower gel', 8814, -12256 ],
				[ 'Soap', 8998, -5308 ], [ 'Eye fresher', 9321, -432 ],
				[ 'Deodorant', 8342, -11701 ],
				[ 'Hand cream', 7598, -5808 ],
				[ 'Foot cream', 6098, -3987 ],
				[ 'Night cream', 6998, -847 ],
				[ 'Day cream', 5304, -4008 ],
				[ 'Vanila cream', 9261, -712 ] ];
	}
</script>
</body>
</html>