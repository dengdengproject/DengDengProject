

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	<!-- <div style="text-align: center; margin-top: 4em;">
  			<span style=" font-weight: bold; font-size: 2em;">공지사항</span>
  		</div> -->

	<div style="height: 600px;">
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">게시판</span>
				<hr />
				
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 50px">글번호</label> ${map.BOARD_NO }
					<label style="font-weight: bold; width: 90px">말머리</label> ${map.MYPET_HEADER }
					<label class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> ${map.MYPET_SUBJECT }
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> ${map.MYPET_WRITER } 
					<label style="width: 90px; position: relative; left: 5em">조회수</label>
					<span style="position: relative; left: 5em">${map.MYPET_COUNT }</span>
					<label style="width: 90px; position: relative; left: 10em">등록일</label>
					<span style="position: relative; left: 10em">${map.MYPET_DATE }</span>
				</div>
				
				
				<div class="form-inline"  style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">내용</label>										
					<%-- <img width="200" height="200" src="<%=cp%>/resources/images/board/${list.get(0).BOARD_STORED_FILE_NAME}" /> --%>
					<!-- c:forEach 로 뽑아내기 -->
		
					<c:forEach var="imgs" items="${list }">
						<img width="200" height="200" src="<%=cp%>/resources/images/board/${imgs.BOARD_STORED_FILE_NAME}"  />
					</c:forEach>
					<p>
						 ${map.MYPET_CONTENT}
					</p>
					
					
					 <%-- <img src="<%=cp%>/resources/images/board/${list.get(0).BOARD_STORED_FILE_NAME}" title="클릭하시면 원본크기로 보실 수 있습니다." style="cursor: pointer;" onclick="doImgPop('<%=cp%>/resources/images/board/${list.get(0).BOARD_STORED_FILE_NAME}')" />   --%>
				</div>
				<%-- <div>${map.NOTICE_CONTENT }</div> --%>
				
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<c:forEach var="row" items="${list }">
							<input type="hidden" id="BOARD_NO" value="${row.BOARD_NO }">
							<input type="hidden" id="BOARD_FILE_NO" value="${row.BOARD_FILE_NO }">
							<a href="#this" name="file">${row.BOARD_ORIGINAL_FILE_NAME } </a>
							(${row.BOARD_FILE_SIZE }kb)
						</c:forEach>
					</td>
				</tr>
				
				
				
				<!-- <div class="form-inline" style="margin-bottom: 10px">
					<div class="form-group">
						<label style="width: 90px">첨부파일</label>
					</div>
					<div class="form-group">
						<input type="file" placeholder="첨부파일을 선택하세요."
							style="width: 400px; position: relative; left: 1em" />
					</div>
				</div>  -->
			</div>
			


			<!-- <div 이거대로 나중에 버튼 고치기
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
				<button style="width: 8em; height: 2em">수정</button>
			</div> -->
			
			<a href="#this" class="btn" id="list">목록</a>
			<c:if test="${ID == map.ID || ADMIN_ID != null}">
			<a href="#this" class="btn" id="update">수정</a>
			</c:if>
			<!-- <div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em">
				<button style="width: 8em; height: 2em">목록</button>
			</div> -->
			
			<form id="frm" >
				<table  id="comment_table">
					<colgroup>
						<col width="10%" />
						<col width="15%" />
						<col width="15%" />
						<col width="*" />
						<col width="10%" />
					</colgroup>
					<caption></caption>
					<thead>
						<tr height="80px">
							<th scope="row">작성자</th>
								<td>${ID}      <%-- ${ID} --%>
									 <input type="hidden" name="ID" id="ID" value="${ID }" />
								</td> 
							 
							 
							<th rowspan="2" align="center"><p align="right" class="pr">댓글쓰기</p></th>
								<td rowspan="2"><textarea title="MYPET_COMMENT_CONTENT"
									id="MYPET_COMMENT_CONTENT" name="MYPET_COMMENT_CONTENT" cols="100"
									rows="2" ></textarea>
								</td>
								<td rowspan="2" align="center">
									<a href="#this" id="comment"><strong>댓글쓰기</strong></a>
								</td>
							
						</tr>
					   
						<tr height="80px"></tr>

						<tr>
							<th align="center">No.</th>
							<th align="center">Writer</th>
							<th align="center">Date</th>
							<th colspan="2" align="center">Comment</th>
						</tr>
					</thead>

					<tbody>
						<c:choose>
							<c:when test="${fn:length(cmtList) > 0}">
								<c:forEach items="${cmtList }" var="rows">
									<tr>
										<td>${rows.MYPET_COMMENT_NO }</td>
										<td>${rows.ID}
											</td>
										<td>${rows.MYPET_COMMENT_DATE }</td>
										<td>${rows.MYPET_COMMENT_CONTENT }</td>
										<td>
										<%-- <c:if test = "${ID == ID}" > --%>
											<div>
												<c:if test="${ID == rows.ID || ADMIN_ID != null}"> 
													<a href="mypetCommentDelete?seq=${rows.MYPET_COMMENT_NO}&&sed=${map.BOARD_NO}"  id="deleteComment" 
														name="deleteComment" 
														id="deleteComment" >삭제</a>
											    </c:if> 
												
												<input type="hidden" id="MYPET_COMMENT_NO"
													value="${rows.MYPET_COMMENT_NO }" />
											
											</div>
											<%-- </c:if> --%>
										</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" align="center">댓글이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</form>
			
			
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
				
				
					$("#comment").on("click", function(e) { // 댓글쓰기
					  e.preventDefault();
					  fn_insertComment();
				});
					/* $("a[name='deleteComment']").on("click", function(e){   //댓글 삭제
						e.preventDefault();
						fn_deleteComment($(this));
					}); */
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/mypetList' />");
					comSubmit.submit();
				}
				
				function fn_openBoardUpdate(){
					var idx = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/mypetUpdateForm' />");
					comSubmit.addParam("BOARD_NO", idx);
					comSubmit.submit();
				}
				
				function fn_insertComment() {
					var BOARD_NO = "${map.BOARD_NO}";
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/mypetInsert'/>");
					comSubmit.addParam("MYPET_COMMENT_WRITER", '${ID==ID}');
					comSubmit.addParam("BOARD_NO", BOARD_NO);
					comSubmit.submit();
				}
				
				 /* function fn_deleteComment(){
					var BOARD_NO = "${map.BOARD_NO}";
			    	var comSubmit = new ComSubmit("frm");
			        comSubmit.setUrl("<c:url value='/mypetCommentDelete'/>");
			        comSubmit.addParam("MYPET_COMMENT_NO",$("#MYPET_COMMENT_NO").val()); 
			        
			        comSubmit.addParam("BOARD_NO", BOARD_NO); 
			         
			        comSubmit.submit();
			     } */ 
				
				/* function fn_deleteComment(){
					var MYPET_COMMENT_NO = "${rows.MYPET_COMMENT_NO}";
			    	var comSubmit = new ComSubmit("frm");
			        comSubmit.setUrl("<c:url value='/mypetCommentDelete'/>");
			        comSubmit.addParam("MYPET_COMMENT_NO",$("#MYPET_COMMENT_NO").val()); 
			        comSubmit.addParam("MYPET_COMMENT_NO", MYPET_COMMENT_NO);
			        //comSubmit.addParam("BOARD_NO", BOARD_NO); 
			         
			        comSubmit.submit();
			     } */
			</script>
			
		</div>
	</div>
</div>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html>