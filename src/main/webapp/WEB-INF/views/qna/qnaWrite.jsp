<!-- 20.02.11 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<!-- 게시판 에디터 Summernote-->
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- 게시판 에디터 summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- 게시판 에디터 스크립트 -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote();
	});
</script>

</head>

<form id="frm" name="frm" enctype="multipart/form-data">
	<div style="height: 400px; border-top: solid;">
		<div style="height: auto;">
			<div align="center" class="container">
				<div align="left"
					style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
					<span style="font-weight: bold; font-size: 2em;">Q&A 글쓰기</span>
					<hr />
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="width: 90px">글제목</label> <label> <select
							id="QNA_HEADER" name="QNA_HEADER" style="width: 7em">
								<option value="">말머리선택</option>
								<option value="펫시터문의">펫시터문의</option>
								<option value="결제관련">결제관련</option>
								<option value="이용취소">이용취소</option>
						</select>
						</label> <input type="text" id="QNA_SUBJECT" name="QNA_SUBJECT"
							value="${QNA_SUBJECT }" class="form-control" style="width: 400px"
							placeholder="글 제목을 입력하세요." />
					</div>

					<div class="form-inline" style="margin-bottom: 1em">
						<label style="width: 90px">작성자</label> <strong>${mem.NAME }</strong>
						<input type="hidden" name="QNA_WRITER" id="QNA_WRITER"
							value="${mem.NAME}"></input> <input type="hidden" name="ID"
							id="ID" value="${mem.ID }"></input> <input type="hidden"
							name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ID }"></input>
						<input type="hidden" name="adminId" id="adminId"
							value="${mem.ADMIN_ID }"></input>
						<%-- <input type="hidden" name="ADMIN_ID" id="ADMIN_ID">${ADMIN_ID }</input> --%>
						<%-- <label style="width: 90px; margin-left: 3em">비밀번호</label>
						<input type="password" id="QNA_PASSWORD" name="QNA_PASSWORD" value="${QNA_PASSWORD }" class="form-control" style="width: 150px" /> --%>
						<!-- <input type="text" class="form-control" style="width:200px" placeholder="작성자를 입력하세요." /> -->
						<label style="margin-left: 3em"> <input type="checkbox"
							id="QNA_PRIVATE_CHECK" name="QNA_PRIVATE_CHECK" value="Y">
							비밀글 </input>
						</label>
					</div>

					<!-- <div id="summernote"></div> -->
					<div>
						<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT"
							name="QNA_CONTENT" placeholder="내용을 입력하세요.">${QNA_CONTENT }</textarea>
					</div>

					<div class="table file">
					
						<h1 style="font-size: 1.5em;">첨부 파일</h1>
						<div class="message">
							<p>- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
							<p>- 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
							<p>- 사진은 최소 1장 이상 등록해야 하며, 최대 5장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이
								다소 지연될 수 있습니다.</p>
						</div>
						<div id="fileDiv">
						
						
						<!--
							파일 ui 수정 추후에 수정할것
						 <div style="position: relative; top:2em; left:2em;">
								<img src="resources/images/folder.PNG" class="img_btn"
									style="width: 2.9em; height: 2.4em; border-radius: 5px; position: relative;"
									alt="open"> <input type="text" id="fileName"
									class="file_input_textbox" readonly
									style="width: 17em; line-height: 10px">
							</div>
							<input type="file" id="file" name="file_0" maxlength="5"
								style="width: 300px; opacity:0;filter: alpha(opacity=0);-ms-filter: alpha(opacity=0);cursor:pointer;"
								onchange="javascript: document.getElementById('fileName').value=this.value" />
							<a href="#this" class="" id="delete" name="delete" style="position: relative; bottom: 1.8em; left: 23em; ">X</a>
						 -->
						
						
						
							<p>
								<input type="file" id="file" name="file_0" maxlength="5"
									style="width: 300px;" /> <a href="#this" class="btn"
									id="delete" name="delete">삭제</a>
							</p>
						</div>
					</div>

					<!-- <div
				style="text-align: center; width: 8em; height: 2em; position: relative; right: 8em; top: 3em; margin-top: 1em; margin-bottom: 1em;">
				<button style="width: 8em; height: 2em"
					onclick="location.href='/first/qnaList'">등록</button>
			</div>

			<div
				style="text-align: center; width: 8em; height: 2em; position: relative; left: 1em; margin-top: 1em; margin-bottom: 1em;">
				<button style="width: 8em; height: 2em"
					onclick="location.href='/first/qnaList'">취소</button>
			</div> -->
					<div style="text-align: center;">
						<div style="position: relative; right: 69em; top:3em;">
							<a href="#this" class="btn_style" id="addFile"
								>파일추가</a>

						</div>

						<a href="#this" class="btn_style" id="write" style="margin-right: 1em;">등록</a> <a
							href="#this" class="btn_style" id="list">취소</a>

					</div>
				</div>
			</div>
		</div>
	</div>

</form>



<style>
.btn_style {
	text-align: center;
	position: relative;
	bottom: 3.9em;
	left: 32em;
	background-color: #649EE1;
	color: white !important;
	width: 5em;
	height: 2.5em;
	text-decoration: none !important;
	line-height: 2.5em;
	border-radius: 5px;
	display: inline-block;
	transition: all 0.1s;
	border-radius: 5px;
	position: relative;
	font-weight: bold;
}

.btn_style:hover{

	background-color: #205EA2;
}

</style>

<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
<script type="text/javascript">
	var gfv_count = 1;

	$(document).ready(function() {
		$("#list").on("click", function(e) { //취소
			e.preventDefault();
			fn_openBoardList();
		});

		$("#write").on("click", function(e) { //등록
			e.preventDefault();
			fn_insertBoard();
		});

		$("#addFile").on("click", function(e) { //파일추가
			e.preventDefault();
			fn_addFile();
		});

		$("a[name='delete']").on("click", function(e) { //파일삭제
			e.preventDefault();
			fn_deleteFile($(this));
		});

	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/qnaList' />");
		comSubmit.submit();
	}

	function fn_insertBoard() {
		var comSubmit = new ComSubmit("frm");
		if (confirm("등록 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/qnaWrite' />");
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_addFile() {
		var str = "<p><input type='file' name='file_"
				+ (gfv_count++)
				+ "' maxlength='5' style='width: 300px;'><a href='#this' class='btn' name='delete'>삭제</a><p>";
		$("#fileDiv").append(str);
		$("a[name='delete']").on("click", function(e) {
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>
<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>