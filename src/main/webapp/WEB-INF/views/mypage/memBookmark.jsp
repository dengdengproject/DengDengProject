<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mymem-menu.jspf"%>




		<!-- My page Bar -->
			<div class="menu-center collapse navbar-collapse"
				style="margin-left: 3em;">
				<ul class="ttr_menu_items nav navbar-nav ">
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 8em; height: 3em;"><a
						href="nml_my_page.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>회원 정보</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="nml_my_pet.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>마이 펫</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="nml_matching_list.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>매칭 내역</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="nml_petsitter_evaluation.html"
						class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>이용 후기</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 7em; height: 3em;"><a
						href="nml_bookMark.html" class="ttr_menu_items_parent_link_active"
						style="position: relative; right: 0.7em; text-align: center; width: 5em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>찜</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>



<!-- 찜 -->
<div style="height: 1000px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em;">
		<span style="font-weight: bold; font-size: 2em;">내가 찜한 펫시터</span>
	</div>

	<div align="center" style="position: relative; left: 23em; top: 1em">
		<span style="font-weight: bold; margin-right: 1em;">정렬 방식: </span> <select
			name="job" style="width: 8em">
			<option value="후기순">후기순</option>
			<option value="별점순">별점순</option>
		</select>
	</div>

	<!-- 후기 div -->
	<div align="center" style="margin-top: 2em">
		<div
			style="text-align: center; border: solid; width: 60em; height: 14em">

			<!-- 이미지 -->
			<div
				style="text-align: center; width: 20em; height: em; position: relative; left: 1em; top: 1em">
				<img src="images/none_img.png" style="border: solid; width: 20em">

			</div>

			<!-- 위치, 정보 -->
			<div style="position: relative; bottom: 10em">
				<span style="">서울 강남구 논현동</span> <span
					style="font-weight: 1000; margin-left: 1em;">프로펫시터</span>
			</div>

			<!-- 제목 -->
			<div>
				<span
					style="font-weight: 1000; font-size: 1.5em; position: relative; bottom: 6em; left: 1em;">우리
					아이는 내가 돌볼게요!</span>
			</div>

			<!-- 선 -->
			<hr width="500em" style="position: relative; left: 22em; bottom: 8em">

			<!-- 상세 정보 -->
			<div>
				<span style="position: relative; bottom: 7em; left: 5em">빌라,
					산책로 있어요, 자녀 없어요, 현재 반려동물 없어요.</span>
			</div>

			<!-- 별점, 후기 -->
			<div style="position: relative; bottom: 5em; right: 2em">
				<span style="margin-right: 1em">★★★★★</span> <span>후기 </span> <span
					style="font-weight: 900">25</span>
				<!-- 코딩부분 -->
				<span>개</span>
			</div>

			<!-- 이용요금 -->
			<div style="position: relative; left: 24.5em; bottom: 9.5em">
				<div>
					<span style="font-weight: 900; margin-right: 0.5em;">45,000원</span>
					<span>1박</span>
				</div>
				<div>
					<span
						style="font-weight: 900; margin-left: 0.5em; margin-right: 0.5em;">30,000원</span>
					<span>하루</span>
				</div>
			</div>
		</div>
	</div>

	<!-- 후기 div -->
	<div align="center" style="margin-top: 2em">
		<div
			style="text-align: center; border: solid; width: 60em; height: 14em">

			<!-- 이미지 -->
			<div
				style="text-align: center; width: 20em; height: em; position: relative; left: 1em; top: 1em">
				<img src="images/none_img.png" style="border: solid; width: 20em">

			</div>

			<!-- 위치, 정보 -->
			<div style="position: relative; bottom: 10em">
				<span style="">서울 강남구 논현동</span> <span
					style="font-weight: 1000; margin-left: 1em;">프로펫시터</span>
			</div>

			<!-- 제목 -->
			<div>
				<span
					style="font-weight: 1000; font-size: 1.5em; position: relative; bottom: 6em; left: 1em;">우리
					아이는 내가 돌볼게요!</span>
			</div>

			<!-- 선 -->
			<hr width="500em" style="position: relative; left: 22em; bottom: 8em">

			<!-- 상세 정보 -->
			<div>
				<span style="position: relative; bottom: 7em; left: 5em">빌라,
					산책로 있어요, 자녀 없어요, 현재 반려동물 없어요.</span>
			</div>

			<!-- 별점, 후기 -->
			<div style="position: relative; bottom: 5em; right: 2em">
				<span style="margin-right: 1em">★★★★★</span> <span>후기 </span> <span
					style="font-weight: 900">25</span>
				<!-- 코딩부분 -->
				<span>개</span>
			</div>

			<!-- 이용요금 -->
			<div style="position: relative; left: 24.5em; bottom: 9.5em">
				<div>
					<span style="font-weight: 900; margin-right: 0.5em;">45,000원</span>
					<span>1박</span>
				</div>
				<div>
					<span
						style="font-weight: 900; margin-left: 0.5em; margin-right: 0.5em;">30,000원</span>
					<span>하루</span>
				</div>
			</div>
		</div>
	</div>

	<!-- 후기 div -->
	<div align="center" style="margin-top: 2em; margin-bottom: 2em">
		<div
			style="text-align: center; border: solid; width: 60em; height: 14em">

			<!-- 이미지 -->
			<div
				style="text-align: center; width: 20em; height: em; position: relative; left: 1em; top: 1em">
				<img src="images/none_img.png" style="border: solid; width: 20em">

			</div>

			<!-- 위치, 정보 -->
			<div style="position: relative; bottom: 10em">
				<span style="">서울 강남구 논현동</span> <span
					style="font-weight: 1000; margin-left: 1em;">프로펫시터</span>
			</div>

			<!-- 제목 -->
			<div>
				<span
					style="font-weight: 1000; font-size: 1.5em; position: relative; bottom: 6em; left: 1em;">우리
					아이는 내가 돌볼게요!</span>
			</div>

			<!-- 선 -->
			<hr width="500em" style="position: relative; left: 22em; bottom: 8em">

			<!-- 상세 정보 -->
			<div>
				<span style="position: relative; bottom: 7em; left: 5em">빌라,
					산책로 있어요, 자녀 없어요, 현재 반려동물 없어요.</span>
			</div>

			<!-- 별점, 후기 -->
			<div style="position: relative; bottom: 5em; right: 2em">
				<span style="margin-right: 1em">★★★★★</span> <span>후기 </span> <span
					style="font-weight: 900">25</span>
				<!-- 코딩부분 -->
				<span>개</span>
			</div>

			<!-- 이용요금 -->
			<div style="position: relative; left: 24.5em; bottom: 9.5em">
				<div>
					<span style="font-weight: 900; margin-right: 0.5em;">45,000원</span>
					<span>1박</span>
				</div>
				<div>
					<span
						style="font-weight: 900; margin-left: 0.5em; margin-right: 0.5em;">30,000원</span>
					<span>하루</span>
				</div>
			</div>
		</div>
	</div>

	<!--페이징 영역 -->
	<div align="center"
		style="text-align: center; margin-top: 2em; margin: 0 auto; width: 37em">
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