<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%
 String pageChoice=request.getParameter("num");

%>




<!-- 버튼 클릭시,
일반 회원 가입 버튼이면 다음 페이지에 [1]깂을 전송
펫시터 회원 가입 버튼이면 다음페이지에 [2]값을 전송
다음페이지에서 받는 값에 따라 일반페이지로 갈지, 펫시터 페이지로 갈지 나눠짐 -->






<!--  첫번째 아이템 -->
<div id="ttr_page" class="container">
	<div id="ttr_content_and_sidebar_container">
		<div id="ttr_content">
			<div id="ttr_content_margin" class="container-fluid">
				<div
					style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
				<div class="ttr_About_html_row0 row">
					<div class="post_column col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="ttr_About_html_column00">
							<div
								style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div class="html_content">
								<p style="text-align: Center;">
									<span
										style="font-family: 'Arial'; font-weight: 700; font-size: 2em; color: rgba(5, 38, 55, 1);">댕댕텔링
										회원가입</span>
								</p>
							</div>
							<div
								style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div style="clear: both;"></div>
						</div>
					</div>
					<div
						class="clearfix visible-lg-block visible-sm-block visible-md-block visible-xs-block">
					</div>
				</div>

				<!-- 두번째 아이템 -->
				<div class="ttr_About_html_row3 row">
					<div class="post_column col-lg-6 col-md-12 col-sm-12 col-xs-12">
						<div class="ttr_About_html_column30">
							<div
								style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div class="html_content">
								<p
									style="margin: 0.14em 0em 0em 0em; line-height: 1.76056338028169;">
									<span
										style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">댕댕이를</span><span
										style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">맡기시려면</span><span
										style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">
									</span>
								</p>

								<!-- 일반회원가입 버튼 -->
								<p
									style="margin: 1.43em 0em 0em 0em; line-height: 1.76056338028169;">
									<span><a href="memJoinAgree" target="_self"
										class="btn btn-lg btn-primary"><input
											type="hidden" id="joinType" name="joinType" value="1">일반회원
											가입</a></span>
								</p>
							</div>
							<div
								style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
							<div style="clear: both;"></div>
						</div>
					</div>

					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p
							style="margin: 0.14em 0em 0em 0em; line-height: 1.76056338028169;">
							<span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">펫시터로</span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">
							</span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">활동하시려면</span><span
								style="font-family: 'Arial'; font-weight: 700; font-size: 1.714em; color: rgba(255, 255, 255, 1);">
							</span>
						</p>
						<!-- MORE INFO 버튼 -->
						<p
							style="margin: 1.43em 0em 0em 0em; line-height: 1.76056338028169;">
							<span><a HREF="pstJoinAgree" target="_self"
								class="btn btn-lg btn-primary"><input
									type="hidden" id="joinType" name="joinType" value="2">펫시터
									회원가입</a></span>
						</p>
					</div>
					<div
						style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<div
				class="clearfix visible-lg-block visible-sm-block visible-md-block visible-xs-block">
			</div>
		</div>
		<!-- 두번째 아이템 -->
	</div>
	<div style="clear: both"></div>
</div>

<!-- 세번째 아이템 -->

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>