<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
 String id=request.getParameter("pst_id");

%>
 

<script type="text/javascript">

	 
	$(document).ready(function(){
		
		$("#cancel").on("click", function(e){
			e.preventDefault();
			fn_goHome();
		});
		
		$("#join").on("click", function(e){
			e.preventDefault();
			fn_joinSubmit();
		});
	});
	
	function fn_goHome(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/MyInfodetail' />");
		comSubmit.submit();
	}
	
	function fn_joinSubmit(){
		
		var comSubmit = new ComSubmit("joinForm");

		
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
		
		if(!$("#PHONE").val()){
			alert("연락처를 입력해주세요.");
			$("#PHONE").focus();
			return false;
		}

		if(!$("#BIRTHDAY").val()){
			alert("생일을 입력해주세요.");
			$("#BIRTHDAY").focus();
			return false;
		}
		if(!$("#ZIPCODE").val()){
			alert("우편번호를 입력해주세요.");
			$("#ZIPCODE").focus();
			return false;
		}
		if(!$("#ADDRESS1").val()){
			alert("주소를 입력해주세요.");
			$("#ADDRESS1").focus();
			return false;
		}

	
		joinForm.submit();
		}
		
		
		
		

	
	
	

	</script>



<div style="height: auto; text-align: center">

	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">펫시터 회원정보 수정</span>
	</div>
	<div style="width: 80%; text-align: right;; margin-top: 3em">
		<span style="">* 표시는 필수 입력 사항입니다.</span>
	</div>

	<div style="margin-top:2em">
		<form action="memInfoModify" id="joinForm" name="joinForm" enctype="multipart/form-data"
		method="post">
		
		<!-- 아이디 -->
		
			<div style="position: relative; right: 21em; margin-top: 3em;">
				<span style="font-weight: bold;">아이디*</span>
				<span style="position: relative; margin-left: 5em;">${map.PSMEM_ID}</span>
			</div>
	
		

		<!-- 패스워드 -->
		
			<div style="position: relative; right: 15em; margin-top:2em;">
				<span style="font-weight: bold">비밀번호*</span>
				<input type="password" name="PASSWORD1" id="PASSWORD1"
					style="width: 15em; position: relative; margin-left: 5em;">
			</div>
			
			<div style="position: relative; right: 16em; margin-top:1em" >
				<span style="font-weight: bold">비밀번호 확인*</span>
				<input type="password" name="PASSWORD2" id="PASSWORD2"
						style="width: 15em; position: relative; margin-left: 5em; margin-top:1em">
			</div>		
			<div style="position: relative; right: 16em; margin-top:1em" >
				<span id="empty">&nbsp;</span> <span id="alert-success"
					style="display: none; color: blue; position: relative; left:4em">비밀번호가
					일치합니다.</span> <span id="alert-danger"
					style="display: none; color: #d92742; font-weight: bold; position: relative; left:2em">비밀번호가
					일치하지 않습니다.</span>
					
			</div>

				<!-- 이름 -->
				
					<div style="position: relative; right: 21em; margin-top:1em">
						<span style="font-weight: bold">이름*</span>
						<span style="position: relative; margin-left: 5em;">${map.NAME}</span>
					</div>
			

				<!-- 연락처 -->
				
					<div style="position: relative; right: 12em ;margin-top:2em">
						<span style="font-weight: bold">연락처*</span>
						
						<input type="text" name="PHONE" id="PHONE" value="${map.PHONE}"
							style="width: 20em; position: relative; margin-left: 5em;">
					</div>
			
		
				<!-- 이메일 -->
				
					<div style="position: relative; right: 12em ;margin-top:2em">
						<span style="font-weight: bold">이메일</span>
						<input type="text" name="EMAIL" id="EMAIL" value="${map.EMAIL}"
							style="width: 20em; position: relative; margin-left: 5em;">
					</div>
			
				<!-- 성별 -->
				
					<div style="position: relative; right: 21em; margin-top:2em">
						<span style="font-weight: bold">성별*</span>
						<span style="position: relative; margin-left: 5em;">${map.SEX}</span>
					</div>
			


				<!-- 생년월일 -->
				
					<div style="position: relative; right: 12em; margin-top:2em">
						<span style="font-weight: bold">생년월일*</span>
									
						<input type="text" placeholder="2020/01/01" name="BIRTHDAY"
							id="BIRTHDAY" value="${map.BIRTHDAY}"
							style="width: 20em; position: relative; margin-left: 5em;">
					</div>
			

				<!-- 주소 -->
				
					<div style="position: relative; right: 24.4em; margin-top:2em">
						<span style="font-weight: bold">주소</span>
					</div>
					<div
						style="text-align: center; position: relative; right: 8em; bottom: 1em">
						<button type="button" style="width: 8em; height: 32px;"
							onclick="openZipSearch()">우편번호 검색</button>
						<input type="text" name="ZIPCODE" id="ZIPCODE" value="${map.ZIPCODE}"
							style="width: 9em; height: 26px; left: 1em;" 우편번호"/> <br> <input
							type="text" name="ADDRESS1" id="ADDRESS1" value="${map.ADDRESS1}"
							style="position: relative; left: 80px; margin-top: 0.5em; width: 200px; height: 30px;" />
						<input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD" value="${map.ADDRESS_ADD}"
							style="position: relative; left: 7em; margin-top: 0.5em; width: 200px; height: 30px;" /><br>
						<input type="text" name="ADDRESS2" id="ADDRESS2" value="${map.ADDRESS2}"
							style="position: relative; left: 30px; margin-top: 0.5em; width: 300px; height: 30px;" />
					</div>
					
			
			<!-- 직업 -->
	
				<div style="position: relative; right: 17em; margin-top: 2em;" >
					<span style="font-weight: bold">직업*</span>
					<!-- <div style="text-align: center; position: relative; margin-left:5em"> -->
						<select style="width: 8em; margin-left:5em" id="PSMEM_JOB" name="PSMEM_JOB">
						<option value="null">직업선택</option>
						<option value="학생">학생</option>
						<option value="직장인">회사원</option>
						<option value="주부">주부</option>
						<option value="기타">기타</option>	
						</select>
				</div>	
				
			<!-- 자격증 보유여부 -->
			<div style="text-align: center; position: relative; right: 26em; margin-top: 2em;">
				<span style="font-weight: bold;">자격증 보유 여부*</span>
			
			 <div style="text-align: center; position: relative; left:15em; bottom:2em; ">
				<label><input type="radio" id="PSMEM_CERTI_CHECK"
					name="PSMEM_CERTI_CHECK" value="Y" checked>예</label>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
				<input	type="radio" value="N" id="PSMEM_CERTI_CHECK"
				name="PSMEM_CERTI_CHECK">아니오</label>
			</div>
				
			<div style="text-align: center; margin-top: 1em; position: relative; left: 18em">
			<span style="font-weight: bold;">자격증 정보</span>
	
		<!-- 자격증 파일 추가 -->
		<!-- <div id="fileDiv" style="text-align: center">   -->
		
			
				<input type="text" placeholder="자격 명칭" style="width: 10em; margin-left:5em;" id="CERTI_NAME" name="CERTI_NAME" value="${map2.CERTI_NAME}"></input>
				<input type="text" placeholder="발급기관" style="width:10em; margin-left:1em" id="CERTI_ORG" name="CERTI_ORG" value="${map2.CERTI_ORG}"></input>
				<input type="text" placeholder="취득일자" style="width:10em; margin-lefg:1em" id="CERTI_DATE" name="CERTI_DATE" value="${map2.CERTI_DATE}"></input><br>
				<input type="file" id="file" name="file_0" style="position: relative; left: 60em; margin-top:1em;">
 		
		</div>
		
		
		<!-- 관련학과 졸업 여부-->
		<div style="text-align: center; margin-top: 3em; margin-left:45em;">
       		<div style="position: relative; right: 24.2em; margin-top: 0.5em;" >
				<span style="font-weight: bold;">관련학과 졸업 여부</span>
			</div>
			<div style="text-align: center; position: relative; right: 9em; bottom: 1em;">
			<label><input type="radio" id="PSMEM_SCHOOL_FINISH_CHECK"
				name="PSMEM_SCHOOL_FINISH_CHECK" value="Y" checked>예</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
			<input type="radio" value="N" id="PSMEM_SCHOOL_FINISH_CHECK"
				name="PSMEM_SCHOOL_FINISH_CHECK">아니오</label>
			</div>
		</div>
				
			
		<!-- 활동경력 -->
		<div style="text-align: center; position: relative; left: 20em; margin-top: 2em;">
			<span style="font-weight: bold; position: relative; bottom:2em;">활동 경력*</span>
			<textarea style="width: 500px; height: 5em; resize: none; margin-left:7em;"
			id="PSMEM_CAREER" name="PSMEM_CAREER">${map1.PSMEM_CAREER}</textarea>
		</div>	
		
		
			<!-- 자기소개-->
		<div style="text-align: center; margin-top: 2em; margin-left:46em">
       		<div style="position: relative; right: 24.2em;top:2em" >
				<span style="font-weight: bold;">자기소개</span>
			</div>
			<textarea style="width: 500px; height: 5em; resize: none; margin-left:7em;"
			id="PSMEM_INTRODUCE" name="PSMEM_INTRODUCE">${map1.PSMEM_INTRODUCE}</textarea>
			
			
			
		</div>
       
			
			
			
			
			

				<!-- 프로필 사진 등록 -->
				<div align="center">
					<div
						style="text-align: center; position: relative; left: 55em; bottom: 83em; width: 15em">
						<span>프로필 사진 등록</span>
						<div align="center">
								<div class="imgs_wrap" style="text-align: center;">
									<img id="img" src ="/first/resources/downimage/${path}" />
								</div>
							</div>
							<a href="javascript:" onclick="fileUploadAction();"
									class="my_button">파일 수정</a> <input type="file" id="input_imgs" name="file"
									multiple />
						</div>
						<input type="hidden" id="PROFILE_NO" name="PROFILE_NO" value="${map2.PROFILE_NO}">	
					</div>
				</div>
				
				
				
				


				<!--   <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->

				<div align="center">
					<div
						style="position: relative; right: 8em; bottom: 18em; margin-top: 1em; width: 15em">
						<button style="width: 13em; height: 3em" id="cancel">돌아가기</button>
					</div>
					<div
						style="position: relative; left: 13em; bottom: 22em; margin-top: 1em; width: 15em">
						<button style="width: 13em; height: 3em" id="join">저장</button>
					</div>
				</div>
	</form>
</div>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>


</div>

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
$(document).ready(function(){ }); 
</script>



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
	$('#PASSWORD2').keyup(function() {
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

<!-- 이미지 업로드 관련 스크립트 -->
<script type="text/javascript" src="./js/jquery-3.1.0.min.js"
	charset="utf-8"></script>
<script type="text/javascript">
	// 이미지 정보들을 담을 배열
var sel_files = [];

	$(document).ready(function() {
		$("#input_imgs").on("change", handleImgFileSelect);
	});

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function handleImgFileSelect(e) {

		// 이미지 정보들을 초기화
		sel_files = [];
		$(".imgs_wrap").empty();

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		var index = 0;
		filesArr
				.forEach(function(f) {
					if (!f.type.match("image.*")) {
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}

					sel_files.push(f);

					var reader = new FileReader();
					reader.onload = function(e) {
						var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("
								+ index
								+ ")\" id=\"img_id_"
								+ index
								+ "\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
						$(".imgs_wrap").append(html);
						index++;

					}
					reader.readAsDataURL(f);

				});
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>