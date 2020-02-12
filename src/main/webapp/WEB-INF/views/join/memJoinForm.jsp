<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>

<script type="text/javascript">
	function fn_idCheck(){
    	var ID = {ID : $('#MEM_ID').val()};    // {ID="입력한 ID값"}
  
    	$.ajax({
        	url:"<c:url value='/join/idCheck'/>",
        	type:'get',
        	data: ID,
        	success:function(data){   
           
            	if($.trim(data)==""){
               		$('#chkMsg').html("사용가능한 아이디 입니다.").css("color", "blue");         
            	}else{
               		$('#chkMsg').html("사용불가능한 아이디 입니다.").css("color", "red");
            	}
        	},
        	error:function(){
            	alert("조회할 아이디를 입력해주세요.");
        	}
    	});
	};
	
	 
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
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}
	
	function fn_joinSubmit(){
		
		var comSubmit = new ComSubmit("joinForm");
		//값이 넘어가는지 확인하는 alert
 		/* alert("MEM_ID" + $('#MEM_ID').val());
		alert("PASSWORD1" + $('#PASSWORD1').val());
		alert("PASSWORD2" + $('#PASSWORD2').val());
		alert("NAME" + $('#NAME').val());
		alert("PHONE" + $('#PHONE').val());
		alert("EMAIL" + $('#EMAIL').val());
		alert("SEX" + $('#SEX').val());
		alert("BIRTHDAY" + $('#BIRTHDAY').val());
		alert("ZIPCODE" + $('#ZIPCODE').val());
		alert("ADDRESS1" + $('#ADDRESS1').val());
		alert("ADDRESS2" + $('#ADDRESS2').val());
		alert("ADDRESS_ADD" + $('#ADDRESS_ADD').val());
		alert("JOIN_DATE" + $('#SYSDATE').val()); */
		
		if(!$("#MEM_ID").val()){
			alert("아이디를 입력해주세요.");
			$("#MEM_ID").focus();
			return false;
		}
		if($("#chkMsg").html()!="사용가능한 아이디 입니다."){
			alert("아이디 중복확인을 해주세요.");
			return false;
		}
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
		if(!$("#NAME").val()){
			alert("이름을 입력해주세요.");
			$("#NAME").focus();
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

	
		if ($("#PASSWORD1").val() != $("#PASSWORD2").val()) {
			
			alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
			$("#PASSWORD2").focus();
			return false;
		}
		

		
		
	/* 	var id = $("#MEM_ID").val()
		comSubmit.addParam("ID", id); */
		comSubmit.setUrl("<c:url value='/join' />");
		comSubmit.submit();
	}
	
	$("#joinForm").on("submit",function(e){
	});
	
 
	
	
	
	
	

	</script>


<!-- 회원가입 입력 시작 -->
<div style="height: 900px; text-align: center">

	<div style="text-align: center; margin-top: 4em; filter: drop-shadow(0 0 15px rgba(0, 0, 0, 0.7));  ">
		<span style="font-size: 2em; font-weight: bold; color:black" >일반 회원 가입</span>
	</div>
	<div style="width: 80%; text-align: right;; margin-top: 1em">
		<span style="color:black">* 표시는 필수 입력 사항입니다.</span>
	</div>

  <form action="join" id="joinForm" enctype="multipart/form-data" method="post">
	<!-- 아이디 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em; margin-top: 2em;">
			<span style="font-weight: bold;">아이디*</span>
		</div>
		<div>
			<input type="text" id="MEM_ID" name="MEM_ID"
				style="width: 10em; position: relative; right: 13em; bottom: 1.8em;">
		</div>
		<div>
			<input type="button" value="아이디중복확인" onclick="fn_idCheck();" class="mini_btn"
				style="width: 8em; height: 32px; position: relative; left:2em; bottom: 4.2em; margin-left: 2em; ">
				<span id = "chkMsg" style= "position: relative; left:3em; bottom:4em"></span>
		</div>
		
	</div>
	<!-- 아이디 -->

	<!-- 패스워드 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25.5em; bottom: 1.5em">
			<span style="font-weight: 900">비밀번호*</span>
		</div>
		<div>
			<input type="password" name="PASSWORD1" id="PASSWORD1"
				style="width: 15em; position: relative; right: 10.3em; bottom: 3.5em;">
		</div>
		<div style="text-align: center;">
			<div style="position: relative; right: 26.5em; bottom: 1.3em; heihgt:1em;">
				<span style="font-weight: bold">비밀번호 확인*</span>
			</div>
			<div style="">
				<input type="password" name="PASSWORD2" id="PASSWORD2"
					style="width: 15em; position: relative; right: 10.3em; bottom: 2.9em;">
			</div>
			<font id="empty" style="width:10em; height:0.5em; position: relative; bottom: 1.7em; right:13em ">&nbsp;</font>
			<!-- 패스워드 -->
			</div>
			</div>
			
			<!-- 이름 -->
			<div style="text-align: center;">
				<div style="position: relative; right: 24.2em; bottom: 0.7em">
					<span style="font-weight: bold">이름*</span>
				</div>

				<div>
					<input type="text" name="NAME" id="NAME"
						style="width: 10em; position: relative; right: 13em; bottom: 2.3em;">
				</div>
			</div>
			
			<!-- 연락처 -->
			<div style="text-align: center;">
				<div style="position: relative; right: 25em;">
					<span style="font-weight: bold">연락처*</span>
				</div>
				<div>
					<input type="text" name="PHONE" id="PHONE"
						style="width: 20em; position: relative; right: 8em; bottom: 2em;">
				</div>
			</div>
			<!-- 연락처 -->
			<!-- 이메일 -->
				<div style="text-align: center;">
					<div style="position: relative; right: 25em;">
						<span style="font-weight: bold">이메일</span>
					</div>
					<div>
						<input type="text" name="EMAIL" id="EMAIL"
							style="width: 20em; position: relative; right: 8em; bottom: 2em;">
					</div>
				</div>	
					<!-- 성별 -->
					 <div style="text-align: center;">
						<div style="position: relative; right: 24.2em;">
							<span style="font-weight: bold">성별*</span>
						</div>
						<div style="position: relative; right: 13.7em; bottom: 1.5em;">
							<label><input type="radio" name="SEX" value="남" checked>남자</label>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input type="radio" name="SEX" value="여">여자</label>
						</div>
					</div> 
	

					<!-- 생년월일 --> 
					<div style="text-align: center;">
						<div style="position: relative; right: 25.5em;">
							<span style="font-weight: bold">생년월일*</span>
						</div>
						<div>
							<input type="text" placeholder="생년월일을 선택해주세요." type="text" name="BIRTHDAY" id="BIRTHDAY" class="flatpickr-input"
								style="width: 20em; position: relative; right: 8em; bottom: 2em;">
						</div>
					</div>

					<!-- 주소 -->
               <div style="text-align: center;">
                  <div style="position: relative; right: 24.4em; top: 0.5em">
                     <span style="font-weight: bold">주소</span>
                  </div>
                  <div style="text-align: center; position: relative; right:9em; bottom: 2em">
                     <button type="button" style="width: 8em; height: 32px;" class="mini_btn"
                        onclick="openZipSearch()">우편번호 검색</button>
                     <input type="text" name="ZIPCODE" id="ZIPCODE" style="width: 9em; height: 26px; left:1em; placeholder="우편번호"/>
                      <br><input type="text" name="ADDRESS1" id="ADDRESS1"  placeholder="주소"
                        style="position: relative; left: 80px; margin-top: 0.5em; width: 200px; height: 30px;"
                         />
                        <input type="text" name="ADDRESS_ADD" id="ADDRESS_ADD"
                        style="position: relative; left: 7em; margin-top: 0.5em; width: 200px; height: 30px;" /><br>
                        <input type="text" name="ADDRESS2" id="ADDRESS2"  placeholder="상세주소"
                        style="position: relative; left: 30px; margin-top: 0.5em; width: 300px; height: 30px;" />
                  </div>
               </div>

					<!-- 프로필 사진 등록 -->
					<div align="center">
						<div
							style="text-align: center; position: relative; left: 20em; bottom: 40em; width: 15em">
							<span>프로필 사진 등록</span>
							<div align="center">
								<div class="imgs_wrap" style="text-align: center;">
									<img id="img" />
								</div>
							</div>
							<a href="javascript:" onclick="fileUploadAction();"
									class="my_button" style="color:white; width: 200px;">이미지 업로드</a> <input type="file" id="input_imgs" name="file"
									multiple />
						</div>
					</div>
			

					<!--   <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->

					<div align="center">
						<div
							style="position: relative; right: 8em; bottom: 18em; margin-top: 1em; width: 15em">
							<button style="width: 13em; height: 3em"
								id="cancel" class="btn_style">처음으로</button>
						</div>
						<div
							style="position: relative; left: 13em; bottom: 22em; margin-top: 1em; width: 15em">
							<button style="width: 13em; height: 3em" id="join" class="btn_style">
								가입완료</button>
						</div>
					</div>
					</form>
					
					<%@ include file="/WEB-INF/views/include/include-body.jspf" %>

					
				</div>
	

	


<script type="text/javascript">
$(document).ready(function(){ }); 
</script>




<style type="text/css">


.btn_style{

	 background: #5483EC;
    color: #fff;
    font-weight:bold;
    border-radius: 20px;
    transition: 0.4s;
    border: none;

}

.btn_style:hover{
	cursor: pointer;
    background: #0B2564;
}


span{

color:#5483EC;
}


input[type=file] {
	display: none;
}

.my_button {
	display: inline-block;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.mini_btn{
	font-weight:bold;
	border: none;
	background-color: #79BFFF;
	color: white;
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


	
	
	
	$(function(){
	    $('#PASSWORD1').keyup(function(){
	      $('#alert-success').html('');
	    });

	    $('#PASSWORD2').keyup(function(){

	        if($('#PASSWORD1').val() != $('#PASSWORD2').val()){
	          $('#empty').html('비밀번호 일치하지 않음<br><br>');
	          $('#empty').attr('color', '#f82a2aa3');
	        } else{
	          $('#empty').html('비밀번호 일치함<br><br>');
	          $('#empty').attr('color', '#199894b3');
	        }

	    });
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

<!-- flatpickr jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->  
<script id="INLINE_PEN_JS_ID">
	$("#BIRTHDAY").flatpickr({
		mode: "single",
		dateFormat: "Y/m/d",
		maxDate: "today"
	});
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>