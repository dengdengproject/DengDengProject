<!-- 20.02.10 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<%-- <%@ include file="/WEB-INF/views/include/include-header-add.jspf" %> --%>



<div  class="tab-box">
				<ul>

					<li onclick="location.href = '/first/noticeList'">공지사항</li>

					<li class="selected" onclick="location.href = '/first/qnaList'">Q&A</li>

					<li onclick="location.href = '/first/reportList'">신고하기</li>

					<li onclick="location.href = '/first/mypetList'">댕댕이 자랑</li>



				</ul>
		</div>
	</div>
</nav>


<form id="frm" name="frm" enctype="multipart/form-data">
	<div style="height: auto; border-top: solid;">

		<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->
		<div style="height: auto;">
			<div align="center" class="container">
				<div align="left"
					style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
					<span style="font-weight: bold; font-size: 2em;">Q&A</span>
					<hr />

					<div class="form-inline" style="margin-bottom: 1em">
						<label> <select id="QNA_HEADER" name="QNA_HEADER"
							style="width: 7em" value="${map.QNA_HEADER }">
								<option value="">말머리선택</option>
								<option value="펫시터문의">펫시터문의</option>
								<option value="결제관련">결제관련</option>
								<option value="이용취소">이용취소</option>
						</select>
						</label> <label style="font-weight: bold; width: 90px">글제목</label> <input
							type="text" id="QNA_SUBJECT" name="QNA_SUBJECT"
							value="${map.QNA_SUBJECT }" />
					</div>

					<div class="form-inline" style="margin-bottom: 1em">
						<label style="font-weight: bold; width: 90px">작성자</label>
						${map.QNA_WRITER } <input type="hidden" name="ID" id="ID"
							value="${map.ID }"></input> <input type="hidden" name="adminId"
							id="adminId" value="${ADMIN_ID }"></input> <input type="hidden"
							name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ID }"></input>
						<label style="width: 90px; position: relative; left: 5em">조회수</label>
						<span style="position: relative; left: 5em">${map.QNA_COUNT }</span>
						<label style="width: 90px; position: relative; left: 10em">등록일</label>
						<span style="position: relative; left: 10em">${map.QNA_DATE }</span>
					</div>
					<div class="form-inline" style="margin-bottom: 1em">
						<label style="font-weight: bold; width: 90px">글번호</label>${map.BOARD_NO }
						<input type="hidden" name="BOARD_NO" id="BOARD_NO"
							value="${map.BOARD_NO }"></input>

						<div>
							<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT"
								name="QNA_CONTENT" placeholder="내용을 입력하세요.">${map.QNA_CONTENT }</textarea>
						</div>

						<%-- <div>${map.NOTICE_CONTENT }</div> --%>

						<div class="table file">
							<h1 style="font-size: 1.5em">첨부 파일</h1>
							<div class="message">
								<p>- 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
								<p>- 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
								<p>- 사진은 최소 1장 이상 등록해야 하며, 최대 5장까지 권장합니다. 그 이상 등록할 경우 업로드
									시간이 다소 지연될 수 있습니다.</p>
							</div>
							<div id="fileDiv">
								<c:forEach var="row" items="${list }" varStatus="var">
									<p>
										<input type="hidden" id="BOARD_FILE_NO"
											name="BOARD_FILE_NO_${var.index }"
											value="${row.BOARD_FILE_NO }"></input> <a href="#this"
											id="BOARD_ORIGINAL_FILE_NAME_${var.index }"
											name="BOARD_ORIGINAL_FILE_NAME_${var.index }">
											${row.BOARD_ORIGINAL_FILE_NAME } (${row.BOARD_FILE_SIZE }kb)</a>
										<input type="file" id="file_${var.index }"
											name="file_${var.index }"></input> <a href="#this"
											class="btn" id="delete_${var.index }"
											name="delete_${var.index }">삭제</a>
									</p>
								</c:forEach>
							</div>
						</div>
					</div>

					<!-- <div
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
				<button style="width: 8em; height: 2em">수정</button>
			</div> -->
					<br />
					<br />
					<div style="position: relative; right:32em;">
						<a href="#this" class="btn_style" id="addFile">파일추가</a>

					</div>
					<div style="position: relative; left:23em;">

						<a href="#this" class="btn_style" id="list">목록</a> <a href="#this"
							class="btn_style" id="update">수정</a> <a href="#this"
							class="btn_style" id="delete">삭제</a>

					</div>

					<!-- <div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em">
				<button style="width: 8em; height: 2em">목록</button>
			</div> -->
				</div>
			</div>
		</div>
		</div>
</form>
<%@ include file="/WEB-INF/views/include/include-body.jspf"%>


 <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> 





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

.btn_style:hover {
	background-color: #205EA2;
}
</style>


<script type="text/javascript">
	var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function(e) {
		$("#list").on("click", function(e) { //목록으로 게시판 리스트로 가기
			e.preventDefault();
			fn_openBoardList();
		});

		$("#update").on("click", function(e) { //수정하기
			e.preventDefault();
			fn_openBoardUpdate();
		});

		$("#delete").on("click", function(e) { //삭제
			e.preventDefault();
			fn_openBoardDelete();
		});

		$("#addFile").on("click", function(e) { //파일추가
			e.preventDefault();
			fn_addFile();
		});

		$("a[name^='delete']").on("click", function(e) { //파일삭제
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_openBoardList() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/qnaList' />");
		comSubmit.submit();
	}

	function fn_openBoardUpdate() {
		var comSubmit = new ComSubmit("frm");
		if (confirm("수정 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/qnaUpdate' />");
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_openBoardDelete() {
		var comSubmit = new ComSubmit();
		if (confirm("삭제 하시겠습니까?") == true) {
			comSubmit.setUrl("<c:url value='/qnaDelete' />");
			comSubmit.addParam("BOARD_NO", $("#BOARD_NO").val());
			comSubmit.submit();
		} else {
			return;
		}
	}

	function fn_addFile() {
		var str = "<p>" + "<input type='file' id='file_" + (gfv_count)
				+ "' name='file_" + (gfv_count) + "'>"
				+ "<a href='#this' class='btn' id='delete_" + (gfv_count)
				+ "' name='delete_" + (gfv_count) + "'>삭제</a>" + "</p>";
		$("#fileDiv").append(str);

		$("#delete_" + (gfv_count++)).on("click", function(e) { //삭제 버튼 
			e.preventDefault();
			fn_deleteFile($(this));
		});
	}

	function fn_deleteFile(obj) {
		obj.parent().remove();
	}
</script>


</html>