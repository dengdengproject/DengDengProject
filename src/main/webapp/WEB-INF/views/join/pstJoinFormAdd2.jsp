<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%> 

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
	String id = request.getParameter("PSMEM_ID");
%>


<script type="text/javascript">
	$(document).ready(function() {
		
		

		$("#cancel").on("click", function(e) {
			e.preventDefault();
			fn_goHome();
		});

		$("#join").on("click", function(e) {
			e.preventDefault();
			fn_joinSubmit();
		});
		
		$("#addFile").on("click", function(e){ 
			//파일 추가 버튼 
			e.preventDefault();
			fn_addFile(); 
		});
		
		$("a[name='delete']").on("click", function(e){
			//삭제 버튼
			e.preventDefault(); 
			fn_deleteFile($(this)); 
		});

		
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}

	function fn_joinSubmit() {

		var comSubmit = new ComSubmit("joinForm");

			if (!$("#PSMEM_CONSIGNMENT_ZIPCODE").val()) {
			alert("우편번호를 입력해주세요.");
			$("#ZIPCODE").focus();
			return false;
		}

			if (!$("#PSMEM_CONSIGNMENT_ADDRESS1").val()) {
				alert("주소를 입력해주세요.");
				$("#ADDRESS1").focus();
				return false;
			}
			
			if (!$("#PSMEM_INTRODUCE").val()) {
				alert("자기소개를 작성해주세요.");
				$("#PHONE").focus();
				return false;
			}
		

		comSubmit.setUrl("<c:url value='/joinPstAdd' />");
		comSubmit.submit();
	}
	




	
	

	$("#joinForm").on("submit", function(e) {
	});
	
	var gfv_count = 1;
	
	function fn_addFile(){
        var str = "<p><input type='file' name='file_"+(gfv_count++)+"'style='position: relative; left: 56em;'><a href='#this' class='btn' name='delete'>삭제</a><p>";
           
        $("#fileDiv").append(str);
        $("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_deleteFile($(this));
           });
        }
        
        function fn_deleteFile(obj) {
           obj.parent().remove();
        }
       
</script>




<!--  위탁장소 등록-->
<div style="height: auto; margin-top:1em;">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">위탁장소 정보 입력</span>
	</div>

	<div
		style="text-align: center; position: relative; left: 20em; margin-top: 1em">
		<span>* 표시는 필수 입력 사항입니다.</span>
	</div>

<div style="margin-top:2em;">
	<form action="joinPstAdd" id="joinForm" enctype="multipart/form-data" method="post">

 	

	<div
		style="text-align: center; position: relative; right: 21em; bottom: 0.5em;">
		<span style="font-weight: bold;">위탁 장소*</span>
	</div>
	
	<div style="text-align: center;">

		<div
			style="text-align: center; position: relative; right: 5.3em; bottom: 1.3em">
			<button type="button" style="width: 8em; height: 32px;"
				onclick="openZipSearch()">우편번호 검색</button>
			<input type="text" name="PSMEM_CONSIGNMENT_ZIPCODE"
				id="PSMEM_CONSIGNMENT_ZIPCODE"
				style="width: 9em; height: 26px; left: 1em;" 우편번호"/> <br> <input
				type="text" name="PSMEM_CONSIGNMENT_ADDRESS1"
				id="PSMEM_CONSIGNMENT_ADDRESS1" placeholder="주소"
				style="position: relative; left: 80px; margin-top: 0.5em; width: 200px; height: 30px;" />
			<input type="text" name="PSMEM_CONSIGNMENT_ADDRESS_ADD"
				id="PSMEM_CONSIGNMENT_ADDRESS_ADD"
				style="position: relative; left: 7em; margin-top: 0.5em; width: 200px; height: 30px;" /><br>
			<input type="text" name="PSMEM_CONSIGNMENT_ADDRESS2"
				id="PSMEM_CONSIGNMENT_ADDRESS2" placeholder="상세주소"
				style="position: relative; left: 30px; margin-top: 0.5em; width: 300px; height: 30px;" />
		</div>
	
	
	<!-- 위탁장소 이미지 파일 추가 -->
	<div style="text-align: center; position: relative; right: 5.3em; margin-top:1em;">
		<span style="font-weight: bold; position: relative; right: 15em; ">위탁장소 이미지</span>
		<div id="fileDiv" style="position: relative; margin-left:5em; bottom:1em">  
			<input type="file" id="file" name="file_0" style="position: relative; left: 56em;" ><a href="#this" id="delete" name="delete">삭제</a> 
				
				
		</div>
			<p style="position:relative; bottom:1em;"><a href="#this" class="btn" id="addFile">파일 추가</a></p>
	
	</div>

	<div
		style="text-align: center; position: relative; right: 20.5em; top: 1em; margin-top: 1em">
		<span style="font-weight: bold;">자기 소개*</span>
	</div>
	<div
		style="text-align: center; position: relative; left: 4em; bottom: 0.5em;">

		<textarea style="width: 500px; height: 5em; resize: none;"
			id="PSMEM_INTRODUCE" name="PSMEM_INTRODUCE"></textarea>
	</div>
	
	


	<!-- 프로필 사진 등록 -->
				<!-- <div align="center">
					<div
						style="text-align: center; position: relative; left: 20em; bottom: 20em; width: 15em">
						<span>위탁장소 사진 등록</span>
						<div align="center">
								<div class="imgs_wrap" style="text-align: center;">
									<img id="img" />
								</div>
							</div>
							<a href="javascript:" onclick="fileUploadAction();"
									class="my_button">파일 업로드</a> <input type="file" id="input_imgs" name="file"
									multiple />
							
	
					</div>
				</div> -->
				
				
				
	</div>
				
				
			
		<!-- 펫시터 아이디 히든타입으로 넘기기 -->	
		<input type="hidden" id="PSMEM_ID" name="PSMEM_ID" value="${map.PSMEM_ID}">
		
	<div align="center">
		<div
			style="text-align: center; position: relative; right: 2em;  margin-top: 2em; margin-bottom:2em">
			<button style="width: 13em; height: 3em" id="cancle">처음으로</button>
			<button style="width: 13em; height: 3em; margin-left:2em;" id="join">완료</button>
		</div>
	</div>

</form>
</div>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>

</div>

<style type="text/css">


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
	margin-top: 15px;
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
		new daum.Postcode(
				{
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
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document
									.getElementById("PSMEM_CONSIGNMENT_ADDRESS_ADD").value = extraAddr;

						} else {
							document
									.getElementById("PSMEM_CONSIGNMENT_ADDRESS_ADD").value = '';
						}

						document.getElementById("PSMEM_CONSIGNMENT_ZIPCODE").value = data.zonecode;
						document.getElementById("PSMEM_CONSIGNMENT_ADDRESS1").value = addr;
						document.getElementById("PSMEM_CONSIGNMENT_ADDRESS2")
								.focus();
					}
				}).open();
	}

	
</script>



<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>