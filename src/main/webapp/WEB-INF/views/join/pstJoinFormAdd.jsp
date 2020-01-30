<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<!--  회원가입 탭 -->
<div style="height: 950px">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">펫시터 회원 가입</span>
	</div>
	<div
		style="text-align: center; position: relative; left: 20em; margin-top: 1em">
		<span>* 표시는 필수 입력 사항입니다.</span>
	</div>
	<div
		style="text-align: center; margin-top: 2em; position: relative; right: 20em">
		<span style="font-weight: bold;">직업*</span>
	</div>
	<div
		style="text-align: center; position: relative; bottom: 1.9em; right: 10em">
		<select name="job" style="width: 8em">
			<option value="">직업선택</option>
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
		<label><input type="checkbox" name="license" value="yes">
			예 &nbsp; &nbsp; &nbsp;</label> <label><input type="checkbox"
			name="license" value="no"> 아니오</label>
	</div>
	<div
		style="text-align: center; position: relative; right: 21.9em; bottom: 0.5em;">
		<span style="font-weight: bold;">자격증 등록*</span>
	</div>
	<div id="license_add">
		<div
			style="text-align: center; position: relative; right: 9em; bottom: 2.5em;">
			<input type="text" placeholder="자격 명칭" style="width: 10em"></input>
		</div>
		<div style="text-align: center; position: relative; bottom: 4.7em;">
			<label
				style="outline: none; background: #337AB7; color: white; width: 5.5em; height: 2em; line-height: 190%; border-radius: 10px;">

				파일 추가<input type="file" style="display: none; position: relative;">
			</label>
		</div>
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
		<label><input type="checkbox" name="univ" value="yes">
			예 &nbsp; &nbsp; &nbsp;</label> <label><input type="checkbox"
			name="univ" value="no"> 아니오</label>
	</div>
	<div
		style="text-align: center; position: relative; right: 21em; bottom: 0.5em;">
		<span style="font-weight: bold;">위탁 장소*</span>
	</div>
	<div
		style="text-align: center; position: relative; right: 6.5em; bottom: 2.3em">

		<button type="button" style="width: 8em; height: 32px;"
			onclick="openZipSearch()">우편번호 검색</button>
		<input type="text" name="zip" style="width: 6em; height: 26px;" /> <br>
		<input type="text" name="addr1"
			style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;"
			readonly /><br> <input type="text" name="addr2"
			style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;" />
	</div>
	<div
		style="text-align: center; position: relative; right: 21em; top: 1em;">
		<span style="font-weight: bold;">활동 경력*</span>
	</div>
	<div
		style="text-align: center; position: relative; left: 4em; bottom: 0.5em;">

		<textarea style="width: 500px; height: 5em; resize: none;"></textarea>
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

		<textarea style="width: 500px; height: 5em; resize: none;"></textarea>
	</div>

	<!-- 프로필 사진 등록 -->
	<div align="center">
		<div
			style="text-align: center; position: relative; left: 20em; bottom: 44em; width: 15em">
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
	<div align="center">
		<div
			style="text-align: center; position: relative; right: 8em; bottom: 16em; margin-top: 1em; width: 14em">
			<button style="width: 13em; height: 3em"
				onclick="location.href = 'join_confirm.html' ">처음으로</button>
		</div>
		<div
			style="text-align: center; position: relative; left: 13em; bottom: 20em; margin-top: 1em; width: 14em">
			<button style="width: 13em; height: 3em"
				onclick="location.href = 'pet_join_form.html' ">다음</button>
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
		new daum.Postcode({
			oncomplete: function(data) {
				$('[name=zip]').val(data.zonecode); // 우편번호 (5자리)
				$('[name=addr1]').val(data.address);
				$('[name=addr2]').val(data.buildingName);
			}
		}).open();
	}
	
	//자격증 추가
		function add_item(){
		// pre_set 에 있는 내용을 읽어와서 처리..
		var div = document.createElement('div');
		div.innerHTML = document.getElementById('license_add').innerHTML;
		document.getElementById('field').appendChild(div);
	}
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