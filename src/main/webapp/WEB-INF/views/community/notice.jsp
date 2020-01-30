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
				<span style="font-weight: bold; font-size: 2em;">공지사항</span>
			</div>
			<div class="navBar" style>
				<form action="list.do" method="get">
					<select id="type" name="type"
						style="width: 5em; position: relative; right: 10em;">
						<option value="subject">제목</option>
						<option value="content">내용</option>
						<option value="writer">작성자</option>
					</select> <input type="text" id="keyword" name="keyword" value=""
						style="width: 20em; position: relative; right: 10em;"> <input
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
					<c:forEach var="board" items="${boardList }">
						<tr>
							<td class="idx">1</td>
							<td align="left" class="subject">
								<!-- <c:if test="${board.comment >= 10}"><img src="<%=request.getContextPath()%>/img/hit.jpg" /></c:if> -->
								<a href="view.do?idx=${board.idx}">글제목입니다</a>
							</td>
							<td class="writer"><c:choose>
									<c:when test="${board.writerId == userId}">
										<strong>김지영</strong>
									</c:when>
									<c:otherwise>.</c:otherwise>
								</c:choose></td>
							<td class="hitcount">25</td>
							<td class="writeDate">2020.01.01</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> <input type="button" value="목록"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 2em;" />
			<input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" />
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>