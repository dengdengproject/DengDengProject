<!-- 20.02.12 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<c:if test="${map.QNA_PRIVATE_CHECK == 'Y'}">
	<c:if test="${ID != map.ID && ADMIN_ID == null}">
		<script type="text/javascript">
  			alert("본인만 내용을 확인할 수 있습니다.");
			history.go(-1);
		</script>
	</c:if>
</c:if>

<div style="height: 400px; border-top: solid;">
	<div style="height: 600px;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">Q&A</span>
				<hr />
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 50px">글번호</label> ${map.BOARD_NO }
					<label style="font-weight: bold; width: 90px">말머리</label> ${map.QNA_HEADER }
					<label class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> ${map.QNA_SUBJECT }
				</div>
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.QNA_WRITER } 
					<input type="hidden" name="ID" id="ID" value="${map.ID }">
					<input type="hidden" name="QNA_RE_NO" id="QNA_RE_NO" value="${map.BOARD_NO }">
					<input type="hidden" name="BOARD_CREA_ID" id="BOARD_CREA_ID" value="${mem.ID }">
					<label style="width: 90px; position: relative; left: 5em">조회수</label>
					<span style="position: relative; left: 5em">${map.QNA_COUNT }</span>
					<label style="width: 90px; position: relative; left: 10em">등록일</label>
					<span style="position: relative; left: 10em">${map.QNA_DATE }</span>
				</div>
				
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">내용</label> 
					<c:forEach var="imgs" items="${list }">
						<img width="200" height="200" src="<%=cp%>/resources/images/board/${imgs.BOARD_STORED_FILE_NAME}" />
					</c:forEach>
					<br/><br/>
					<p>
					${map.QNA_CONTENT }
					</p>
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
			</div>

			<a href="#this" class="btn" id="list">목록</a>
			<c:if test="${ID == map.ID || ADMIN_ID != null}">
				<c:if test="${map.QNA_RE_STEP == 0}">
					<a href="#this" class="btn" id="update">수정</a>
				</c:if>
			</c:if>
			<c:if test="${ADMIN_ID != null }">
				<c:if test="${map.QNA_RE_STEP == 0}">
					<a href="#this" class="btn" id="reply">답변작성</a>
				</c:if>
				<c:if test="${map.QNA_RE_STEP > 0}">
					<a href="#this" class="btn" id="reUpdate">답변수정</a>
				</c:if>
			</c:if>
			
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
				 	
				 	$("#reUpdate").on("click", function(e){ //답변수정하기
						e.preventDefault();
						fn_openBoardReUpdate();
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
			 	
			 	function fn_openBoardReUpdate(){
			 		var idx = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaReUpdateForm' />");
					comSubmit.addParam("BOARD_NO", idx);
					comSubmit.submit();
				} 
			 	
			</script>
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>