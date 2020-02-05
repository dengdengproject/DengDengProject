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
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}

	function fn_joinSubmit() {

		var comSubmit = new ComSubmit("joinForm");

		if ($("#PSMEM_JOB").val() == "null") {
			alert("직업을 선택해주세요.");
			$("#PSMEM_JOB").focus();
			return false;
		}
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
		if (!$("#PSMEM_CAREER").val()) {
			alert("활동경력을 작성해주세요.");
			$("#NAME").focus();
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
</script>




<!--  회원가입 탭 -->
<div style="height: 950px">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">펫시터 정보 입력</span>
	</div>

	<div
		style="text-align: center; position: relative; left: 20em; margin-top: 1em">
		<span>* 표시는 필수 입력 사항입니다.</span>
	</div>


	<form action="join" id="joinForm" enctype="multipart/form-data"
		method="post">


		<div>
			<input type="hidden" id="PSMEM_ID" name="PSMEM_ID"
				value="<%=request.getParameter("pst_id")%>">
		</div>

		<div
			style="text-align: center; margin-top: 2em; position: relative; right: 20em">
			<span style="font-weight: bold;">직업*</span>
		</div>
		<div
			style="text-align: center; position: relative; bottom: 1.9em; right: 10em">
			<select style="width: 8em" id="PSMEM_JOB" name="PSMEM_JOB">
				<option value="null">직업선택</option>
				<option value="학생">학생</option>
				<option value="직장인">회사원</option>
				<option value="주부">주부</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<div
			style="text-align: center; position: relative; right: 22.9em; bottom: 0.5em;">
			<span style="font-weight: bold;">자격증 보유 여부*</span>
		</div>
		<div
			style="text-align: center; position: relative; right: 9em; bottom: 2em;">
			<label><input type="radio" id="PSMEM_LICENSE_CHECK"
				name="PSMEM_LICENSE_CHECK" value="Y" checked>예</label>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
				type="radio" value="N" id="PSMEM_LICENSE_CHECK"
				name="PSMEM_LICENSE_CHECK">아니오</label>
		</div>
		<div
			style="text-align: center; position: relative; right: 21.9em; bottom: 0.5em;">
			<span style="font-weight: bold;">자격증 등록</span>
		</div>
		<div id="license_add" style="text-align: center">
			<div
				style="text-align: center; position: relative; right: 9em; bottom: 2.5em;">
				<input type="text" placeholder="자격 명칭" style="width: 10em"></input>
			</div>

			<div align="center">
				<div
					style="text-align: center; position: relative; bottom: 4.7em; width: 5.5em;">

					<label
						style="outline: none; background: #337AB7; color: white; width: 5.5em; height: 2em; line-height: 190%; border-radius: 10px;">

						파일 추가<input type="file" id="input-file"
						style="position: relative;">
					</label>


				</div>
			</div>

			<span id="upload-name"
				style="position: relative; bottom: 4.5em; right: 10em;">선택된
				파일 없음</span>
</div>
<div id="field"></div>
<div
	style="text-align: center; position: relative; bottom: 4.7em; right: 5.5em">

	<button style="width: 17em" onclick="add_item()">자격증 추가</button>
</div>
<div
	style="text-align: center; position: relative; right: 23em; bottom: 0.5em;">
	<span style="font-weight: bold;">관련학과 졸업 여부*</span>
</div>
<div
	style="text-align: center; position: relative; right: 9em; bottom: 2em;">
	<label><input type="radio" id="PSMEM_SCHOOL_FINISH_CHECK"
		name="PSMEM_SCHOOL_FINISH_CHECK" value="Y" checked>예</label>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label><input
		type="radio" value="N" id="PSMEM_SCHOOL_FINISH_CHECK"
		name="PSMEM_SCHOOL_FINISH_CHECK">아니오</label>
</div>
<div
	style="text-align: center; position: relative; right: 21em; bottom: 0.5em;">
	<span style="font-weight: bold;">위탁 장소*</span>
</div>
<div style="text-align: center;">

	<div
		style="text-align: center; position: relative; right: 5.3em; bottom: 1em">
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
</div>
<div
	style="text-align: center; position: relative; right: 21em; top: 1em;">
	<span style="font-weight: bold;">활동 경력*</span>
</div>
<div
	style="text-align: center; position: relative; left: 4em; bottom: 0.5em;">

	<textarea style="width: 500px; height: 5em; resize: none;"
		id="PSMEM_CAREER" name="PSMEM_CAREER"></textarea>
</div>
<div
	style="text-align: center; position: relative; right: 21em; top: 2em;">
	<span style="font-weight: bold;">가능 서비스*</span>
</div>
<div
	style="text-align: center; position: relative; left: 6em; top: 0.5:">
	<label><input type="checkbox" name="service" value="?">
		픽업가능 &nbsp; &nbsp; &nbsp;</label> <label><input type="checkbox"
		name="service" value="?">대형견 가능</label> <label><input
		type="checkbox" name="service" value="?"> 산책가능 &nbsp; &nbsp;
		&nbsp;</label> <label><input type="checkbox" name="service" value="?">
		기본 케어 가능 &nbsp; &nbsp; &nbsp;</label> <label><input type="checkbox"
		name="service" value="?"> 출퇴근 가능 &nbsp; &nbsp; &nbsp;</label>
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
<div align="center">
	<div
		style="text-align: center; position: relative; left: 20em; bottom: 48em; width: 15em">
		<span>프로필 사진 등록</span>
		<div align="center">
			<div class="imgs_wrap" style="text-align: center;">
				<img id="img" />
			</div>
		</div>
		<a href="javascript:" onclick="fileUploadAction();" class="my_button">파일
			업로드</a> <input type="file" id="input_imgs" name="file" multiple />
	</div>
</div>
</div>
<div align="center">
	<div
		style="text-align: center; position: relative; right: 8em; bottom: 16em; margin-top: 1em; width: 14em">
		<button style="width: 13em; height: 3em" id="cancle">처음으로</button>
	</div>
	<div
		style="text-align: center; position: relative; left: 13em; bottom: 20em; margin-top: 1em; width: 14em">
		<button style="width: 13em; height: 3em" id="join">다음</button>
	</div>
</div>
</form>

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

	//자격증 추가
	function add_item() {
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('license_add').innerHTML;
		document.getElementById('field').appendChild(div);
	}

	//자격증 파일 이름 적용
	document.getElementById('input-file').addEventListener('change',
			function() {
				var filename = document.getElementById('upload-name');
				if (this.files[0] == undefined) {
					filename.innerText = '선택된 파일없음';
					return;
				}
				filename.innerText = this.files[0].name;
			});
//-->
</script>

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

	function deleteImageAction(index) {
		console.log("index : " + index);
		console.log("sel length : " + sel_files.length);

		sel_files.splice(index, 1);

		var img_id = "#img_id_" + index;
		$(img_id).remove();
	}

	function fileUploadAction() {
		console.log("fileUploadAction");
		$("#input_imgs").trigger('click');
	}

	function submitAction() {
		console.log("업로드 파일 갯수 : " + sel_files.length);
		var data = new FormData();

		for (var i = 0, len = sel_files.length; i < len; i++) {
			var name = "image_" + i;
			data.append(name, sel_files[i]);
		}
		data.append("image_count", sel_files.length);

		if (sel_files.length < 1) {
			alert("한개이상의 파일을 선택해주세요.");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "./study01_af.php");
		xhr.onload = function(e) {
			if (this.status == 200) {
				console.log("Result : " + e.currentTarget.responseText);
			}
		}
		xhr.send(data);
	}
</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>