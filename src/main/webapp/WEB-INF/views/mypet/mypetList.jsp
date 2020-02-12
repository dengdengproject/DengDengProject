<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

<style>
	li{float:left;}
	li{list-style:none;}
</style>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>
<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>
<div style="height: 400px; border-top: solid;">
	<div style="height: 1000px;">
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">댕댕이 자랑 게시판</span>
		</div>

		<!-- <div style="text-align: right; margin-top: 1em; margin-right: 5em">
			<span style="font-size: 1em;">전체글수:4</span>
		</div> -->
		
	  
		<ul>
					<c:choose>
						<c:when test="${fn:length(mypetList) > 0}">
							<c:forEach items="${mypetList}" var="row">

								<li id="qwer"><a href="#this" name="subject" class="list"> <img width="200" height="265"
										src="<%=cp%>/resources/images/board/${row.BOARD_STORED_FILE_NAME}"
										 /> <input type="hidden" id="BOARD_NO"
										value="${row.BOARD_NO}"> <input type="hidden"
										id="currentPage" value="${currentPage}"> <!-- <span
										class="detail">상세보기</span> -->
										<div class="explan">
											<p>
												<strong>제목</strong> : ${row.MYPET_SUBJECT}
											</p>
											<p>
												<strong>작성자</strong> : ${row.MYPET_WRITER}
											</p>
											
										</div>
								</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
					조회된 결과가 없습니다.
				</c:otherwise>
					</c:choose>
				</ul>
		
		
			
			<div id="asdf">
				<a href="#this" class="btn" id="write">글작성</a>
				<div class="paging">${pagingHtml}</div>
			</div>
			<form id="commonForm" name="common"></form>
			
			<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
			<script type="text/javascript">
				$(document).ready(function(e){
				  $("#write").on("click", function(e){ //글작성 버튼 누르면 글작성 폼으로 넘어감
					  e.preventDefault();
					  fn_openBoardWrite();  
				    });
					
				
				
				  $("a[name='subject']").on("click", function(e){  //제목 클릭시 상세보기
					e.preventDefault();
					fn_openBoardDetail($(this));
				  });
				});
				
				function fn_openBoardWrite(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/mypetWriteForm' />")     //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}
				
				function fn_openBoardDetail(obj){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/mypetDetail' />");
					comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
/* 					comSubmit.addParam("QNA_PASSWORD", obj.parent().find("#QNA_PASSWORD").val()); */
 					comSubmit.addParam("currentPage", "${currentPage}");
					comSubmit.submit();
				}
				
				
				
			</script>

			
		
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
 --%>
</html>