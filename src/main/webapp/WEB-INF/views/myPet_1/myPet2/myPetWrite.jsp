<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-board-menu.jspf"%>

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
					<label style="width: 90px">글제목</label> <input type="text"
						class="form-control" style="width: 400px"
						placeholder="글 제목을 입력하세요." />
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">작성자</label> <label style="width: 90px">관리자</label>
					<!-- <input type="text" class="form-control" style="width:200px" placeholder="작성자를 입력하세요." /> -->
				</div>
				<!-- <div id="summernote"></div> -->

				<div class="form-inline" style="margin-bottom: 10px">

					<div class="form-group">
						<label style="width: 90px">이미지파일</label>
					</div>
					<div id="image_add">
						<div class="form-group">
							<input type="file" placeholder="첨부파일을 선택하세요."
								style="width: 300px; position: relative; left: 10em; bottom: 1.5em" />
						</div>
					</div>
				</div>

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

				<div id="field"></div>

				<div
					style="text-align: center; position: relative; bottom: 3.6em; right: 1em">

					<button style="width: 7em" onclick="add_item()">이미지 추가</button>
				</div>
			</div>

			<div
				style="text-align: center; width: 8em; height: 2em; position: relative; right: 8em; top: 3em; margin-top: 1em; margin-bottom: 1em">
				<button style="width: 8em; height: 2em">등록</button>
			</div>

			<div
				style="text-align: center; width: 8em; height: 2em; position: relative; left: 1em; margin-top: 1em; margin-bottom: 1em">
				<button style="width: 8em; height: 2em"
					onclick="location.href='MyPetTSO.html'">취소</button>
			</div>
		</div>
	</div>
</div>

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