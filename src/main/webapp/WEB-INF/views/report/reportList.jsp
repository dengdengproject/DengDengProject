<!-- 20.02.12 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<div style="height: 400px; border-top: solid;">
	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">신고하기</span>
			</div>
			
			<form>
			 	<div class="navBar">
					<div style="width: 100px">
						<select id="type" name="searchNum" >
							<option value="0">제목</option>
							<option value="1">작성자</option>
							<option value="2">내용</option>
						</select>
						<div></div>
					</div>
					<input type="text" name="isSearch" placeholder="제목,작성자, 또는 내용을 입력해주세요">
					<input type="submit" value="검색">
				</div>
			</form> 
			
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
					<c:forEach var="row" items="${reportList }">
						<tr>
							<td class="BOARD_NO" id="BOARD_NO">${row.BOARD_NO }</td>
							<td align="left" class="secret">
								<c:if test="${row.REPORT_PRIVATE_CHECK=='Y'}">
                       				<img src="/DengDengTelling/resources/images/icon_secret.jpg">
                       			</c:if>
                       		</td>
							<td align="left" class="subject">
								<c:if test="${row.REPORT_RE_STEP == 0 }">
						 			<a href="#this" name="subject">${row.REPORT_SUBJECT }</a>
						 		</c:if>
								<c:if test="${row.REPORT_RE_STEP > 0}">
										&nbsp;&nbsp;  <!-- 답변글일 경우 글 제목 앞에 공백을 준다. -->
									<a href="#this" name="subject">&rarrhk;&nbsp;[답변] ${row.REPORT_SUBJECT }</a>
								</c:if>
								<input type="hidden" id="BOARD_NO" name="BOARD_NO" value="${row.BOARD_NO }">
								<input type="hidden" id="ID" name="ID" value="${row.ID }">
							</td>
							<td class="writer" id=writer">${row.REPORT_WRITER }</td>
							<td class="hitcount">${row.REPORT_COUNT }</td>
							<td class="writeDate">${row.REPORTDATE }</td>
						</tr>
					</c:forEach>
					<!--  등록된 게시글이 없을때 -->
					<c:if test="${fn:length(reportList) le 0}"> <!-- reportList가 0보다 작거나 같으면 -->
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
			<c:if test = "${ID != null || ADMIN_ID != null}">
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
					comSubmit.setUrl("<c:url value='/reportWriteForm' />")    //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}
				
				function fn_openBoardDetail(obj){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/reportDetail' />")
					comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
					comSubmit.submit();
				}
				  
			</script>
			
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</body>
</html>