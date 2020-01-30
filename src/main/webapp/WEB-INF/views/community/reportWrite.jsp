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
		<div align="center" class="container">
			<div align="left"
				style="width: 1200px; border: 1px solid #cccccc; padding: 2em; padding-left: 2em; padding-right: 5em; margin-top: 20px; margin-bottom: 1em; background-color: #ffffff">
				<span style="font-weight: bold">신고하기 글쓰기</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">글제목</label> <label><select
						id="type" name="type" style="width: 7em">
							<option value="option">말머리선택</option>
							<option value="petsitter">펫시터</option>
							<option value="petowner">펫주인</option>

					</select></label> <input type="text" class="form-control" style="width: 400px"
						placeholder="글 제목을 입력하세요." />
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">작성자</label> <label style="width: 90px">몽실이엄마</label>
					<label style="width: 90px; margin-left: 3em">비밀번호</label> <input
						type="password" class="form-control" style="width: 150px" />
					<!-- <input type="text" class="form-control" style="width:200px" placeholder="작성자를 입력하세요." /> -->
					<label style="margin-left: 3em"><input type="checkbox"
						name="secret" value="secret">비밀글</label>
				</div>
				<div id="summernote"></div>

				<div class="form-inline" style="margin-bottom: 10px">
					<div class="form-group">
						<label style="width: 90px">첨부파일</label>
					</div>
					<div class="form-group">
						<input type="file" placeholder="첨부파일을 선택하세요."
							style="width: 400px; position: relative; left: 1em" />
					</div>
				</div>
			</div>

			<div
				style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em; margin-bottom: 1em;">
				<button style="width: 8em; height: 2em">등록</button>
			</div>

			<div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em; margin-bottom: 1em;">
				<button style="width: 8em; height: 2em"
					onclick="location.href='Report.html'">취소</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>