<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="kr" lang="kr">

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<c:set var="name" value="${pst.NAME}" />
<c:set var="grade" value="${pstAdd.PSMEM_CLASS}" />
<c:set var="school" value="${pstAdd.PSMEM_SCHOOL_FINISH_CHECK}" />
<c:set var="certiChk" value="${pstAdd.PSMEM_CERTI_CHECK}" />

<script type="text/javascript">
// 이미지 슬라이드
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  captionText.innerHTML = dots[slideIndex-1].alt;
}
// 매치 등록
	function matchConfirm() {
		var form = document.matchInsert;

		if (form.largeHalf.value == "선택") {
			alert("요금을 설정해주세요.")
			form.largeHalf.focus();
			return false;
		}
		
		form.action = "/first/matchCommit";
		form.submit();
	}	
	
</script>

<form id="matchInsert" name="matchInsert" method="post">
	<input type="hidden" name="address1" id="address1" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}" />
	<input type="hidden" name="address2" id="address2" value="${pstAdd.PSMEM_CONSIGNMENT_ADDRESS2}" />	
	<input type="hidden" name="PSMEM_ID" id="PSMEM_ID" value="${ID}" />
	<input type="hidden" name="name" id="name" value="${name}"/>
	<input type="hidden" name="GRADE" id="GRADE" value="${grade}"/>
	<!-- <input type="hidden" name="datePic" id="datePic" value="${flikr}"/>
	<c:forEach items="${flikr}" var="dP">
		${dP}"
	</c:forEach> -->
	
