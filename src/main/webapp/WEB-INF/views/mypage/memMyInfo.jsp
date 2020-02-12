<!-- 2020.02.11. PM6:10 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>


 
<!-- 회원정보 -->
<div style="height: auto; text-align: center margin-top: 0.5em;">

	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">회원 정보</span>
	</div>
	<div style="width: 80%; text-align: right;; margin-top: 1em">
		<span style="">* 표시는 필수 입력 사항입니다.</span>
	</div>


	<!-- 아이디 -->
	<div style="text-align: center; margin-top: 1em;">
		<div style="position: relative; right: 25em; margin-top: 2em;">
			<span style="font-weight: bold;">아이디*</span>
		</div>
		<div style ="position: relative; bottom:1.5em; ">
			<p>${map.MEM_ID}</p>
		</div>
	</div>


	<!-- 이름 -->
	<div style="text-align: center; margin-top: 1em;">
		<div style="position: relative; right: 24.5em; margin-top: 0.5em;" >
			<span style="font-weight: bold">이름*</span>
		</div>

		<div style ="position: relative; bottom:1.2em; ">	
				<p>${map.NAME}</p>
			
		</div>
	</div>
		<!-- 연락처 -->
		<div style="text-align: center; margin-top: 1em;">
			<div style="position: relative; right: 25em; margin-top: 0.5em;" >
				<span style="font-weight: bold">연락처*</span>
			</div>
			<div style ="position: relative; bottom:1.2em; ">	
				<p>${map.PHONE}</p>
			</div>
			</div>
		<!-- 연락처 -->
			
		<!-- 이메일 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 25em; margin-top: 0.5em;" >
					<span style="font-weight: bold">이메일</span>
				</div>
				<div style ="position: relative; bottom:1.5em; ">	
					<p>${map.EMAIL}</p>
				</div>
			</div>
		<!-- 성별 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 24.2em; margin-top: 0.5em;" >
					<span style="font-weight: bold">성별*</span>
				</div>
				<div style ="position: relative; bottom:1.5em; ">	
					<p>${map.SEX}</p>
				</div>
			</div>
 

			<!-- 생년월일 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 25.5em;  margin-top: 0.5em;" >
					<span style="font-weight: bold">생년월일*</span>
				</div>
				<div style ="position: relative; bottom:1.2em; ">	
					<p>${map.BIRTHDAY}</p>
				</div>
			</div>

			<!-- 주소 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 24.4em; margin-top: 0.5em;" >
					<span style="font-weight: bold">주소</span>
				</div>
				<div style ="position: relative; bottom:1.2em; ">	
				<p>${map.ZIPCODE}&nbsp;&nbsp; ${map.ADDRESS1} &nbsp;&nbsp;${map.ADDRESS_ADD}&nbsp;&nbsp;${map.ADDRESS2}</p>
				</div>

			
			<!-- 프로필 사진 등록 -->
				<div align="center">
					<div
						style="text-align: center; position: relative; left: 30em; bottom: 25em; width: 15em">
						<span>프로필 사진</span>
						<div align="center">
								<div class="imgs_wrap" style="text-align: center;">
									<img id="img" src ="/first/resources/downimage/${path}" />
								</div>
							</div>
							
						</div>
					</div>
				</div>
			



			</div>
			
			<div align="center" style= "position: relative; margin-top: 2em; margin-bottom: 5em;">
					<div
						style="text-align: center; position: relative;  width: auto">
						<button style="width: 9em; height: 3em; margin-right:1em" id="ok" onclick="location.href = 'main'">확인</button>
									
						<button style="width: 9em; height: 3em;  margin-right:1em" id="modify" onclick="location.href = 'memInfoModifyForm'">수정</button>
					
						<button style="width: 9em; height: 3em" id="modify" onclick="location.href = 'memDeleteComfirm'">탈퇴</button>
					</div>
				</div>
			
	</div>





<script type="text/javascript">
$(document).ready(function(){ }); 
</script>




<style type="text/css">
input[type=file] {
	display: none;
}

.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.imgs_wrap {
	width: 15em;
	height: 15em;
	border: 2px solid #A8A8A8;
	margin-top: 20px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>



<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>