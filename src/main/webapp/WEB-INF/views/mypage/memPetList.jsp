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
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 7em; height: 3em;"><a
						href="nml_my_pet.html" class="ttr_menu_items_parent_link_active"
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
					<li class="ttr_menu_items_parent dropdown "
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="nml_bookMark.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 0.7em; text-align: center; width: 5em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>찜</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>




<!-- 댕댕이 목록 -->
<div style="height: 700px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em; margin-bottom: 1em">
		<span style="font-size: 2em; font-weight: bold;">나의 댕댕이</span>
	</div>

	<div style="text-align: center; margin-bottom: 1em;">
		<span style="position: relative; left: 20em">등록수 <span
			style="font-weight: 900">1</span>마리
		</span>
	</div>

	<div align="center">
		<div style="height: 13em; width: 50em; border-style: solid;"
			onclick="location.href = 'nml_my_pet_detail.html' ">

			<!-- 프로필 이미지 -->
			<div
				style="border-style: solid; border-radius: 10em; width: 10em; hight: 10em; position: relative; top: 1.5em; right: 17em">
				<img
					style="object-fit: cover; border-style: solid; border-radius: 10em; width: 100%; hight: 100%;"
					src="images/dog_photo.jpg">
			</div>

			<!-- 이름 -->
			<div style="position: relative; right: 5em; bottom: 8em">
				<span style="font-weight: 900; font-size: 1.1em">이름</span> <span
					style="margin-left: 2em;">구름이</span>

			</div>

			<!--  품종 -->
			<div style="position: relative; right: 4.5em; bottom: 6em">
				<span style="font-weight: 900; font-size: 1.1em">품종</span> <span
					style="margin-left: 2em;">사모예드</span>

			</div>

			<!--  생년월일 -->
			<div style="position: relative; right: 4.7em; bottom: 4em">
				<span style="font-weight: 900; font-size: 1.1em">생년월일</span> <span
					style="margin-left: 1.7em;">2018.05.05</span>

			</div>


			<!--  등록번호 -->
			<div style="position: relative; left: 13em; bottom: 12.5em">
				<span style="font-weight: 900; font-size: 1.1em">등록번호</span> <span
					style="margin-left: 2em;">1770013064</span>

			</div>

			<!--  성별 -->
			<div style="position: relative; left: 12.5em; bottom: 10.5em">
				<span style="font-weight: 900; font-size: 1.1em">성별</span> <span
					style="margin-left: 2.5em;">암컷</span>

			</div>

			<!-- 추가등록 버튼 -->
			<div>
				<button style="width: 8em; height: 2em; font-size: 1.3em"
					onclick="location.href = 'nml_my_pet_add.html' ">추가 등록</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>