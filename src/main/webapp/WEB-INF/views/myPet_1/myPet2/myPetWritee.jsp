<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<span style="font-weight: bold">댕댕이자랑 글쓰기</span>
				<hr />
			
				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">글제목</label> <input type="text" id="MYPET_SUBJECT" name="MYPET_SUBJECT"
						class="form-control" style="width: 400px"
						placeholder="글 제목을 입력하세요." />
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px"><input type="hidden" id="MYPET_WRITER" name="MYPET_WRITER">작성자</label> <label style="width: 90px">${MYPET_WRITER }</label>
					<!-- <input type="text" class="form-control" style="width:200px" placeholder="작성자를 입력하세요." /> -->
				</div>
				<!-- <div id="summernote"></div> -->
				<div><textarea rows="20" cols="100" title="내용" id="MYPET_CONTENT" name="MYPET_CONTENT"></textarea></div>

				<<!-- div class="form-inline" style="margin-bottom: 10px">

					<div class="form-group">
						<label style="width: 90px">이미지파일</label>
					</div>
					<div id="image_add">
						<div class="form-group">
							<input type="file" placeholder="첨부파일을 선택하세요."
								style="width: 300px; position: relative; left: 10em; bottom: 1.5em" name="file" />
						</div>
					</div>
				</div>
 -->
				<!-- <div id="image_add">
			<div
				style="text-align: center; position: relative; right: 9em; bottom: 2.5em;">
				<input type="text" placeholder="댕댕이 이미지" style="width: 10em"></input>
			</div>


			<div style="text-align: center; position: relative; bottom: 4.7em;">

				<label
					style="outline: none; background: #337AB7; color: white; width: 5.5em; height: 2em; line-height: 190%; border-radius: 10px;">

					파일등록<input type="file" style="display: none; position: relative;">
				</label>

			</div>
		</div> -->

				<!-- <div id="field"></div>

				<div
					style="text-align: center; position: relative; bottom: 3.6em; right: 1em">

					<button style="width: 7em" onclick="add_item()">이미지 추가</button>
				</div> -->
			</div>

			<div
				style="text-align: center; width: 8em; height: 2em; position: relative; right: 8em; top: 3em; margin-top: 1em; margin-bottom: 1em">
				<a href="#this" id="write" style="width: 8em; height: 2em">등록</a>
			</div>

			<div
				style="text-align: center; width: 8em; height: 2em; position: relative; left: 1em; margin-top: 1em; margin-bottom: 1em">
				<a href="#this" id="list" style="width: 8em; height: 2em"
					>취소</a>
			</div>
		</div>
	</div>
</div>
</form>

			<%@ include file="/WEB-INF/views/include/include-body.jspf" %> <!-- 이 위치가 맞나? 11:08. 01/31 -->
			<script type="text/javascript">
				$(document).ready(function(){
					$("#list").on("click", function(e){ //취소하고 리스트로 가는 버튼
						e.preventDefault();
						fn_openBoardList();
					});
					
					$("#write").on("click", function(e){
						e.preventDefault();
						fn_insertBoard();
					});
					
				});
				
				function fn_openBoardList(){
					var comSubmit = new ComSubmit();
					comSubmit.setUrl("<c:url value='/myPetList' />");
					comSubmit.submit();
				}
				
				function fn_insertBoard(){
					var comSubmit = new ComSubmit("frm");
					comSubmit.setUrl("<c:url value='/myPetInsert' />");
					comSubmit.submit();
				}
			</script>
			
			<script type="text/javascript">
				//댕댕이 자랑 이미지 추가
				function add_item() {
					// pre_set 에 있는 내용을 읽어와서 처리..
					var div = document.createElement('div');
					div.innerHTML = document.getElementById('image_add').innerHTML;
					document.getElementById('field').appendChild(div);
				}
			</script>

<%-- <%@ include file="/WEB-INF/views/include/include-footer.jspf"%> --%>

</html> 