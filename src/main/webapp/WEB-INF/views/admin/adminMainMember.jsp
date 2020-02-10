<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-admin-menu.jspf"%>
 
 <!-- My page Bar -->
			<div class="menu-center collapse navbar-collapse"
				style="margin-left: 3em;">
				<ul class="ttr_menu_items nav navbar-nav ">
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 8em; height: 3em;"><a
						href="/first/adminMain" class="ttr_menu_items_parent_link_active"
						style="position: relative; right: 2em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>회원 관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="/first/adminMatch" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>매칭관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="/first/adminBoard"
						class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>게시판 관리</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="/first/adminServer" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>서버 관리</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>

 
 
 
<!-- 회원 정보 -->
<div style="height: 850px; border-top: solid;">
	<div
		style="text-align: center; margin-top: 2em; position: relative; right: 28em">
		<span style="font-weight: bold; font-size: 1.5em;">회원 관리</span>
	</div>
	<div align="center" style="margin-top: 1em;">
		<div
			style="position: relative; left: 25em; border: solid; width: 14em; height: 2.4em; border-radius: 12px">
			<span style="margin-right: 0.7em; line-height: 200%">펫시터</span> <span
				style="margin-right: 0.7em;">일반회원</span> <span>블랙</span>
		</div>
	</div>

	<!-- 회원 리스트 -->
	<div align="center" style="margin-top: 1em; margin-bottom: 2em">
		<table
			style="width: 65em; height: 40em; text-align: center; border-style: solid;">
			<tr class="title">
				<th scope="row" style="width: 3em; height: 3em">번호</th>
				<th style="width: 4em">이름</th>
				<th style="width: 18em">주소</th>
				<th style="width: 7em">연락처</th>
				<th style="width: 5.5em">가입일</th>
				<th style="width: 6em">반려동물 수</th>
				<th style="width: 5em">이용 횟수</th>
				<th style="width: 3em">블랙</th>
				<th style="width: 4em">회원 구분</th>
			</tr>
			<tr class="t_col">
				<td>1</td>
				<td>오*호</td>
				<td>서울 영등포구 당산동</td>
				<td>010-0000-0000</td>
				<td>2020/01/28</td>
				<td>2</td>
				<td>4</td>
				<td>0</td>
				<td>일반</td>
			</tr>
			<tr class="tt_col">
				<td>2</td>
				<td>오*호</td>
				<td>서울 영등포구 당산동</td>
				<td>010-0000-0000</td>
				<td>2020/01/28</td>
				<td>2</td>
				<td>4</td>
				<td>0</td>
				<td>펫시터</td>
			</tr>
			<tr class="t_col">
				<td>3</td>
				<td>오*호</td>
				<td>서울 영등포구 당산동</td>
				<td>010-0000-0000</td>
				<td>2020/01/28</td>
				<td>2</td>
				<td>4</td>
				<td>0</td>
				<td>일반</td>
			</tr>
			<tr class="tt_col">
				<td>1</td>
				<td>오*호</td>
				<td>서울 영등포구 당산동</td>
				<td>010-0000-0000</td>
				<td>20202/01/28</td>
				<td>2</td>
				<td>4</td>
				<td>0</td>
				<td>일반</td>
			</tr>
			<tr class="t_col">
				<td></td>
				<td></td>
				<td></td>
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
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<div align="center"
			style="margin-top: 1em; position: relative; right: 20em">
			<div style="position: relative; left: 1em">
				<select name="job" style="width: 7em">
					<option value="이름">이름</option>
					<option value="주소">주소</option>
					<option value="연락처">연락처</option>
					<option value="이용 횟수">이용 횟수</option>
					<option value="회원 구분">회원 구분</option>
				</select> <input type="text" placeholder="Search.."
					style="width: 14em; margin-left: 1em;" />
				<button style="position: relative; top: 0.4em; right: 0.2em">
					<img src="images/search.png" style="width: 2em;">
				</button>
			</div>
		</div>
	</div>

	<!--페이징 영역 -->
	<div align="center"
		style="text-align: center; margin-top: em; margin: 0 auto; width: 37em; position: relative; left: 15em; bottom: 4.2em;">
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
	font-size: 1em;
	border: 1px solid #f7f7f7;
	height: 28px;
	width: 28px;
}

.paging_iemt1 a:hover, .paging_iemt1 a:active, .paging_iemt1 a:focus {
	border: 1px solid #4c8500;
}
</style>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>