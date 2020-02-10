<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<%-- <%@ include file="/WEB-INF/views/include/include-header-add.jspf" %> --%>

<div style="height: 400px; border-top: solid;">
	<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->
	<div style="height: 600px;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">Q&A</span>
				<hr />
				
				<div class="form-inline" style="margin-bottom: 1em">
					<input type="hidden" id="BOARD_TYPE" name="BOARD_TYPE" value="${map.BOARD_TYPE }">
					<label style="font-weight: bold; width: 50px">글번호</label> ${map.BOARD_NO }
					<label style="font-weight: bold; width: 90px">말머리</label> ${map.QNA_HEADER }
					<label class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> ${map.QNA_SUBJECT }
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.QNA_WRITER } 
					<input type="hidden" name="ID" id="ID" value="${map.ID }">
					<input type="hidden" name="writerId" id="writerId" value="${ID }">
					<input type="hidden" name="adminId" id="adminId" value="${ADMIN_ID }">
					<input type="hidden" name="QNA_RE_NO" id="QNA_RE_NO" value="${map.BOARD_NO }">
					<input type="hidden" name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ID }">
					<label style="width: 90px; position: relative; left: 5em">조회수</label>
					<span style="position: relative; left: 5em">${map.QNA_COUNT }</span>
					<label style="width: 90px; position: relative; left: 10em">등록일</label>
					<span style="position: relative; left: 10em">${map.QNA_DATE }</span>
				</div>
				
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">내용</label> ${map.QNA_CONTENT }
				</div>
				
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<c:forEach var="row" items="${list }">
							<input type="hidden" id="BOARD_FILE_NO" value="${row.BOARD_FILE_NO }">
							<a href="#this" name="file">${row.BOARD_ORIGINAL_FILE_NAME } </a>
							(${row.BOARD_FILE_SIZE }kb)
						</c:forEach>
					</td>
				</tr>
				
				<!-- <div class="form-inline" style="margin-bottom: 10px">
					<div class="form-group">
						<label style="width: 90px">첨부파일</label>
					</div>
					<div class="form-group">
						<input type="file" placeholder="첨부파일을 선택하세요."
							style="width: 400px; position: relative; left: 1em" />
					</div>
				</div> -->
			</div>

			<!-- <div
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
				<button style="width: 8em; height: 2em">수정</button>
			</div> -->
			<a href="#this" class="btn" id="list">목록</a>
			<c:if test="${ID == map.ID || ADMIN_ID != null}">
				<a href="#this" class="btn" id="update">수정</a>
			</c:if>
			<c:if test="${ADMIN_ID != null }">
				<a href="#this" class="btn" id="reply">답변작성</a>
			</c:if>
			<!-- <div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em">
				<button style="width: 8em; height: 2em">목록</button>
			</div> -->
			
			
			<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
			<script type="text/javascript">
				$(document).ready(function(e){
					$("#list").on("click", function(e){ //목록으로 게시판 리스트로 가기
						e.preventDefault();
						fn_openBoardList();
					});
					
					$("#update").on("click", function(e){ //수정하기
						e.preventDefault();
						fn_openBoardUpdate();
					});
					
				 	$("#reply").on("click", function(e){ //답변작성하기
						e.preventDefault();
						fn_openBoardReply();
					}); 
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaList' />");
					comSubmit.submit();
				}
				
				function fn_openBoardUpdate(){
					var idx = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaUpdateForm' />");
					comSubmit.addParam("BOARD_NO", idx);
					comSubmit.submit();
				}
				
			 	function fn_openBoardReply(){
			 		var idx = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaReplyForm' />");
					comSubmit.addParam("BOARD_NO", idx);
					comSubmit.submit();
				} 
			 	
			</script>
			
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>