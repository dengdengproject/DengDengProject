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
				<span style="font-weight: bold">Q&A 글쓰기</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">글제목</label> <label>[예약취소] 예약취소후
						환불은 언제쯤되나요?</label>
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="width: 90px">작성자</label> <label style="width: 90px">몽실이엄마</label>
					<label style="width: 90px; margin-left: 2em">비밀글</label>
				</div>

				<div>지난주 수요일에 펫시터 예약 및 결제 후 사정이 생겨서 취소했는데요. 카드취소는 언제쯤 되나요?</div>
				<div class="form-inline" style="margin-bottom: 2em; margin-top: 2em">
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
				<button style="width: 8em; height: 2em">수정</button>
			</div>

			<div
				style="text-align: center; position: relative; left: 1em; margin-top: 1em; margin-bottom: 1em;">
				<button style="width: 8em; height: 2em"
					; onclick="location.href='Q&A.html'">목록</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>