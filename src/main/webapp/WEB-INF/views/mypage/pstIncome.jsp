<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypst-menu.jspf"%>

<!-- 수입 현황 -->
<div style="height: 1000px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em;">
		<span style="font-weight: bold; font-size: 2em;">수입 현황</span>
	</div>

	<div align="center" style="margin-top: 1em;">
		<div style="position: relative; left: 20em">

			<span style="font-weight: bold; margin-right: 1em;">진행 상태: </span> <select
				name="job" style="width: 8em">
				<option value="">선택</option>
				<option value="예약 요청">최신순</option>
				<option value="예약 승인"></option>
				<option value="결제 완료"></option>
				<option value="이용 완료"></option>
			</select>
		</div>
	</div>

	<!-- 수입 리스트 -->
	<div align="center" style="margin-top: 1em; margin-bottom: 2em">
		<table
			style="width: 65em; height: 40em; text-align: center; border-style: solid;">
			<tr class="title">
				<th scope="row" style="width: 3em; height: 3em">번호</th>
				<th style="width: 5em">신청자</th>
				<th style="width: 7em">위탁 수</th>
				<th style="width: 20em">이용 기간</th>
				<th style="width: 5.5em">이용 금액</th>
				<th style="width: 7em">입금 상태</th>
			</tr>

			<tr class="t_col">
				<td>1</td>
				<td>오*호</td>
				<td>2</td>
				<td>2020/01/20 10:00 ~ 2020/01/23 16:00</td>
				<td>크리스티나</td>
				<td>입금 완료</td>
			</tr>

			<tr class="tt_col">
				<td>2</td>
				<td>오*호</td>
				<td>2</td>
				<td>2020/01/20 10:00 ~ 2020/01/23 16:00</td>
				<td>크리스티나</td>
				<td>입금 대기</td>
			</tr>

			<tr class="t_col">
				<td>3</td>
				<td>오*호</td>
				<td>2</td>
				<td>2020/01/20 10:00 ~ 2020/01/23 16:00</td>
				<td>크리스티나</td>
				<td>예약 완료</td>
			</tr>

			<tr class="t_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="t_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="tt_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="t_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="tt_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="t_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>

			<tr class="tt_col">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
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

</html>