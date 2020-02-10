<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- 잠시 테스트 -->
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<%-- <%@ include file="/WEB-INF/views/include/include-header-add.jspf" %> --%>

<div style="height: 400px; border-top: solid;">
	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">Q&A</span>
			</div>
			<div class="navBar" style>
				<form action="list.do" method="get">
					<select id="type" name="type"
						style="width: 5em; position: relative; right: 10em;">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select> 
					<input type="text" id="keyword" name="keyword" value=""
						style="width: 20em; position: relative; right: 10em;"> 
					<input
						type="submit" value="검색"
						style="width: 3em; position: relative; right: 10em;" />
				</form>
			</div>

			<table border="0.2" class="boardTable" style="margin-top: 1em">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${qnaList }">
							<td class="rowNum" id="BOARD_NO">${row.BOARD_NO }</td>
							<td align="left" class="subject">
								<c:if test="${row.QNA_RE_STEP > 0}">
										&nbsp;&nbsp;  <!-- 답변글일 경우 글 제목 앞에 공백을 준다. -->
									<a href="#this" name="subject">&rarrhk;&nbsp;[답변] ${row.QNA_SUBJECT }</a>
								</c:if>
								<%-- <c:if test="${board.comment >= 10}"><img src="<%=request.getContextPath()%>/img/hit.jpg" /></c:if> --%>
						 		<c:if test="${row.QNA_RE_STEP == 0 }">
						 			<a href="#this" name="subject">${row.QNA_SUBJECT }</a>
						 		</c:if>
								<input type="hidden" id="BOARD_NO" value="${row.BOARD_NO }">
								<input type="hidden" id="BOARD_TYPE" value="${row.BOARD_TYPE }">
							</td>
							<td class="writer" id=writer">${row.QNA_WRITER }</td>
								<%-- <c:choose>
									<c:when test="${fn:length(list) > 0}">
										<strong>${row.QNA_WRITER }</strong>
									</c:when>
									<c:otherwise>.</c:otherwise> 
								</c:choose>
							</td> --%>
							<td class="hitcount">${row.QNA_COUNT }</td>
							<td class="writeDate">${row.QNA_DATE }</td>
							
						</tr>
					</c:forEach>
					
					<!--  등록된 게시글이 없을때 -->
					<c:if test="${fn:length(qnaList) le 0}"> <!-- qnaList가 0보다 작거나 같으면 -->
						<tr>
							<td colspan="11" style="text-align: center;">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<br /> 
			<!-- <input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" /> -->
			<c:if test = "${ID != null }">
				<a href="#this" class="btn" id="write">글작성</a>
			</c:if>
            
			<div class="paging">${pagingHtml}</div>
			
			
			<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
			<script type="text/javascript">
				$(document).ready(function(e){
				  $("#write").on("click", function(e){ 		//글작성 
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
					comSubmit.setUrl("<c:url value='/qnaWriteForm' />")    //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}
				
				function fn_openBoardDetail(obj){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaDetail' />");
					comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
					comSubmit.submit();
				}
				
			</script>
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>