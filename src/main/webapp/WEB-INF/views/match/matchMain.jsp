<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
2020.02.11 호석 
-->
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-match-search.jspf"%>

<script type="text/javascript">
	function insertForm() {
		var form = document.matchMain;

		form.action = "/first/matchInsertForm";
		form.submit();
	}
</script>
<form id="matchMain" name="matchMain" method="POST">
	<div style="height: auto; border-top: solid;">
		<!-- 선부분 -->
		<div style="height: auto">

			<!-- 모든펫시터 리스트 -->
			<div style="text-align: center; margin-top: 5em">
				<span style="font-weight: bold; font-size: 2em;">모든 펫시터를 만나보세요!</span>
			</div>
			<div class="form-group tm-form-element tm-form-element-2" style="position: relative; left: 97em; margin-top: 1em">
				<button type="submit" class="btn btn-primary1 tm-btn-search" style="font-size: 1em">전체보기</button>	<!-- 이 부분에 모든 매칭 리스트 뽑아오는 쿼리 -->
			</div><!-- 각 버튼은 검색 결과 페이지로 넘어가는데, 리스트를 모두 다 가져온다. 그리고 페이징 해야지! -->
			
			<div class="ttr_Services_html_row3 row" style="margin-top: 2em">
				<c:forEach var="all" items="${allList}" end="4">
				<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetail?seq=${all.MATCH_NO}&&ID=${all.ID}'">
					<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
						<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div class="html_content">
							<p style="text-align: Center;">
								<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
									<img class="ttr_uniform" src="resources/images/<c:out value='${all.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
									<span style="color: #6E6E6E;"><b><c:out value="${all.ADDRESS}"/></b></span>
							</p>
							<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${all.SUBJECT}"/></span>
							</p>
							<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="color: #DBA901;"><b><c:out value="${all.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${all.NAME}"/></span>&nbsp;님</p>
							<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
								<span style="color: gray; font-size: 11px;"><c:out value="${all.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
						</div>
						<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
						<div style="clear: both;"></div>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>

		<!-- 프로펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">프로 펫시터를 만나보시겠어요?</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2" style="position: relative; left: 97em; margin-top: 1em">
			<button type="submit" class="btn btn-primary1 tm-btn-search" style="font-size: 1em">전체보기</button> <!-- 이 부분에 프로 펫시터 모든 목록 뽑아와야 함 -->
		</div>
		
		<div class="ttr_Services_html_row3 row" style="margin-top: 2em">
			<c:forEach var="pro" items="${proList}" end="4">
			<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetail?seq=${pro.MATCH_NO}&&ID=${pro.ID}'">
				<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
								<img class="ttr_uniform" src="resources/images/<c:out value='${pro.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
								<span style="color: #6E6E6E;"><b><c:out value="${pro.ADDRESS}"/></b></span>
						</p>
						<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${pro.SUBJECT}"/></span>
						</p>
						<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: #DBA901;"><b><c:out value="${pro.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${pro.NAME}"/></span>&nbsp;님</p>
						<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: gray; font-size: 11px;"><c:out value="${pro.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
					</div>
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			</c:forEach>
		</div>

		<!-- 신규펫시터 리스트 -->
		<div style="text-align: center; margin-top: 5em">
			<span style="font-weight: bold; font-size: 2em;">신규 펫시터를 할인된 가격으로 만나보세요.</span>
		</div>
		<div class="form-group tm-form-element tm-form-element-2" style="position: relative; left: 97em; margin-top: 1em">
			<button type="submit" class="btn btn-primary1 tm-btn-search" style="font-size: 1em">전체보기</button>
		</div>

		<div class="ttr_Services_html_row3 row" style="margin-top: 2em">
			<c:forEach var="nlt" items="${newList}" end="4">
			<div style="position: relative; text-align: center; cursor: pointer;" onclick="location.href='matchDetail?seq=${nlt.MATCH_NO}&&ID=${nlt.ID}'">
				<div style="float: left; position: relative; text-align: center; width: 18%; margin-left: 1.5%">
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div class="html_content">
						<p style="text-align: Center;">
							<span class="ttr_image" style="float: none; display: block; text-align: center; overflow: hidden; margin-bottom: 10px;"><span>
								<img class="ttr_uniform" src="resources/images/<c:out value='${nlt.IMAGE}'/>" style="width: 250px; height: 150px;" /></span></span>
								<span style="color: #6E6E6E;"><b><c:out value="${nlt.ADDRESS}"/></b></span>
						</p>
						<p style="margin-top: 10px; margin-bottom: 10px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="font-family: 'Arial'; font-weight: 700; font-size: 1.286em; color: rgba(5, 38, 55, 1); display: block; height: 35px; text-align: center;"><c:out value="${nlt.SUBJECT}"/></span>
						</p>
						<p style="margin-top: 5px; margin-bottom: 2px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: #DBA901;"><b><c:out value="${nlt.CLASS}"/></b></span> <font color="#FA5882"><b>펫시터</b></font>&nbsp;&nbsp;&nbsp;<span style="color: #000000;"><c:out value="${nlt.NAME}"/></span>&nbsp;님</p>
						<p style="margin-top: 2px; margin-bottom: 5px; text-align: Center; line-height: 1.76056338028169; letter-spacing: 1px;">
							<span style="color: gray; font-size: 11px;"><c:out value="${nlt.COUNT}"/>회의 펫시팅 경험이 있습니다.</span></p>	
					</div>
					<div style="height: 0px; width: 0px; overflow: hidden; -webkit-margin-top-collapse: separate;"></div>
					<div style="clear: both;"></div>
				</div>
			</div>
			</c:forEach>
		</div>
			<!-- 아래는 버튼, 이 부분은 조건을 넣어야 함. 일반인지 펫시터인지. -->
		<div>
			<button style="height: 2em; width: 10em;" id="insrtMtch" name="insrtMtch" onclick="insertForm()">매칭 등록</button>
		</div>
	</div>
</form>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>