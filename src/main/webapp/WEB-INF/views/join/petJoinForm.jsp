<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>


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
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}
	
	function fn_joinSubmit(){
		alert("joinSubmit!!!!!!!!!!!!!!!")
		var comSubmit = new ComSubmit("joinForm");
		comSubmit.setUrl("<c:url value='/petRegister' />");
		comSubmit.submit();
	}
	
	$("#petRegist").on("submit",function(e){
	});

</script>

<!-- 댕댕이정보 입력 시작 -->
<div style="height: 1200px;">
	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">댕댕이 정보 입력</span>
		<div style="text-align: center; margin-top: 1em">
			<span style="font-size: 1em; position: relative; right: 10.5em;"><br>지금
				댕댕이 등록을 하지 않으셔도 회원 가입은 완료하실 수 있습니다.</br></span>
		</div>
	</div>
	<div
		style="text-align: center; position: relative; left: 20em; margin-top: 1em">
		<span>* 표시는 필수 입력 사항입니다.</span>
	</div>

<form action="petRegist" id="joinForm" enctype="multipart/form-data" method="post">
	<!-- 이름 -->
	<div style="text-align: center; margin-top: 2em">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">이름</span>
		</div>
		<div>
			<input type="text" id="PET_MEM_NAME" name="PET_MEM_NAME"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
	</div>

	<!-- 성별 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">성별</span>
		</div>
		<div style="position: relative; right: 14em; bottom: 1.5em;">
			<label><input type="radio" name="PET_MEM_SEX" value="수컷"
				style="position: relative; right: 20em; bottom: 2em;" checked>수컷</label>
			&nbsp;&nbsp; <label><input type="radio" name="PET_MEM_SEX"
				value="암컷" style="position: relative; right: 20em; bottom: 2em;">암컷</label>
		</div>
	</div>

	<!-- 품종 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">품종</span>
		</div>
		<div>
			<input type="text" placeholder="품종 입력"  id="PET_MEM_KIND" name="PET_MEM_KIND"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
		<div>
			<button type="button"
				style="width: 8em; height: 32px; position: relative; right: 3em; bottom: 4.3em;">품종
				검색</button>
		</div>
	</div>
	
	<!-- 크기 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">크기</span>
		</div>
		<div>
			<input type="text" placeholder="대형견"  id="PET_MEM_SIZE" name="PET_MEM_SIZE"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
		
	</div>
	
	<!-- 무게 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">몸무게</span>
		</div>
		<div>
			<input type="text" placeholder="5kg"  id="PET_MEM_WEIGHT" name="PET_MEM_WEIGHT"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
		
	</div>

	<!-- 등록번호 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26em; margin-top:1em; bottom: 1.5em;">
			<span style="font-weight: bold;">등록번호</span>
		</div>
		<div>
			<input type="text" id="PET_NO" name="PET_NO"
				style="width: 10em; position: relative; right: 13em; bottom: 3.5em;">
		</div>
	</div>

	<!-- 댕댕이 생일 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26.5em; bottom: 1.7em;">
			<span style="font-weight: bold;">댕댕이생일</span>
		</div>
		<div>
			<input type="text" placeholder="2020/01/01" id="PET_MEM_BIRTHDAY" name="PET_MEM_BIRTHDAY"
				style="width: 10em; position: relative; right: 13em; bottom: 3.5em;">
		</div>
	</div>

	<!-- 중성화여부 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26.5em; bottom: 1.7em;">
			<span style="font-weight: bold;">중성화 여부</span>
		</div>
		<div style="position: relative; right: 14em; bottom: 3em;">
			<label><input type="checkbox" name="PET_MEM_SEX_CHECK" value="예"
				style="position: relative; right: 20em; bottom: 2em;">예</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="PET_MEM_SEX_CHECK"
				value="아니오" style="position: relative; right: 20em; bottom: 2em;">아니오</label>
		</div>
	</div>

	<!-- 병력 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em; bottom: 1.5em;">
			<span style="font-weight: bold;">병력</span>
		</div>
		<div style="position: relative; right: 15em; bottom: 3.0em;">
			<label><input type="checkbox" name="PET_MEM_CASE" value="유"
				style="position: relative; right: 20em; bottom: 2em;">유</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="PET_MEM_CASE"
				value="무" style="position: relative; right: 20em; bottom: 2em;">무</label>
		</div>

	</div>

	<!-- 주치병원 -->
	<div style="text-align: center; position: relative;">
		<div style="position: relative; right: 26em;">
			<span style="font-weight: bold;">주치병원</span>
		</div>
		<div
			style="text-align: center; position: relative; right: 10.5em; bottom: 1em">
			<button type="button" style="width: 8em; height: 32px;"
				onclick="openZipSearch()">우편번호 검색</button>
			<input type="text" name="PET_MEM_ZIPCODE" id="PET_MEM_ZIPCODE" placeholder="우편번호" style="width: 9em; height: 26px; left:1em;" /> <br>
			<input type="text" name="PET_MEM_ADDRESS1" id="PET_MEM_ADDRESS1"
				style="position: relative;  left:6em; margin-top: 0.5em; width: 200px; height: 30px;"
				readonly /> 
				<input type="text" name="PET_MEM_ADDRESS_ADD" id="PET_MEM_ADDRESS_ADD"
				style="position: relative; left: 7em; margin-top: 0.5em; width: 200px; height: 30px;"/><br>
				<input type="text" name="PET_MEM_ADDRESS2" id="PET_MEM_ADDRESS2"  placeholder="상세주소"
				style="position: relative; right: 1em; margin-top: 0.5em; width: 200px; height: 30px;" />
		</div>
	</div>
	
	<!-- 주치병원 연락처 -->
		<div style="text-align: center; margin-top: 1em">
			<div style="position: relative; right: 25em;">
				<span style="font-weight: bold;">주치병원연락처</span>
			</div>
			<div>
			<input type="text" placeholder="02-000-0000" id="PET_MEM_PHONE" name="PET_MEM_PHONE"
				style="width: 10em; position: relative; right: 13em; bottom: 1.5em;">
		</div>
		</div>

		<!-- 특징 -->
		<div style="text-align: center; margin-top: 1em">
			<div style="position: relative; right: 25em;">
				<span style="font-weight: bold;">특징</span>
			</div>
			<div>
				<textarea name="PET_MEM_FEATURE" id="PET_MEM_FEATURE"
					style="width: 500px; height: 5em; resize: none; position: relative; bottom: 2em;"></textarea>
			</div>
		</div>

			
		

				<!-- 프로필 사진 등록 -->
				<div align="center">
					<div
						style="text-align: center; position: relative; left: 20em; bottom: 57em; width: 15em">
						<span>프로필 사진 등록</span>
						<div align="center">
							<div class="imgs_wrap" style="text-align: center;">
								<img id="img" />
							</div>
						</div>
						<div class="input_wrap">
							<a href="javascript:" onclick="fileUploadAction();"
								class="my_button">파일 업로드</a> <input type="file" id="input_imgs" name="file"
								multiple />
						</div>
					</div>
				</div>

				<!--   <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->

				<div align="center">
					<div
						style="text-align: center; position: relative; right: 8em; bottom: 16em; margin-top: 1em; width: 14em">
						<button style="width: 13em; height: 3em" id="cancel">이전</button>
					</div>

					<div
						style="text-align: center; position: relative; left: 13em; bottom: 20em; margin-top: 1em; width: 14em">
						<button style="width: 13em; height: 3em" id="join">다음</button>
					</div>
				</div>
			</form>	

					<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
		
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
                    document.getElementById("PET_MEM_ADDRESS_ADD").value = extraAddr;
                
                } else {
                    document.getElementById("PET_MEM_ADDRESS_ADD").value = '';
                }
				
				 document.getElementById("PET_MEM_ZIPCODE").value = data.zonecode;
				 document.getElementById("PET_MEM_ADDRESS1").value = addr;
				 document.getElementById("PET_MEM_ADDRESS2").focus();
			}
		}).open();
	}
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

		
	</script>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>