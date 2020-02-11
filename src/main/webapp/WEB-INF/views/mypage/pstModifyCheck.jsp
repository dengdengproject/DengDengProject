<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypst-menu.jspf"%>


<!-- My page Bar -->
			<div class="menu-center collapse navbar-collapse"
				style="margin-left: 3em;">
				<ul class="ttr_menu_items nav navbar-nav ">
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 8em; height: 3em;"><a
						href="pst_my_page.html" class="ttr_menu_items_parent_link_active"
						style="position: relative; right: 2em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>회원 정보</a>
						<hr class="horiz_separator" /></li>

					<li class="ttr_menu_items_parent dropdown "
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="pst_my_pet.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>마이 펫</a>
						<hr class="horiz_separator" /></li>

					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="pst_matching_list.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>매칭 내역</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="pst_petsitter_evaluation.html"
						class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>후기 보기</a>
						<hr class="horiz_separator" /></li>
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 7em; height: 3em;"><a
						href="pst_income.html" class="ttr_menu_items_parent_link"
						style="position: relative; right: 0.7em; text-align: center; width: 5em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>수입 현황</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>



<!-- 본인확인 -->
<div style="height: 400px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em;">
		<span style="font-weight: bold; font-size: 2em;">회원 정보 수정</span>
	</div>

	<div style="text-align: center; margin-top: 2em;">
		<span style="">본인 확인을 위해 비밀번호를 입력해주세요.</span>
	</div>

	<div style="text-align: center; margin-top: 2em">
		<div>
			<span style="font-weight: bold; font-size: 1.2em"> 비밀번호 :</span> <input
				type="password" style="margin-left: 2em; width: 20em">
		</div>
	</div>

	<div
		style="text-align: center; margin-top: 1em; position: relative; left: 10.3em">
		<button style="width: 7em; height: 3em;">확 인</button>
	</div>
</div>
<!-- 본인확인 -->

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>