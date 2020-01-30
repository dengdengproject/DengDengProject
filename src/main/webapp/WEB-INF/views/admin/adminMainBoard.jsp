<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-admin-menu.jspf"%>

<!-- 게시판 관리 -->
<div style="height: 1200px; border-top: solid;">
	<div
		style="text-align: center; margin-top: 2em; position: relative; right: 28em">
		<span style="font-weight: bold; font-size: 1.5em;">게시판 관리</span>
	</div>

	<div align="center" style="margin-top: 5em;">

		<div align="center">
			<div class="tabs">
				<div class="tab active_tab"
					style="position: relative; top: 10.69em; right: 40em;">
					<div class="label">공지사항</div>
				</div>
				<div class="tab"
					style="position: relative; top: 7.14em; right: 31em;">
					<div class="label">Q&A</div>
				</div>
				<div class="tab"
					style="position: relative; top: 3.56em; right: 22.3em;">
					<div class="label">신고하기</div>
				</div>
				<div class="tab" style="position: relative; right: 13.6em;">
					<div class="label">댕댕이 자랑</div>
				</div>
			</div>
		</div>
		<div
			style="text-align: center; width: 100em; height: 50em; border: solid;">
		</div>
	</div>




	<!--페이징 영역 -->
	<div align="center"
		style="text-align: center; margin-top: 3em; margin: 0 auto; width: 37em">
		<ul class="paging">
			<li class="paging_item"><a class="paging_item1" href="#">&lt;&lt;</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">&lt;</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">1</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">2</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">3</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">4</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">5</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">6</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">7</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">8</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">9</a></li>
			<li class="paging_item"><a class="paging_item1" href="#">10</a></li>
			<li class="paging_item"><a href="#">&gt;</a></li>
			<li class="paging_item"><a href="#">&gt;&gt;</a></li>
		</ul>
	</div>
</div>

<style>
.tabs {
	
}

.tab {
	border: soild black;
	height: 0;
	width: 120px;
	border-bottom: 50px solid #CCCCCC;
	border-right: 20px solid transparent;
	border-top-left-radius: 5px;
	box-sizing: border-box;
	display: block;
}

.tab:not (:first-child ) {
	margin-left: -10px;
	z-index: 0;
}

.tab .label {
	padding: 15px;
	text-align: center;
	color: #444444;
}

.active_tab {
	border-bottom: 50px solid #444444;
	z-index: 10;
}

.active_tab .label {
	color: #ffffff;
}

/*테이블 css*/
table {
	border-collapse: collapse;
	width: 100%;
	border-style: solid;
	border: 1px solid #444444;
	line-height: 1.5;
	border-bottom: 3px solid #036;
	padding-left: 1em;
	padding-right: 1em;
	padding-bottom: 1em;
	background-color: #436AB3;
	border-bottom: 1px solid;
	border-radius: 18px;
	-moz-border-radius: 18px;
	border-spacing: 0px;
	border-collapse: separate;
	-webkit-border-radius: 15px;
	background-color: #436AB3
}

th {
	text-align: center;
	background-color: #436AB3;
	color: #ffffff;
	padding-top: 1.5em;
	padding-bottom: 1em;
}

.al_col {
	background-color: white;
}

.t_col {
	border-bottom: 1px solid;
	text-align: center;
	background-color: #ffffff;
}

.tt_col {
	background-color: #EDEDEE;
	bord
}

.title {
	padding-bottom: 2em;
	padding-top: 2em;
	padding-left: 1em;
	padding-right: 1em;
}

/*페이징 css*/
.paging {
	width: 50em;
	height: 2em;
	float: left;
	text-align: center;
	list-style: none;
	display: inline;
	text-align: center;
}

.paging_item, .paging_item1 {
	float: left;
	margin-right: 3px;
	font: bold 12px tahoma;
	text-align: center;
	text-decoration: none;
	font-size: 1.2em;
	border: 1px solid #f7f7f7;
	height: 35px;
	width: 35px;
}

.paging_iemt1 a:hover, .paging_iemt1 a:active, .paging_iemt1 a:focus {
	border: 1px solid #4c8500;
}
</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</body>
</html>