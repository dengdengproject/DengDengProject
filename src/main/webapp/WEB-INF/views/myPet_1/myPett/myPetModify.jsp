<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>

<form id="frm">
<div style="height: 400px; border-top: solid;">

	<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->

	<div style="height: 600px;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">공지사항</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> <input type="text" id="NOTICE_SUBJECT" name="NOTICE_SUBJECT" value="${map.NOTICE_SUBJECT }"/> <!--  ${map.NOTICE_SUBJECT }-->
					
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.ADMIN_ID } <label
						style="width: 90px; position: relative; left: 5em">조회수</label> <span
						style="position: relative; left: 5em">${map.NOTICE_COUNT }</span> <label
						style="width: 90px; position: relative; left: 10em">등록일</label> <span
						style="position: relative; left: 10em">${map.NOTICE_DATE }</span>
						
				</div>
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글번호</label> ${map.NOTICE_NO }<input type="hidden" id="MYPET_NO" name="MYPET_NO" value="${map.MYPET_NO }" />
					
				</div>
				
				<div><textarea rows="20" cols="100" title="내용" id="NOTICE_CONTENT" name="NOTICE_CONTENT">${map.NOTICE_CONTENT }</textarea></div>
				<%-- <div>${map.NOTICE_CONTENT }</div> --%>
				
				<div class="form-inline" style="margin-bottom: 10px">
					<div class="form-group">
						<label style="width: 90px">첨부파일</label>
					</div>
					<div class="form-group">
						<input type="file" placeholder="첨부파일을 선택하세요."
							style="width: 400px; position: relative; left: 1em" />
					</div>
				</div>
			</div>

			<!-- <div
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
				<button style="width: 8em; height: 2em">수정</button>
			</div> -->
			
			<a href="#this" class="btn" id="list">목록</a>
			<a href="#this" class="btn" id="update">저장</a>
			<a href="#this" class="btn" id="delete">삭제</a>
			<!-- <div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em">
				<button style="width: 8em; height: 2em">목록</button>
			</div> -->
			
			
		</div>
	</div>
</div>
</form>
<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
			<script type="text/javascript">
				$(document).ready(function(e){
					$("#list").on("click", function(e){ //목록으로 게시판 리스트로 가기
						e.preventDefault();
						fn_openBoardList();
						
					});
					
					$("#update").on("click", function(e){ //저장하기
						e.preventDefault();
						fn_updateBoard();
					});
					
					$("#delete").on("click", function(e){ //삭제
						e.preventDefault();
						fn_deleteBoard();
					});
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/noticeList' />");
					comSubmit.submit();
				}
				
				function fn_updateBoard(){
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/noticeWUpdate' />");
				
					comSubmit.submit();
				}
				
				function fn_deleteBoard(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/noticeDelete' />");
					comSubmit.addParam("NOTICE_NO", $("#NOTICE_NO").val());
					comSubmit.submit();
				}
			</script>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>