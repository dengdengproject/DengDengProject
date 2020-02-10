
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>
<div style="height: 400px; border-top: solid;">

	<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->

	<div style="height: 600px;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">댕댕이 자랑 게시판</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> ${map.MYPET_SUBJECT }
					
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.MYPET_WRITER } <label
						style="width: 90px; position: relative; left: 5em">조회수</label> <span
						style="position: relative; left: 5em">${map.MYPET_COUNT }</span> <label
						style="width: 90px; position: relative; left: 10em">등록일</label> <span
						style="position: relative; left: 10em">${map.MYPET_DATE }</span>
						
				</div>
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글번호</label> ${map.MYPET_NO }
					
				</div>
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">내용</label> ${map.MYPET_CONTENT }
					
				</div>
				<div>${map.NOTICE_CONTENT }</div>
				
				<div class="form-inline" style="margin-bottom: 10px">
					<div class="form-group">
						<label style="width: 90px">첨부파일</label>
					</div>
					<div class="form-group">
						<c:forEach var="row" items="${list }">
							<input type="hidden" id="BOARD_FILE_NO" value="${row.BOARD_FILE_NO }">
							<a href="#this" name="file">${row.BOARD_ORIGINAL_FILE_NAME }</a>
							(${row.BOARD_FILE_SIZE }kb)
						</c:forEach>
					</div>
				</div>
			</div>

			<!-- <div
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
				<button style="width: 8em; height: 2em">수정</button>
			</div> -->
			
			<a href="#this" class="btn" id="list">목록</a>
			<a href="#this" class="btn" id="update">수정</a>
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
					
					/* $("a[name='file']").on("click", function(e){
						e.preventDefault();
					}); */
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myPetList' />");
					comSubmit.submit();
				}
				
				function fn_openBoardUpdate(){
					var idx = "${map.MYPET_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myPetUpdate' />");
					comSubmit.addParam("MYPET_NO", idx);
					comSubmit.submit();
				}//ㅇㅇ
			</script>
			
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

 