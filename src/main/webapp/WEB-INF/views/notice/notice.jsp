<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<!-- 잠시 테스트 -->
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>


<%-- <%@ include file="/WEB-INF/views/include/include-header-menu-admin.jspf"%>  --%>

<%@ include file="/WEB-INF/views/include/include-header-add.jspf" %>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

<div  class="tab-box">
				<ul>

					<li  class="selected" onclick="location.href = '/first/noticeList'">공지사항</li>

					<li onclick="location.href = '/first/qnaList'">Q&A</li>

					<li onclick="location.href = '/first/reportList'">신고하기</li>

					<li onclick="location.href = '/first/mypetList'">댕댕이 자랑</li>



				</ul>
		</div>
	</div>
</nav>


<div style="height: 400px; border-top: solid;">

	<div style="height: auto;">
		<div class="wrapper">
		     <div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">공지사항</span>
			</div>
			
			<!-- search -->
			 <div class="navBar" >
				<form id="frm">
					<select id="type" name="searchNum"
						style="width: 5em; position: relative; right: 10em;">
						<option value="${NOTICE_SUBJECT}">제목</option>
						<option value="${NOTICE_CONTENT }">내용</option>
					</select> <input type="text" id="isSearch" name="isSearch" 
						style="width: 20em; position: relative; right: 10em;"> <input
						type="submit" value="검색"
						style="width: 3em; position: relative; right: 10em;" />
				</form>
			</div>  
			
			<!-- <form>
									<select name="searchNum">
										<option value="0">제목</option>
										<option value="1">내용</option>
									</select> <input type="text" name="isSearch" size="30" />
									<button type="submit" class="btn btn-default">
										<i class="fa fa-search"></i>
									</button>
								</form> -->
			
		<!-- 	<div class="navBar" style>
				<form action="noticeList" method="get">
					<select id="type" name="type"
						style="width: 5em; position: relative; right: 10em;">
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select> <input type="text" id="keyword" name="keyword" 
						style="width: 20em; position: relative; right: 10em;"> <input
						type="submit" value="검색"
						style="width: 3em; position: relative; right: 10em;" />
				</form>
			</div>  -->
			
			<!-- <div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">공지사항</span>
			</div> -->
			<!-- <div class="search_form">
			<form>
				<div class="inner">
					<select class="slct w100" name="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>
					<input class="txt w100" type="text" name="isSearch" />
					<span class="btn btnC_04 btnP_04">
						<input type="submit" value="검색" />
					</span>
				</div>
			</form>	
		</div> -->
		
							<!-- <form id="bbsFrm" name="bbsFrm" action="/noticeList" method="GET">
						<input type="hidden" id="currentPage" name="currentPage">
					
						<div class="noticeSearch" align="right">
								<select class="btn" name="searchNum" id="searchNum">
									<option value="1">제목</option>
									<option value="2">내용</option>
								</select>
							<input class="ipt4 w220" type="text" name="isSearch" id="isSearch" />
							<input class="ipt3" type="submit" value="검색" />
						</div>
					
					<div>
</div></form>  -->

			<table border="0.2" class="boardTable" style="margin-top: 1em">
				<thead>
					<tr class="table_head">
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="row" items="${noList }">
						<tr>
							<td class="idx" id="BOARD_NO">${row.BOARD_NO }</td>
							<td align="left" class="subject">
								<!-- <c:if test="${board.comment >= 10}"><img src="<%=request.getContextPath()%>/img/hit.jpg" /></c:if> -->
								<a href="#this" name="subject">${row.NOTICE_SUBJECT }</a>
								<input type="hidden" id="BOARD_NO" value="${row.BOARD_NO }">
							</td>
							<td class="writer"><%--  <c:choose> 
									 <c:when test="${fn:length(list) > 0}">  --%>
										<strong>${row.NOTICE_WRITER }</strong>
									 <%-- </c:when> 
									 <c:otherwise>.</c:otherwise>
								</c:choose> --%> </td>
							<td class="hitcount">${row.NOTICE_COUNT }</td>
							<td class="writeDate">${row.NOTICE_DATE }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br /> 
			<!-- <input type="button" value="쓰기"
				style="width: 7em; position: relative; left: 30em; margin-bottom: 1em; margin-right: 5em;"
				onclick="location.href='NoticeWrite.html'" /> -->
			  <c:if test="${ADMIN_ID != null}">  
				<a href="#this" class="btn" id="write">글작성</a>
			  </c:if>  
			
			<!-- <div class="search_form">
			<form>
				<div class="inner">
					<select class="slct w100" name="searchNum">
						<option value="0">제목</option>
						<option value="1">내용</option>
					</select>
					<input class="txt w100" type="text" name="isSearch" />
					<span class="btn btnC_04 btnP_04">
						<input type="submit" value="검색" />
					</span>
				</div>
			</form>	
		</div> -->
		
		<div class="paging">${pagingHtml}</div>
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
					comSubmit.setUrl("<c:url value='/noticeWrite' />")     //이거 글작성으로 넘어가는거 위에랑 연결된다. 
					comSubmit.submit();
				}
				
				function fn_openBoardDetail(obj){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/noticeDetail' />");
					comSubmit.addParam("BOARD_NO", obj.parent().find("#BOARD_NO").val());
					comSubmit.addParam("currentPage", "${currentPage}");
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

</html>