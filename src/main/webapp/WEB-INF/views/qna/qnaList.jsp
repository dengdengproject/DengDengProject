<!-- 20.02.11 -->
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

					<li onclick="location.href = '/first/noticeList'">공지사항</li>

					<li class="selected" onclick="location.href = '/first/qnaList'">Q&A</li>

					<li onclick="location.href = '/first/qnaList'">신고하기</li>

					<li onclick="location.href = '/first/mypetList'">댕댕이 자랑</li>



				</ul>
		</div>
	</div>
</nav>

<div style="height: 600px; border-top: solid;">
	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">Q&A</span>
			</div>


			<div align="center">
				<div>
					<div>
						<span class="board_num">전체</span> <span class="board_num"
							style="color: #649EE1">0</span>
						<!-- 여기에 수식 추가해야함 -->
						<span class="board_num">건</span>
					</div>
					<table border="0.2" class="qnaTable" style="margin-top: 1em;">
						<thead>
							<tr class="table_head" style="">
								<th style="width: 8em">번호</th>
								<th style="width: 40em">제목</th>
								<th style="width: 10em">글쓴이</th>
								<th style="width: 5em">조회수</th>
								<th style="width: 8em">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${qnaList }">
								<tr>
									<td style="text-align: center" class="BOARD_NO" id="BOARD_NO">${row.BOARD_NO }</td>

									<td align="left" class="subject"><c:if
											test="${row.QNA_PRIVATE_CHECK=='Y'}">
											<img style="width: 1.5em"
												src="resources/images/secret_icon.png">
										</c:if>
										<c:if
											test="${row.QNA_PRIVATE_CHECK=='N'}">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
										</c:if>
										 <c:if test="${row.QNA_RE_STEP == 0 }">
											<a href="#this" name="subject">${row.QNA_SUBJECT }</a>
										</c:if> <c:if test="${row.QNA_RE_STEP > 0}">
										&nbsp;&nbsp;  <!-- 답변글일 경우 글 제목 앞에 공백을 준다. -->
											<a href="#this" name="subject">&rarrhk;&nbsp;[답변]
												${row.QNA_SUBJECT }</a>
										</c:if> <input type="hidden" id="BOARD_NO" name="BOARD_NO"
										value="${row.BOARD_NO }"> <input type="hidden" id="ID"
										name="ID" value="${row.ID }"> <input type="hidden"
										id="QNA_PRIVATE_CHECK" name="QNA_PRIVATE_CHECK"
										value="${row.QNA_PRIVATE_CHECK }"></td>


									<td style="text-align: center" class="writer" id=writer">${row.QNA_WRITER }</td>
									<td style="text-align: center" class="hitcount">${row.QNA_COUNT }</td>
									<td style="text-align: center" class="writeDate">${row.QNA_DATE }</td>
								</tr>
							</c:forEach>
							<!--  등록된 게시글이 없을때 -->
							<c:if test="${fn:length(qnaList) le 0}">
								<!-- qnaList가 0보다 작거나 같으면 -->
								<tr>
									<td colspan="11" style="text-align: center;">등록된 게시글이
										없습니다.</td>
								</tr>
							</c:if>


							<c:if test="${fn:length(qnaList) le 0}">
								<!-- qnaList가 0보다 작거나 같으면 -->
								<tr>
									<td colspan="11" style="text-align: center;">등록된 게시글이
										없습니다.</td>
								</tr>
							</c:if>

						</tbody>
					</table>

					<div class="navBar">
						<form action="list.do" method="get">
							<select id="type" name="type"
								style="width: 5em; position: relative; right: 20em;">
								<option value="subject">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
							</select> <input type="text" id="keyword" name="keyword" value=""
								style="width: 20em; position: relative; right: 20em;" /> <input
								type="submit" value="검색" class="keyword"
								style="position: relative; right: 19.5em; bottom: 0.1em" />
						</form>
					</div>
				</div>

			</div>
			<br />

			<!-- <input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" /> -->
			<c:if test="${ID != null || ADMIN_ID != null}">
				<a href="#this" class="write" id="write" style="color: white">글작성</a>

			</c:if>

			<div class="paging">${pagingHtml}</div>


			<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
			<script type="text/javascript">
				$(document).ready(function(e) {
					$("#write").on("click", function(e) { //글작성 
						e.preventDefault();
						fn_openBoardWrite();
					});

					$("a[name='subject']").on("click", function(e) { //제목 클릭시 상세보기
						e.preventDefault();
						fn_openBoardDetail($(this));
					});
				});

				function fn_openBoardWrite() {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaWriteForm' />") //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}

				function fn_openBoardDetail(obj) {
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/qnaDetail' />")
					comSubmit.addParam("BOARD_NO", obj.parent().find(
							"#BOARD_NO").val());
					comSubmit.submit();
				}
			</script>

		</div>
	</div>
</div>




<style>
.qnaTable {
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
	bottom: 3.9em;
	left: 32em;
	background-color: #649EE1;
	color: white;
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

 <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> 

</body>
</html>