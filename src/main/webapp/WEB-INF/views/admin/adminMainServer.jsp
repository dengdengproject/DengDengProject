<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu-admin.jspf"%>

<%@ include file="/WEB-INF/views/include/include-admin-menu.jspf"%>


<!-- My page Bar -->
			<div class="menu-center collapse navbar-collapse"
				style="margin-left: 3em;">
				<ul class="ttr_menu_items nav navbar-nav ">
					<li class="ttr_menu_items_parent dropdown"
						style="border-style: outset; width: 8em; height: 3em;"><a
						href="/first/adminMain" class="ttr_menu_items_parent_link"
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
					<li class="ttr_menu_items_parent dropdown active"
						style="border-style: inset; width: 7em; height: 3em;"><a
						href="/first/adminServer" class="ttr_menu_items_parent_link"
						style="position: relative; right: 2.8em; text-align: center; width: 9em; line-height: 300%; border-radius: 10px;"><span
							class="menuchildicon"></span>서버 관리</a>
						<hr class="horiz_separator" /></li>
				</ul>
			</div>




<!-- 점검 내용 -->
<div style="height: 1000px; border-top: solid;">

	<!-- 제목 -->
	<div
		style="text-align: center; margin-top: 2em; position: relative; right: 28em">
		<span style="font-weight: bold; font-size: 1.5em;">서버 관리</span>
	</div>

	<div
		style="text-align: center; position: relative; top: 6em; right: 13em">
		<span style="font-weight: 900; font-size: 2.5em">잠깐!<br>정말
			서버를 조작하시겠습니까?
		</span>
	</div>

	<!-- 정상 모드 버튼 -->
	<div
		style="text-align: center; position: relative; top: 11em; right: 12em;">
		<button
			style="width: 11em; height: 2.3em; font-size: 2em; font-weight: bold;">홈페이지
			정상 모드</button>
	</div>

	<!-- 점검 모드 버튼 -->
	<div
		style="text-align: center; position: relative; top: 14em; right: 12em;">
		<button
			style="width: 11em; height: 2.3em; font-size: 2em; font-weight: bold;">홈페이지
			점검 모드</button>
	</div>

	<!-- 시계 -->
	<div align="center"
		style="position: relative; left: 80em; bottom: 10em; width: 24em; height: 36em;">
		<div style="border: solid; width: 23em; height: 35em;">
			<div
				style="background-color: #DDDDDD; width: 23; height: 8em; text-align: center;">
				<div
					style="position: relative; bottom: 0.3em; color: #666; font-size: 100px; text-align: center;"
					id="clock"></div>
			</div>
		</div>
	</div>
</div>

<!-- 시계 스크립트 -->
<script script type="text/javascript">
	function printClock() {
		var clock = document.getElementById("clock"); // 출력할 장소 선택
		var currentDate = new Date(); // 현재시간
		var calendar = currentDate.getFullYear() + "-"
				+ (currentDate.getMonth() + 1) + "-" + currentDate.getDate() // 현재 날짜
		var amPm = 'AM'; // 초기값 AM
		var currentHours = addZeros(currentDate.getHours(), 2);
		var currentMinute = addZeros(currentDate.getMinutes(), 2);
		var currentSeconds = addZeros(currentDate.getSeconds(), 2);

		if (currentHours >= 12) { // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
			amPm = 'PM';
			currentHours = addZeros(currentHours - 12, 2);
		}
		if (currentSeconds >= 50) {// 50초 이상일 때 색을 변환해 준다.
			currentSeconds = '<span style="color:#de1951;">' + currentSeconds
					+ '</span>'
		}

		clock.innerHTML = "<span style='font-size:55px; font-weight:bold;'>"
				+ currentHours + "</span>" + "<span style='font-size:55px;'>"
				+ ":" + "</span>"
				+ "<span style='font-size:55px; font-weight:bold;'>"
				+ currentMinute + "</span>" + "<span style='font-size:55px;'>"
				+ "  " + "</span>" + "<span style='font-size:30px;'>"
				+ currentSeconds + "</span>"
				+ " <span style='font-size:30px;'>" + amPm + "</span>"; //날짜를 출력해 줌
		setTimeout("printClock()", 1000); // 1초마다 printClock() 함수 호출
	}

	function addZeros(num, digit) { //자릿수 맞춰주기
		var zero = '';
		num = num.toString();
		if (num.length < digit) {
			for (i = 0; i < digit - num.length; i++) {
				zero += '0';
			}
		}
		return zero + num;
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>