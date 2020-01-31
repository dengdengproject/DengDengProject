<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript">
function fn_idCheck(){
	    var ID = {ID : $('#MEM_ID').val()};
	    $.ajax({
	        url:"<c:url value='/join/idCheck'/>",
	        type:'get',
	        data: ID,
	        success:function(data){	
	        	alert(data);
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
	

	
	
	/* 
 	$(document).ready(function(){
		// 취소
		$("#cancel").on("click", function(){
			
			location.href = "/login";
					    
		}) 
		function join(){
		$("#join").on("submit", function(){
			if($("#MEM_ID").val()==""){
				alert("아이디를 입력해주세요.");
				$("#MEM_ID").focus();
				return false;
			}
			if($("#PASSWORD1").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#PASSWORD1").focus();
				return false;
			}
			if($("#NAME").val()==""){
				alert("성명을 입력해주세요.");
				$("#NAME").focus();
				return false;
			}
			alert("회원가입~!!!!!!!!!!!!!!!!!!!!!!!!!");
		}
		
		);
		
			
		
	})
	 */
	
	
	
	
	

	</script>


<!-- 회원가입 입력 시작 -->
<div style="height: 900px; text-align: center">

	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">일반 회원 가입</span>
	</div>
	<div style="width: 80%; text-align: right;; margin-top: 1em">
		<span style="">* 표시는 필수 입력 사항입니다.</span>
	</div>

  <form id="joinForm" method="post">
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
			<input type="button" value="아이디중복확인" onclick="fn_idCheck();"
				style="width: 8em; height: 32px; position: relative; right: 2em; bottom: 4.2em; margin-left: 2em;">
				<span id = "chkMsg" style= "position: relative; bottom:4em"></span>
		</div>
		
	</div>
	<!-- 아이디 -->

	<!-- 패스워드 -->
	<div style="text-align: center;">
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
			<!-- 패스워드 -->

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
					
					<!-- 성별 -->
					<div style="text-align: center;">
						<div style="position: relative; right: 24.2em;">
							<span style="font-weight: bold">성별*</span>
						</div>
						<div style="position: relative; right: 13.7em; bottom: 1.5em;">
							<label><input type="checkbox" name="SEX" value="남자"
								style="position: relative; right: 20em; bottom: 2em;">남자</label>
							&nbsp;&nbsp; <label><input type="checkbox" name="SEX"
								value="여자" style="position: relative; right: 20em; bottom: 2em;">여자</label>
						</div>
					</div>

					<!-- 생년월일 -->
					<div style="text-align: center;">
						<div style="position: relative; right: 25.5em;">
							<span style="font-weight: bold">생년월일*</span>
						</div>
						<div>
							<input type="text" placeholder="2020/01/01" name="BIRTHDAY" id="BIRTHDAY"
								style="width: 20em; position: relative; right: 8em; bottom: 2em;">
						</div>
					</div>

					<!-- 주소 -->
					<div style="text-align: center;">
						<div style="position: relative; right: 24.4em; top: 0.5em">
							<span style="font-weight: bold">주소</span>
						</div>
						<div
							style="text-align: center; position: relative; right: 11em; bottom: 1em">
							<button type="button" style="width: 8em; height: 32px;"
								onclick="openZipSearch()">우편번호 검색</button>
							<input type="text" name="ZIPCODE" id="ZIPCODE" style="width: 6em; height: 26px;" />
							<br> <input type="text" name="ADDRESS1"
								style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;"
								readonly /><br> <input type="text" name="ADDRESS2"
								style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;" />
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
							<div class="input_wrap">
								<a href="javascript:" onclick="fileUploadAction();"
									class="my_button">파일 업로드</a> <input type="file" id="input_imgs"
									multiple />
							</div>
						</div>
					</div>
			</form>

					<!--   <a href="javascript:" class="my_button" onclick="submitAction();">업로드</a> -->

					<div align="center">
						<div
							style="position: relative; right: 8em; bottom: 18em; margin-top: 1em; width: 15em">
							<button style="width: 13em; height: 3em"
								id="cancel">처음으로</button>
						</div>
						<div
							style="position: relative; left: 13em; bottom: 22em; margin-top: 1em; width: 15em">
							<button style="width: 13em; height: 3em" id="join" type="submit">
								가입완료</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
	//우편번호 검색
	function openZipSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=addr1]').val(data.address);
				$('[name=addr2]').val(data.buildingName);
			}
		}).open();
	}

	//비밀번호 확인 
	$('#PASSWORD1').focusout(function() {
		var pwd1 = $("#PASSWORD1").val();
		var pwd2 = $("#PASSWORD2").val();
		if (pwd1 != "" || pwd2 != "") {
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