<!-- 이미지 슬라이드 -->
	<div class="container" style="text-align: center;">
		<!-- <a class="prev" onclick="plusSlides(-1)">❮</a>
  		<a class="next" onclick="plusSlides(1)">❯</a> -->
		<c:forEach var="pstIMG" items="${pstImg}" varStatus="status">
  			<div class="mySlides">
   	 			<div class="numbertext"><c:out value="${status.count}"/> / <c:out value="${status.end}"/></div>
   	 			<img src="resources/images/<c:out value='${pstIMG.PSMEM_ORIGINAL_FILE_NAME}'/>" style="height: 600px; width: auto">
  			</div>
    	</c:forEach>
    	
 		<div style="display: flex; flex-direction: row; margin-top: 10px; float: right; position: relative; left: -50%; clear: both;">
  			<c:forEach var="petIMAGE" items="${pstImg}" varStatus="status">
				<div style="display: flex; flex-direction: column; float: left; position: relative; left: 48%;">
					<img class="demo cursor" src="resources/images/<c:out value='${petIMAGE.PSMEM_ORIGINAL_FILE_NAME}'/>" style="width: auto; height: 100px;" onclick="currentSlide(<c:out value='${status.count}'/>)" />
				</div>
	    	</c:forEach>
	    </div>
	</div>
	<!-- 이미지 슬라이드 끝 -->
	<!-- 펫시터 소개 상단 -->
	<div style="margin-top: 73px; margin-left: auto; margin-right: auto; width: 1027px; display: flex; flex-direction: row; justify-content: space-between">
		<div style="float: left; width: 66%; padding: 40px;">
			<div style="display: flex; flex-direction: row">
				<div style="overflow: hidden; width: 100px; height: 100px; border: none; border-radius: 12px; margin-top: 5px; margin-left: 10px; margin-right: 32px;">
					<img width="100" height="100" style="object-fit: cover; display: inline-block;" src="resources/images/${pstPfl.PROFILE_ORIGINAL_FILE_NAME}"/>
			<!-- 윗단은 멤버 프로필 사진 --> <!-- 프로필 사진도 가져와야 함 -->
				</div>
				<div style="overflow: hidden; width: 430px;">
					<h1 style="font-family: Noto Sans KR, sans-serif; font-size: 15px; color: #4C5056; line-height: 22px; letter-spacing: -0.2px">
						<span style="color: rgb(94, 99, 109)">${pstAdd.PSMEM_CONSIGNMENT_ADDRESS1}</span><br/> 
						<span style="font-weight: bold; color: gold;">${grade} 펫시터 </span><b>&nbsp;&nbsp;&nbsp;&nbsp;${name}</b> 님</h1>
					<p style="font-family: Noto Sans KR, sans-serif; margin-top: 5px; font-size: 25px; color: #383C48; line-height: 30px; letter-spacing: -0.2px;">
						${matchDtl.MATCH_SUBJECT}
					</p>
					<!-- 해시 태그 시작 x service로 바꿈 -->
				</div>
			</div>
			<div style="display: flex; flex-direction: row"> <!-- 다음에 수정할 때는 이 지랄하지 말고 테이블에 넣어서 반복 돌려야지... 이건 미친 짓이다. -->
				<div> <!-- 서비스 부분은 컨트롤러에서 스플릿 해서 배열로 담아오자. 그 다음 반복문으로 꺼내면서 조건문을 포함해서 나오도록. -->
					<div style="display: flex; margin-top: 50px; width: 600px; position: relative; text-align: center;">
					<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30px; line-height: 25px; color: #393C47">
						<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> ${name} 펫시터님의 상세 조건입니다.</h2>
					</div>
					<c:forEach var="service" items="${serviceList}">
						<c:if test="${service == 'service1'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 없음</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										현재 반려동물 없음!</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service2'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: auto; margin-right: auto; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>픽업</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집 앞 픽업 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service3'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>대형견</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										대형견 예약 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service4'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>마당 있음</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										뛰어놀 마당 보유</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service5'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>노견 케어</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										노견 집중 케어 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service6'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>장기 예약</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										14일 이상 돌봄 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service7'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>실내 놀이</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										편한 실내 놀이 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service8'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>매일 산책</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										매일 근처 산책 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service9'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>목욕 가능</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕이 목욕 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service10'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>약물 경구 복용</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										약물 먹이기 가능</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service11'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>강아지 케어</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										어린 댕댕 집중 관리</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service12'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner;  margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아파트</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										아파트 주거 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service13'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>빌라</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										빌라 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service14'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>단독 주택</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										단독 주택 거주 중</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service15'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>싱글</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service16'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>아이 없음</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										집중 케어가 가능해요</p>
								</div>
							</div>
						</c:if>
						<c:if test="${service == 'service17'}">
							<div style="display: block; width: 200px; height: 69px; float: left; position: relative; text-align: cetner;">
								<div style="display: inline-block; float: left; position: relative; text-align: cetner; margin-left: 30px;">
								<img width="32" height="32" src="resources/images/service1.png"></div>
								<div style="display: inline-block; margin-left: 13px; position: relative; width: 150;">
									<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 13px; letter-spacing: -0.2px; line-height: 13px; color: rgb(85, 85, 85);">
										<b>반려동물 등록 가능</b></p>
									<p style="font-size: 11px; letter-spacing: -0.2px; line-height: 11px; color: rgb(94, 99, 109); margin-top: 5px;">
										댕댕 등록 대행 가능</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- 펫시터 소개 상단 끝 -->
			
			<!-- 펫시터 소개 시작 -->
			<div>
			<c:choose>
				<c:when test="${grade=='프로'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 프로 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							프로 펫시터는 다수의 펫시팅 경험과 높은 고객 만족도는 물론, 댕댕텔링의 프로 시험을 통과한 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='일반'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 일반 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							일반 펫시터는 다수의 예약 진행을 경험한 댕댕텔링의 프리미엄 펫시터입니다.
						</p>
					</div>
				</c:when>
				<c:when test="${grade=='신입'}">
					<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 85px; margin-top: 50px; border-radius: 5px; background-color: rgb(243, 243, 243); position: relative;">
						<div style="display: flex; align-items: center;">
							<img width="16" height="23" src="resources/images/pro_petsitter.png">
							<p style="font-weight: 600; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(57, 60, 71); margin-left: 9px; margin-top: 15px;">
								${name} 님은 신입 펫시터입니다.
							</p>
						</div>
						<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 5px">
							신입 펫시터는 댕댕텔링의 자격 시험을 통과한 전문 펫시터입니다.
						</p>
					</div>
				</c:when>
			</c:choose>
			<!-- 펫시터 소개 시작 -->
			<!-- 펫시터 인사글 -->
			<div style="margin-top: 53px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; margin-bottom: 30; line-height: 25px; color: #393C47">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> ${name} ${grade} 펫시터님을 소개합니다</h2>
					<div style="border: 1px dotted; padding: 10px; border-radius: 10px">
						<p style="font-size: 15px; line-height: 25px; color: #555555; margin-top: 10px">
							${pstAdd.PSMEM_CAREER}<br/>
							${pstAdd.PSMEM_INTRODUCE}
						</p>
					</div>
			</div>
			</div>

			<!--펫시터 자격증 및 교육 수료 --> <!-- 이 부분은 리스트를 불러와서  하나씩 뽑아야 함. -->
			<div style="margin-top: 58px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> 자격증 및 교육 수료</h2>
				<c:forEach var="certi" items="${certi}" varStatus="status">
				<div style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 10px 0px; ">
					<div style="display: flex; flex-direction: row; align-items: center;">
						<img width="200" height="100" src="resources/images/${certi.PROFILE_ORIGINAL_FILE_NAME}" style="object-fit: cover; margin-left: 20px; margin-right: 30px;">
						<div style="margin-left: 18px;">
							<p style="font-family: &amp; amp; amp; amp; quot; Noto Sans KR&amp;amp; amp; amp; quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72);">
								<b>${certi.CERTI_NAME}</b></p>
							<p style="font-size: 14px; letter-spacing: -0.2px; line-height: 19px; color: rgb(56, 60, 72); margin-top: 20px;">
								${certi.CERTI_ORG}</p>
							<!-- 윗단은 자격증 담당 기관 -->
							<p style="font-size: 12px; line-height: 17px; color: rgb(129, 137, 155); margin-top: 7px;">
								${certi.CERTI_DATE}에 취득하였습니다</p>
						<!-- 취득일자  + 에 취득하셨습니다.-->
						</div>
					</div>
				</div>
				</c:forEach>
				<c:choose>
					<c:when test="${school=='Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="16" height="23" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 15px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 학과</b></font>를 졸업한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${certiChk=='Y'}">
						<div style="display: flex; align-items: center; margin-left: 20px;">
							<img width="16" height="23" src="resources/images/medal.png">
							<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 18px; color: #555555; margin-top: 15px">
								&nbsp;&nbsp;&nbsp;${name} 님은 <font color="red" size="2"><b>반려동물 관련 자격증</b></font>을 취득한 전문 인재입니다.</p>
						</div>
					</c:when>
				</c:choose>
			</div>
			<!--펫시터 자격증 및 교육 수료 -->
			<!-- 펫시터 반려동물 -->
			<div style="margin-top: 58px">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: 1px; line-height: 25px; color: #393C47; margin-bottom: 20px">
					<img width="17px" height="17px" style="object-fit: cover; display: inline-block; margin-right: 5px;" src="resources/images/point.png"> 펫시터님과 함께하는 반려동물</h2>
				<c:forEach var="petMem" items="${pet}" >
					<div style="display: flex; flex-direction: column; border-top: 1px solid rgb(235, 235, 235); padding: 10px 0px; ">
						<div style="display: flex; flex-direction: row; align-items: center;">
							<img width="60" height="60" src="resources/images/ja1.jpg" style="object-fit: cover; border-radius: 50%; margin-left: 20px; margin-right: 20px;">
							<div style="margin-left: 18px;">
								<!-- 글쓴이 -->
								<div style="display: flex; flex-display: column">
								<p style="font-family: &amp; quot; Noto Sans KR&amp;quot; , sans-serif; font-size: 15px; letter-spacing: -0.2px; line-height: 22px; color: rgb(56, 60, 72); margin-top: 7px;">
								<b>이름 : </b><c:out value="${petMem.NAME}"/>&nbsp;&nbsp;&nbsp;(<c:out value="${petMem.SEX}"/>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.AGE}"/> 살 
								</div style="display: flex; flex-display: column">
								<div>
								<p style="font-size: 15px; line-height: 19px; color: rgb(76, 80, 86); margin-top: 6px;">
								<b><c:out value="${petMem.KIND}"/></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<c:out value="${petMem.PET_SIZE}"/>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;무게 : <c:out value="${petMem.KG}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;중성화 여부 : <c:out value="${petMem.SEX_CHK}"/></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div style="float: left; width: 30%;">
			<!-- 펫시터 후기 --> <!-- 이미지 댓글 형식으로 만들어야 함 -->
			<!-- 펫시터 예약 날짜 선택 -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding-left: 32px; padding-right: 32px; padding-bottom: 32px">
				<p style="font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-top: 38px; margin-bottom: 30px; font-weight: 600">
					펫시팅 가능 일정
				</p>
				<div style="display: flex; flex-grow: 1; margin-top: 1em">
					<form method="get" class="tm-search-form tm-section-pad-2">
						<div class="form-group tm-form-element tm-form-element-50" style="width: 22em; right: 3em; bottom: 1em">
							<i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
							<input name="basicDate" type="text" class="flatpickr-input" id="basicDate" placeholder="펫시팅이 가능한 날짜를 선택해주세요." style="font-size: 1em">
						</div>
					</form>
				</div>

				<!-- 예약 시간 선택 --> <!-- 이 부분은 조건문으로 저장된 값보다 작은 값은 나오지 않게 해야 함. 하려고 했지만 귀찮으니 나중에 적용 -->
				<div style="display: flex; flex-direction: row; justify-content: space-between; margin-top: 38px">
					<div style="width: 149px">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; position: relative;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크인 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_IN} 이후</p>
						</div>
					</div>
					<div style="width: 149px">
						<div style="display: flex; flex-direction: column; align-items: center; justify-content: space-between; margin-bottom: 8px; text-align: center;">
							<p style="font-family: Noto Sans KR; font-size: 14px; letter-spacing: -0.2px; line-height: 20px; color: #393C47; margin-bottom: 18px; text-align: center;">
								<b>체크아웃 시간</b>
							</p>
							<p style="font-weight: 600; font-size: 13px; line-height: 18px; color: #6597F4">${matchDtl.MATCH_CHECK_OUT} 이전</p>
						</div>
					</div>
				</div>
				<!-- 예약 시간 선택 끝 -->
			</div>
			<!-- 펫시터 예약 날짜 선택 끝 -->
			<!-- 이용 요금 소개 --> <!-- 가능, 불가 선택. 지정된 액수 안에서 금액 설정 가능하게. -->
			<div style="width: 375px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); padding: 38px 32px; margin-top: 38px">
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between">
					<p style="font-size: 17px; font-weight: 600; letter-spacing: -0.2px; line-height: 25px; color: #393C47">이용 요금</p>
					<div style="display: flex; align-items: center; flex-direction: row">
						<div style="display: flex; flex-direction: row; align-items: center; margin-right: 3px">
							<p style="font-size: 13px; line-height: 18px; color: #383C48">1박 케어</p>
						<div style="width: 1px; height: 15px; background-color: #ECEDF0; margin-left: 10px; margin-right: 10px"></div>
							<p style="font-size: 13px; line-height: 18px; color: #383C48">데이케어</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_small.png" alt="소형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">소형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">7키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_SMALL_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_SMALL_HALF}
							</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_medium.png" alt="중형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">중형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">15키로 미만</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_MEDIUM_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_MEDIUM_HALF}
							</p>
						</div>
					</div>
				</div>
				<div style="display: flex; flex-direction: row; align-items: center; justify-content: space-between; margin-top: 14px">
					<div style="display: flex; flex-direction: row; align-items: center; height: 24px">
						<img width="24" height="24" src="resources/images/price_pet_large.png" alt="대형견">
						<p style="font-size: 15px; line-height: 19px; color: #383C48; margin-left: 10px">대형견</p>
						<p style="font-size: 12px; line-height: 17px; color: #999999; margin-left: 5px">15키로 이상</p>
					</div>
					<div style="display: flex; flex-direction: row">
						<div style="display: flex; align-items: center; flex-direction: row">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 1px; color: #4E525B; margin-right: 11px">
								${matchDtl.PRICE_LARGE_ALL}
							</p>
						</div>
						<div style="display: flex; flex-direction: column; align-items: center; width: 62px">
							<p style="font-size: 12px; letter-spacing: 0.5px; line-height: 20px; color: #4E525B">
								${matchDtl.PRICE_LARGE_HALF}
							</p>
						</div>
					</div>
				</div>
				<div style="width: 310px; height: 1px; background-color: #EBEBEB; margin: 32px 0"></div>
			</div>
			<!-- 이용 요금 소개 끝 -->
			<!-- 카카오 지도 API: 펫시터 위치 표시 -->
			<div style="position: relative; line-height: 1em; display: flex; flex-direction: column; width: 375px; height: 400px; border-radius: 8px; border: 1px solid #DFE3EA; box-shadow: 1px 3px 7px rgba(0, 0, 0, 0.07); margin-top: 38px; overflow: hidden; text-align: center;">
				<h2 style="font-weight: 600; font-size: 17px; letter-spacing: -0.2px; line-height: 25px; color: #393C47; margin-bottom: 8px">${name} 펫시터님의 동네 위치입니다.</h2>
					<p style="font-size: 12px; letter-spacing: -0.2px; line-height: 10px">매칭이 성사되면 정확한 위치를 확인하실 수 있어요!</p>
				<div id="map" style="position: absolute; height: 300px; border-radius: 4px; border: 1px solid #DFE3EA; overflow: hidden; display: inline-block; text-align: center; top: 23%; left: 52.5%; width: 95%; margin-top: -0.5em; margin-left: -50%;">
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bd69701c52c23858bb7f642b6fddbe23&libraries=services,clusterer,drawing"></script>

					<script>
						var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
						var options = { //지도를 생성할 때 필요한 기본 옵션
							center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
							level : 4 //지도의 레벨(확대, 축소 정도)
						};

						var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

						//회원의 주소값을 바로 지도에 표시하기 위해 가져오는 form 정보.
						var form = document.matchInsert;
					
						//이 부분 이미지를 인터넷에서 가져올 수 있도록 해야할 듯.
						var imageSrc = 'file:///C:/Users/Dead Cat/git/DengDengProject/src/main/webapp/resources/images/dogmaker_after.png', // 마커이미지의 주소입니다    
							imageSize = new kakao.maps.Size(60, 60), // 마커이미지의 크기입니다
							imageOption = {offset : new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다 + 마커 오버레이랑 클릭 버전도 있으니까 시간나면 트라이.
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
						//, markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 주소로 좌표를 검색합니다 + 주소를 가져와서 합쳐도 출력이 된다는 것을 알았으니 나중에 조건문을 넣어서 진행 단계에 따라 다르게 나오도록 하면 될 듯함.
						geocoder.addressSearch((matchInsert.address1.value), function(result, status) {
						//geocoder.addressSearch('경기도 의정부시 용민로 21', function(result, status) { //확인용
							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									image : markerImage, // 마커이미지 설정 
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다 + 인포 윈도우는 다르게 수정할 수 있으니까 시간 나면 알아보자.
								var infowindow = new kakao.maps.InfoWindow({
									content : '<div style="width:150px;text-align:center;padding:6px 0;">위탁 지역</div>'
								});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
					</script>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%">
		<div style="margin-top: 100px">
			<div style="position: relative; bottom: 10em; left: 11em; text-align: center; width: 7em">
				<button type="button" style="width: 7em; height: 3em;"
					class="matchButton" id="matchInsertBt" onclick="matchConfirm()">등록</button>
			</div>
		</div>
	</div>
</form>

<!-- flatpickr jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Flatpickr -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.2.3/flatpickr.js"></script>
<!-- flatpickr -->  
<script id="INLINE_PEN_JS_ID">
	var form = document.matchInsert.datePic;
	
	//alert(document.getElementById(form.value))

	$("#basicDate").flatpickr({  // 이 방식은 펫시터가 사용. //일단 disable이 불가능한 것 같으니 일반 회원도 이걸로 사용.
		mode: "multiple",	//다중 선택
		dateFormat: "Y-m-d",
		minDate: "today"  //펫시터가 선택하는 날짜는 DB에 리스트로 저장했다가 일반 회원이 고를 때 enable로 가능한 날짜만 표시.
	});					  //그렇게 DB에 저장하면 펫시터가 원하는 날짜만 골라서 매칭할 수 있을 것 같음.
	
	$("#rangeDate").flatpickr({	//이 방식은 일반 회원이 사용
		mode: "range",		//시작에서 끝까지 from to 형식으로 선택	//이 방식은 또 어떻게 검색해야 할지 감이 안 온다.
		dateFormat: "Y-m-d",
		minDate: "today",
		disable: [flikr]	//배열을 읽지를 못하네 어쩌지
		//disable: ["2020-02-18", "2020-02-19", "2020-02-21", "2020-02-20", "2020-02-27", "2020-02-26"]  //이 부분은 테이블에 불가능한 날짜를 리스트로 저장하고, 회원이 일정 고를 때 긁어와서 저기에 넣어야 할 것 같음.
	});

</script>

<!-- flatPickr 나머지 기능 -->
<!-- <div>
	<img src="https://chmln.github.io/flatpickr/images/logo.png"
		alt="flatpickr">
		<h1>Flatpickr</h1>
		<hr>
			<div class="flatpickr">
				<h2>Basic DateTime</h2>
				<input type="text" id="basicDate"
					placeholder="Please select Date Time" data-input
					class="flatpickr-input">

					<h2>Range Datetime</h2> <input type="text" id="rangeDate"
					placeholder="Please select Date Range" data-input
					class="flatpickr-input">
			</div> -->
<!-- 테스트용 코드 -->
<!-- <button type="button" class="testBt" name="test" id="test" onclick="testDate()">확인</button> -->
<!-- 
function testDate() {
	var form = document.matchInsert;
	var testVal = document.matchInsert.basicDate
	var str = "";
	
	if(testVal.value == null || testVal.value == '') {
		alert("값이 들어오지 않았습니다.");
	} else {
		alert("값이 있습니다.")
	}
	alert("1")

	for(help in testVal) {
		str += help + "=" + testVal[help] + "\n";
	}
	alert("2")
	alert(str)
	alert("3")
	//document.write("값은", typeof document.matchInsert.basicDate);
} -->
<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
</html>