<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>

<form id="frm">
<div style="height: 400px; border-top: solid;">

	<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->

	<div style="height: auto;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">댕댕이 자랑 게시판</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> <input type="text" id="MYPET_SUBJECT" name="MYPET_SUBJECT" value="${map.MYPET_SUBJECT }" />
					
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.MYPET_WRITER } <label
						style="width: 90px; position: relative; left: 5em">조회수</label> <span
						style="position: relative; left: 5em">${map.MYPET_COUNT }</span> <label
						style="width: 90px; position: relative; left: 10em">등록일</label> <span
						style="position: relative; left: 10em">${map.MYPET_DATE }</span>
				</div>
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글번호</label> ${map.MYPET_NO }<input type="hidden" name="MYPET_NO" name="MYPET_NO" value="${map.MYPET_NO }" />
					
				</div>
				
				<%-- <div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">내용</label> ${map.MYPET_CONTENT }
					
				</div> --%>
				<div><textarea rows="20" cols="100" title="내용" id="MYPET_CONTENT" name="MYPET_CONTENT">${map.MYPET_CONTENT }</textarea></div>
				
				<!-- <!-- 댕댕이자랑게시판 상세보기 이미지 부분 시작 -->
				<div class="ttr_Services_html_row3 row" style="margin-top: 5em">
					<div class="html_content" style="text-align: center">
						<span class="ttr_image"
							style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
								<img class="ttr_uniform" src="images/ja6.jpg"
								style="width: 250px; height: 200px;" />
						</span></span>

						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
					</div>
				</div> -->
				<!-- 댕댕이자랑게시판 상세보기 이미지 부분 끝 -->

				<!-- 댕댕이자랑게시판 상세보기 본문 글부분 시작 -->
				<!-- <div style="text-align: Center; margin-top: 1em">
					<span
						style="font-family: 'Arial'; font-weight: 700; font-size: 1em; color: rgba(78, 78, 78, 1);">우리집
						댕댕이 포미에요~!! 너무너무 귀엽죠?</span>
				</div> -->
				<!-- 댕댕이자랑게시판 상세보기 본문 글부분 끝 -->

				<!-- <div
					style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
					<a href="#this" class="btn" id="list" style="width: 8em; height: 2em">목록</a>
				</div>

				<div
					style="text-align: center; position: relative; left: 1em; margin-top: 1em">
					<a href="#this" class="btn" id="update" style="width: 8em; height: 2em">수정</a>
				</div> -->
				
				<!-- <a href="#this" class="btn" id="list">목록</a>
				<a href="#this" class="btn" id="update">수정</a> -->
			</div>
				<a href="#this" class="btn" id="list">목록</a>
				<a href="#this" class="btn" id="update">저장</a>
				<a href="#this" class="btn" id="delete">삭제</a>
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
					comSubmit.setUrl("<c:url value='/myPetList' />");
					comSubmit.submit();
				}
				
				function fn_updateBoard(){
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/myPetWUpdate' />");
				
					comSubmit.submit();
				}
				
				function fn_deleteBoard(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myPetDelete' />");
					comSubmit.addParam("MYPET_NO", $("#MYPET_NO").val());
					comSubmit.submit();
				}
			</script>


<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>