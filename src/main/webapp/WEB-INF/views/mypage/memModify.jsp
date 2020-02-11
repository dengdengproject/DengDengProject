<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>

<script type="text/javascript">
		
	 
	function fn_submit(){
		
		if(!$("#PASSWORD1").val()){
			alert("비밀번호를 입력해주세요.");
			$("#PASSWORD1").focus();
			return false;
		}
		if(!$("#PASSWORD2").val()){
			alert("비밀번호 확인을 입력해주세요.");
			$("#PASSWORD2").focus();
			return false;
		}
		
		frm.submit();
/* 		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("modify");
		var email = $("#email1").val()+"@"+$("#email2").val();
		var phone = $("#phone1").val()+$("#phone2").val()+$("#phone3").val();
		$("#mem_email").val(email);
		$("#mem_phone").val(phone);
		comSubmit.submit();*/
		
	};

</script>



<!-- 회원정보 -->
<div style="height: auto; text-align: center margin-top: 0.5em;">

	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">회원 정보 수정</span>
	</div>
	<div style="width: 80%; text-align: right;; margin-top: 1em">
		<span style="">* 표시는 필수 입력 사항입니다.</span>
	</div>

	
 <form id="frm" name="frm" method="post" action="memInfoModify">
	<!-- 아이디 -->
	<div style="text-align: center; margin-top: 1em;">
		<div style="position: relative; right: 25em; margin-top: 2em;">
			<span style="font-weight: bold;">아이디*</span>
		</div>
		<div style ="position: relative; right: 10.3em; bottom:1.5em; ">
			<p>${map.MEM_ID}</p>
		</div>
	</div>


	<!-- 이름 -->
	<div style="text-align: center; margin-top: 1em;">
		<div style="position: relative; right: 24.5em; margin-top: 0.5em;" >
			<span style="font-weight: bold">이름*</span>
		</div>

		<div style ="position: relative; right: 10.3em; bottom:1.2em; ">	
				<p>${map.NAME}</p>
			
		</div>
	</div>
	
	<!-- 패스워드 -->
	<div style="text-align: center; margin-top: 3em;">
		<div style="position: relative; right: 25.5em; bottom: 1.5em">
			<span style="font-weight: bold">비밀번호*</span>
		</div>
		<div>
			<input type="password" name="PASSWORD1" id="PASSWORD1"
				style="width: 15em; position: relative; right: 10.3em; bottom: 3.5em;">
		</div>
		<div style="text-align: center;">
			<div style="position: relative; right: 26.5em; bottom: 1.3em">
				<span style="font-weight: bold">비밀번호 확인*</span>
			</div>
			<div>
				<input type="password" name="PASSWORD2" id="PASSWORD2"
					style="width: 15em; position: relative; right: 10.3em; bottom: 2.9em;">
			</div>
			<span id="empty">&nbsp;</span> <span id="alert-success"
				style="display: none; color: blue; position: relative; bottom: 2.2em; right: 12.5em">비밀번호가
				일치합니다.</span> <span id="alert-danger"
				style="display: none; color: #d92742; font-weight: bold; position: relative; bottom: 2.2em; right: 11em">비밀번호가
				일치하지 않습니다.</span>
		</div>
	</div>
	<!--  패스워드 -->
	
	
		<!-- 연락처 -->
		<div style="text-align: center; bottom:1em;">
			<div style="position: relative; right: 25em;" >
				<span style="font-weight: bold">연락처*</span>
			</div>
			
			<div>	
				<input type="text" name="PHONE" id="PHONE"
						style="width: 20em; position: relative; right: 8em; bottom: 2em;" value="${map.PHONE}">
			</div>
		</div>
		<!-- 연락처 -->
			
		<!-- 이메일 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 25em; margin-top: 0.5em;" >
					<span style="font-weight: bold">이메일</span>
				</div>
				<input type="text" name="EMAIL" id="EMAIL" value="${map.EMAIL}"
							style="width: 20em; position: relative; right: 8em; bottom: 2em;">
			</div>
		
		<!-- 성별 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 24.2em; margin-top: 0.5em;" >
					<span style="font-weight: bold">성별*</span>
				</div>
				<div style ="position: relative; right: 10.3em; bottom:1.5em; ">	
					<p>${map.SEX}</p>
				</div>
			</div>


			<!-- 생년월일 -->
			<div style="text-align: center; margin-top: 1em;">
				<div style="position: relative; right: 25.5em;  margin-top: 0.5em;" >
					<span style="font-weight: bold">생년월일*</span>
				</div>
				<input type="text" placeholder="2020/01/01" name="BIRTHDAY" id="BIRTHDAY" value="${map.BIRTHDAY}"
								style="width: 10em; position: relative; right: 13em; bottom: 2em;">
			</div>
		

			<!-- 주소 -->
					<div style="text-align: center; margin-top: 1em;">
						<div style="position: relative; right: 24.4em; ">
							<span style="font-weight: bold">주소</span>
						</div>
						<div style="text-align: center; position: relative; right:9em; bottom: 2em">
							<button type="button" style="width: 8em; height: 32px;"
								onclick="openZipSearch()">우편번호 검색</button>
							<input type="text" name="ZIPCODE" id="ZIPCODE" value="${map.ZIPCODE}" style="width: 9em; height: 26px; left:1em; placeholder="우편번호"/>
							 <br><input type="text" name="ADDRESS1" id="ADDRESS1"  value="${map.ADDRESS1}" placeholder="주소"
								style="position: relative; left: 80px; margin-top: 0.5em; width: 200px; height: 30px;"
								 />
								<input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD" value="${map.ADDRESS_ADD}"
								style="position: relative; left: 7em; margin-top: 0.5em; width: 200px; height: 30px;" /><br>
								<input type="text" name="ADDRESS2" id="ADDRESS2"  value="${map.ADDRESS2}" placeholder="상세주소"
								style="position: relative; left: 30px; margin-top: 0.5em; width: 300px; height: 30px;" />
						</div>
					</div>




		
			
			<div align="center" style= "position: relative; margin-top: 2em;">
					<div
						style="text-align: center; position: relative; right: 8em;  width: 14em">
						<button style="width: 13em; height: 3em" onclick="fn_submit();">확인</button>
					</div>

			</div>
			
	</form>
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
	margin-top: 30px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>


<script type="text/javascript">
	//우편번호 검색
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
			     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("ADDRESS_ADD").value = extraAddr;
                
                } else {
                    document.getElementById("ADDRESS_ADD").value = '';
                }
				
				 document.getElementById("ZIPCODE").value = data.zonecode;
				 document.getElementById("ADDRESS1").value = addr;
				 document.getElementById("ADDRESS2").focus();
			}
		}).open();
	}

	//비밀번호 확인 
	$('#PASSWORD1').keyup(function() {
		var pwd1 = $("#PASSWORD1").val();
		var pwd2 = $("#PASSWORD2").val();
		if (pwd1 != "" && pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#empty").css('display', 'none');
				$("#alert-success").css('display', 'inline-block');
				$("#alert-danger").css('display', 'none');
			} else {
				alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
				$("#empty").css('display', 'none');
				$("#alert-success").css('display', 'none');
				$("#alert-danger").css('display', 'inline-block');
			}
		}
	});
</script>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>