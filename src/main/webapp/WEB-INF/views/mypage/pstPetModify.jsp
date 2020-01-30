<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mypst-menu.jspf"%>

<!-- 댕댕이정보 입력 시작 -->
<div style="height: 850px; border-top: solid;">
	<div style="text-align: center; margin-top: 4em">
		<span style="font-size: 2em; font-weight: bold;">댕댕이 정보 수정</span>
		<div style="text-align: center; margin-top: 1em">
			<span style="font-size: 1em; position: relative; right: 10.5em;"><br>지금
				댕댕이 등록을 하지 않으셔도 회원 가입은 완료하실 수 있습니다.</br></span>
		</div>
	</div>

	<div
		style="text-align: center; position: relative; left: 20em; margin-top: 1em">
		<span>* 표시는 필수 입력 사항입니다.</span>
	</div>

	<!-- 이름 -->
	<div style="text-align: center; margin-top: 2em">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">이름</span>
		</div>
		<div>
			<input type="text"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
	</div>

	<!-- 성별 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">성별</span>
		</div>
		<div style="position: relative; right: 14em; bottom: 1.5em;">
			<label><input type="checkbox" name="male" value="수컷"
				style="position: relative; right: 20em; bottom: 2em;">수컷</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="암컷" style="position: relative; right: 20em; bottom: 2em;">암컷</label>
		</div>
	</div>

	<!-- 품종 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em;">
			<span style="font-weight: bold;">품종</span>
		</div>
		<div>
			<input type="text" placeholder="품종 입력"
				style="width: 10em; position: relative; right: 13em; bottom: 2em;">
		</div>
		<div>
			<button type="button"
				style="width: 8em; height: 32px; position: relative; right: 3em; bottom: 4.3em;">품종
				검색</button>
		</div>
	</div>

	<!-- 등록번호 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26em; bottom: 1.7em;">
			<span style="font-weight: bold;">등록번호</span>
		</div>
		<div>
			<input type="text"
				style="width: 10em; position: relative; right: 13em; bottom: 3.5em;">
		</div>
	</div>

	<!-- 댕댕이 생일 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26.5em; bottom: 1.7em;">
			<span style="font-weight: bold;">댕댕이생일</span>
		</div>
		<div>
			<input type="text" placeholder="2020/01/01"
				style="width: 10em; position: relative; right: 13em; bottom: 3.5em;">
		</div>
	</div>

	<!-- 중성화여부 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 26.5em; bottom: 1.7em;">
			<span style="font-weight: bold;">중성화 여부</span>
		</div>
		<div style="position: relative; right: 14em; bottom: 3em;">
			<label><input type="checkbox" name="male" value="예"
				style="position: relative; right: 20em; bottom: 2em;">예</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="아니오" style="position: relative; right: 20em; bottom: 2em;">아니오</label>
		</div>
	</div>

	<!-- 병력 -->
	<div style="text-align: center;">
		<div style="position: relative; right: 25em; bottom: 1.5em;">
			<span style="font-weight: bold;">병력</span>
		</div>
		<div style="position: relative; right: 15em; bottom: 3.0em;">
			<label><input type="checkbox" name="male" value="유"
				style="position: relative; right: 20em; bottom: 2em;">유</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="무" style="position: relative; right: 20em; bottom: 2em;">무</label>
		</div>
		<div style="position: relative; right: 2.5em; bottom: 2.0em;">
			<label><input type="checkbox" name="male" value="알레르기"
				style="position: relative; right: 20em; bottom: 1em;">알레르기</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="알레르기" style="position: relative; right: 10em; bottom: 1em;">알레르기</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="알레르기" style="position: relative; right: 0em; bottom: 1em;">알레르기</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="알레르기" style="position: relative; left: 10em; bottom: 1em;">알레르기</label>
			&nbsp;&nbsp; <label><input type="checkbox" name="female"
				value="알레르기" style="position: relative; left: 20em; bottom: 1em;">알레르기</label>
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
			<input type="text" name="zip" style="width: 6em; height: 26px;" /> <br>
			<input type="text" name="addr1"
				style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;"
				readonly /><br> <input type="text" name="addr2"
				style="position: relative; left: 3.5em; margin-top: 0.5em; width: 300px; height: 30px;" />
		</div>

		<!-- 특징 -->
		<div style="text-align: center; margin-top: 1em">
			<div style="position: relative; right: 25em;">
				<span style="font-weight: bold;">특징</span>
			</div>
			<div>
				<textarea
					style="width: 500px; height: 5em; resize: none; position: relative; bottom: 2em;"></textarea>
			</div>

			<!-- 성향 -->
			<!-- 			<p style="margin:1em 0em 0em 0em;line-height:1.76056338028169; position: relative; right:20em; top:5em"><span><a HREF="#"
                                    target="_self" class="btn btn-lg btn-primary">다음</a></span></p>
   -->

			<!-- <p style="margin:1em 0em 0em 0em;line-height:1.76056338028169; position: relative; right:20em;"><span><a HREF="#"
                                    target="_self" class="btn btn-lg btn-primary">다음</a></span></p>
                                    
            <p style="margin:1em 0em 0em 0em;line-height:1.76056338028169; position: relative; left:3em; bottom:6em;"><span><a HREF="#"
                                    target="_self" class="btn btn-lg btn-primary">처음으로</a></span></p>
 -->
		</div>
	</div>
</div>

<div style="height: 900px">
	<div align="center">
		<div style="position: relative; right: 25em; top: 3em">
			<span style="font-weight: bold">성향</span>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 40em; height: 15em; position: relative; left: 2em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch1" value="1_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 4em; left: 1.9em"><input
				type="checkbox" name="ch1" value="1_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; right: 8.2em;"><input
				type="checkbox" name="ch1" value="1_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 20.5em;"><input
				type="checkbox" name="ch1" value="1_4">별로 관심을 두지 않아요.</label>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 40em; height: 15em; position: relative; left: 2em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch1" value="1_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 4em; left: 1.9em"><input
				type="checkbox" name="ch1" value="1_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; right: 8.2em;"><input
				type="checkbox" name="ch1" value="1_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 20.5em;"><input
				type="checkbox" name="ch1" value="1_4">별로 관심을 두지 않아요.</label>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 40em; height: 15em; position: relative; left: 2em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch1" value="1_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 4em; left: 1.9em"><input
				type="checkbox" name="ch1" value="1_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; right: 8.2em;"><input
				type="checkbox" name="ch1" value="1_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 20.5em;"><input
				type="checkbox" name="ch1" value="1_4">별로 관심을 두지 않아요.</label>
		</div>

		<div style="margin-top: 1em">
			<span>※ 사실과 다른 정보로 인해 사고가 발생할 경우 책임은 견주 본인에게 있음을 안내해드립니다.</span>
		</div>

		<!-- 프로필 사진 등록 -->
		<div align="center">
			<div
				style="text-align: center; position: relative; left: 20em; bottom: 100em; width: 15em">
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
				style="text-align: center; position: relative; right: 8em; bottom: 19em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em">저장</button>
			</div>

			<div
				style="text-align: center; position: relative; left: 13em; bottom: 23em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em"
					onclick="location.href = 'pst_my_pet.html' ">취소</button>
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