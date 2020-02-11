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

<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>

<div style="height: 400px; border-top: solid;">

	<div style="height: auto;">
		<div class="wrapper">
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">반려견 게시판</span>
			</div>
			<!-- <div class="navBar" style>
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
			</div> -->

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
					<c:forEach var="row" items="${mypetList }">
						<tr>
							<td class="idx" id="MYPET_NO">${row.MYPET_NO }</td>
							<td align="left" class="subject">
								<!-- <c:if test="${board.comment >= 10}"><img src="<%=request.getContextPath()%>/img/hit.jpg" /></c:if> -->
								<a href="#this" name="subject">${row.MYPET_SUBJECT }</a>
								<input type="hidden" id="MYPET_NO" value="${row.MYPET_NO }">
							</td>
							<td class="writer"><c:choose>
									<c:when test="${fn:length(list) > 0}">
										<strong>${row.MYPET_WRITER }</strong>
									</c:when>
									<c:otherwise>.</c:otherwise>
								</c:choose></td>
							<td class="hitcount">${row.MYPET_COUNT }</td>
							<td class="writeDate">${row.MYPET_DATE }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> 
			<!-- <input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" /> -->
			<a href="#this" class="btn" id="write">글작성</a>
			<div class="paging">${pagingHtml}</div>
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
					comSubmit.setUrl("<c:url value='myPetWritee' />")     //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}
				
				function fn_openBoardDetail(obj){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myPetDetail' />");
					comSubmit.addParam("MYPET_NO", obj.parent().find("#MYPET_NO").val());
					comSubmit.submit();
				}
				
				
				
			</script>
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>











<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>

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
	
			<div style="text-align: right; margin-top: 1em; margin-right: 5em">
				<span style="font-size: 1em;">전체글수:4</span>
			</div>
  			
  			<ul>
  			<c:choose>
						<c:when test="${fn:length(mypetList) > 0}">
							<c:forEach items="${mypetList}" var="row">

								<li><a href="#this" name="BOARD_STORED_FILE_NAME" class="list"> <img
										src="<%=cp%>resources/images/${row.BOARD_STORED_FILE_NAME}"
										alt="메인사진" /> <input type="hidden" id="MYPET_NO"
										value="${row.MYPET_NO}"> <input type="hidden"
										id="currentPage" value="${currentPage}"> <span
										class="detail">상세보기</span>
										<div class="explan">
											<p>
												<strong>제목</strong> : ${row.MYPET_SUBJECT}
											</p>
											<p>
												<strong>작성자</strong> : ${row.MYPET_WRITER}
											</p>
											<p>
												<strong>날짜</strong> :
												<c:set var="TextValue" value="${row.MYPET_DATE}" />
												${fn:substring(TextValue,0,10)}
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
  			
  			
  			
	   
			<!-- <div class="ttr_Services_html_row3 row" style="margin-top: 5em">
				<div class="post_column col-lg-3 col-md-6 col-sm-6 col-xs-12">
					<div class="ttr_Services_html_column30">
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image"
									style="float: none; display: block; text-align: center; overflow: hidden; margin: 0em 0em 1.43em 0em;"><span><img
										class="ttr_uniform" src="resources/images/ja6.jpg"
										style="width: 250px; height: 200px;" /></span></span><span
									style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(78, 78, 78, 1);">우리집
									댕댕이 포미에요~</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">포미주인</span>
							</p>
							<p
								style="margin: 0.71em 0em 0.36em 0em; text-align: Center; line-height: 1.76056338028169;">
								<span style="color: rgba(5, 38, 55, 1);">2020.01.02</span>&nbsp;&nbsp;&nbsp;<span>조회수:
									10</span>
							</p>
						</div>
						<div
							style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div> -->
			
			

			 <input type="button" value="글쓰기" id="write"
				style="width: 7em; height: 2em; margin-top: 3em; position: relative; left: 20em;"
				 />  
			<!-- <a href="#this" class="btn" id="write" style="width: 7em; height: 2em; margin-top: 3em; position: relative; left: 20em;">글작성</a> -->
		</div>
	</div>
		<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
		<script type="text/javascript">
			$(document).ready(function() {
				$("#write").on("click", function(e) { //글쓰기 버튼
					e.preventDefault();
					fn_openBoardWrite();
			});
				
				$("a[name='BOARD_STORED_FILE_NAME']").on("click", function(e) { // 사진 클릭시 디테일로 이동
					e.preventDefault();
					fn_openBoardDetail($(this));
				});
			});
			
			function fn_openBoardWrite() {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='myPetWritee' />");
				comSubmit.submit();
			}

			function fn_openBoardDetail(obj) {
				var comSubmit = new ComSubmit();
				comSubmit.setUrl("<c:url value='myPetDetail' />");
				comSubmit.addParam("MYPET_NO", obj.parent().find("#MYPET_NO").val());
				comSubmit.addParam("currentPage", "${currentPage}");
				comSubmit.submit();
			}
		</script>
 </div>  --%>


<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

