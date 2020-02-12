<!-- 20.02.11 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<!-- 게시판 에디터 Summernote-->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- 게시판 에디터 summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
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
				<span style="font-weight: bold">Q&A 답변쓰기</span>
				<hr />
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">말머리</label> ${map.QNA_HEADER }
					<input type="hidden" name="QNA_HEADER" id="QNA_HEADER" value="${map.QNA_HEADER }"></input>	
					<label style="width: 90px">글제목</label> [답변] ${map.QNA_SUBJECT }
					<input type="hidden" name="QNA_SUBJECT" id="QNA_SUBJECT" value="${map.QNA_SUBJECT }"></input>
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">작성자</label> 관리자
					<input type="hidden" name="QNA_WRITER" id="QNA_WRITER" value="관리자"></input>
					<input type="hidden" name="ID" id="ID" value="${map.ID }"></input>
					<input type="hidden" name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${ADMIN_ID }"></input>
					<input type="hidden" name="BOARD_NO" id="BOARD_NO" value="${map.BOARD_NO }">
					<input type="hidden" name="QNA_RE_NO" id="QNA_RE_NO" value="${map.BOARD_NO }">
				</div>
				
				<label style="width: 90px">내용</label> [Q&A질문] ${map.QNA_CONTENT}
				<div>
					<textarea rows="20" cols="100" title="내용" id="QNA_CONTENT" name="QNA_CONTENT" placeholder="질문의 답변을 입력하세요.">${QNA_CONTENT }</textarea>
				</div>
				
				<div class="table file">
					<h1>첨부 파일</h1>
						<div class="message">
							<p> - 사진은 가로로 찍은 사진을 권장합니다. (가로 사이즈 최소 800px)</p>
							<p> - 사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</p>
							<p> - 사진은 최소 1장 이상 등록해야 하며, 최대 5장까지 권장합니다. 그 이상 등록할 경우 업로드 시간이 다소 지연될 수 있습니다.</p>
						</div>
						<div id="fileDiv">
							<p>
								<input type="file" id="file" name="file_0"> 
								<a href="#this" class="btn" id="delete" name="delete">삭제</a>
							</p>
						</div>
				</div>
			
			<a href="#this" class="btn" id="addFile" >파일추가</a>
			<a href="#this" class="btn" id="write" >등록</a>
			<a href="#this" class="btn" id="list">취소</a>
			
		</div>
	</div>
</div>
</div>
</form>

		<%@ include file="/WEB-INF/views/include/include-body.jspf" %> 
			<script type="text/javascript">
				var gfv_count = 1;
				
				$(document).ready(function(){
					$("#list").on("click", function(e){ //취소하고 리스트로 가는 버튼
						e.preventDefault();
						fn_openBoardList();
					});
					
					$("#write").on("click", function(e){
						e.preventDefault();
						fn_insertBoard();
					});
					
					$("#addFile").on("click", function(e){
						e.preventDefault();
						fn_addFile();
					});
					
					$("a[name='delete']").on("click", function(e){
						e.preventDefault();
						fn_deleteFile($(this));
					});
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					if(confirm("취소하시겠습니까?") == true) {
					comSubmit.setUrl("<c:url value='/qnaList' />");
					comSubmit.submit();
					} else {
						return;
					}
				}
				
				function fn_insertBoard(){
					var comSubmit = new ComSubmit("frm");
					if(confirm("답변등록 하시겠습니까?") == true) {
					comSubmit.setUrl("<c:url value='/qnaReply' />"); 
					comSubmit.submit();
					} else {
						return;
					}
				}
				
				function fn_addFile(){
					var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a><p>";
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
			
<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>