<!-- 20.02.12 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>



<div  class="tab-box">
				<ul>

					<li  onclick="location.href = '/first/noticeList'">공지사항</li>

					<li onclick="location.href = '/first/qnaList'">Q&A</li>

					<li  class="selected" onclick="location.href = '/first/reportList'">신고하기</li>

					<li onclick="location.href = '/first/mypetList'">댕댕이 자랑</li>



				</ul>
		</div>
	</div>
</nav>




<div style="height: 400px; border-top: solid;">
	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">신고하기</span>
			</div>
			
			
			
			<div align="center">
			<table border="0.2" class="reportTable" style="margin-top: 1em">
				<thead>
					<tr class="table_head">
						<th style="width: 8em">글번호</th>
						<th style="width: 40em">제목</th>
						<th style="width: 10em">작성자</th>
						<th style="width: 5em">조회수</th>
						<th style="width: 8em">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${reportList }">
						<tr>
							<td style="text-align: center" class="BOARD_NO" id="BOARD_NO">${row.BOARD_NO }</td>
							
                       				
                       		
							<td align="left" class="subject" style="text-align: left">
							<img src="resources/images/secret_icon.png" style="width: 1.5em">
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
							<td style="text-align: center" class="writer" id="writer">${row.REPORT_WRITER }</td>
							<td style="text-align: center" class="hitcount">${row.REPORT_COUNT }</td>
							<td style="text-align: center" class="writeDate">${row.REPORT_DATE }</td>
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
			
			<form>
			 	<div class="navBar">
					<div style="width: 100px">
						<select id="type" name="searchNum" style="width: 5em; position: relative; right: 32em;" >
							<option value="0">제목</option>
							<option value="1">작성자</option>
							<option value="2">내용</option>
						</select>
						<div></div>
					</div>
					<input type="text" name="isSearch" style="width: 20em; position: relative; right: 17em; bottom: 2.5em;">
					<input type="submit" value="검색" class="keyword"  style="position: relative; bottom: 2.5em; right: 17em">
				</div>
			</form> 
			
			
			</div>
			<br /> 
			
			<!-- <input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" /> -->
			<c:if test = "${ID != null || ADMIN_ID != null}">
				<a href="#this" class="write" id="write">글작성</a>
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


<style>
.reportTable {
	border-color: #F1F1F3;
}

.table_head {
	background-color: #F4F4F4;
}

th {
	text-align: center;
}

th, td {
	border-bottom: 1px solid #F1F1F3;
	padding: 10px;
}

.keyword {
	background-color: #649EE1;
	color: white;
	width: 3.5em;
	border-radius: 5px;
	height: 2.5em;
}

.write {
	position: relative;
	bottom: 6.4em;
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
}

.write:hover{

	background-color: #205EA2;
}

.write:active {
	transform: translateY(1px);
}

.board_num {
	position: relative;
	right: 32em;
	font-size: 1em;
	font-weight: bold;
}
</style>


<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</body>
</html>