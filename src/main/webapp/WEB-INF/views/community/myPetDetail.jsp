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
				<span style="font-weight: bold">댕댕이 자랑 게시판</span>
				<hr />

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">글제목</label> 우리집 댕댕이
					포미에요~
				</div>

				<div class="form-inline" style="margin-bottom: 1em">
					<label style="font-weight: bold; width: 90px">작성자</label> 포미주인 <label
						style="width: 90px; position: relative; left: 5em">조회수</label> <span
						style="position: relative; left: 5em">52</span> <label
						style="width: 90px; position: relative; left: 10em">등록일</label> <span
						style="position: relative; left: 10em">2020/01/01</span>
				</div>

				<!-- 댕댕이자랑게시판 상세보기 이미지 부분 시작 -->
				<div class="ttr_Services_html_row3 row" style="margin-top: 5em">
					<div class="html_content" style="text-align: center">
						<span class="ttr_image"
							style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
								<img class="ttr_uniform" src="images/ja6.jpg"
								style="width: 250px; height: 200px;" />
						</span></span>

						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
						<p style="text-align: Center;">
							<span class="ttr_image"
								style="display: block; overflow: hidden; margin: 0em 1em 1.43em 1em; float: left"><span>
									<img class="ttr_uniform" src="images/ja6.jpg"
									style="width: 250px; height: 200px;" />
							</span></span>
					</div>
				</div>
				<!-- 댕댕이자랑게시판 상세보기 이미지 부분 끝 -->

				<!-- 댕댕이자랑게시판 상세보기 본문 글부분 시작 -->
				<div style="text-align: Center; margin-top: 1em">
					<span
						style="font-family: 'Arial'; font-weight: 700; font-size: 1em; color: rgba(78, 78, 78, 1);">우리집
						댕댕이 포미에요~!! 너무너무 귀엽죠?</span>
				</div>
				<!-- 댕댕이자랑게시판 상세보기 본문 글부분 끝 -->

				<div
					style="text-align: center; position: relative; right: 8em; top: 3em; margin-top: 1em">
					<button style="width: 8em; height: 2em">수정</button>
				</div>

				<div
					style="text-align: center; position: relative; left: 1em; margin-top: 1em">
					<button style="width: 8em; height: 2em">목록</button>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>