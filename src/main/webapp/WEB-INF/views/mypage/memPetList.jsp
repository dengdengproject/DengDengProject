<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%@ include file="/WEB-INF/views/include/include-mymem-menu.jspf"%>



<!-- 댕댕이 목록 -->
<div style="height: 700px; border-top: solid; margin-left:5em; margin-right:10m;">
	<div style="text-align: center; margin-top: 4em; margin-bottom: 1em; width:auto">
		<span style="font-size: 2em; font-weight: bold;">나의 댕댕이</span>
	</div>

	<div style="text-align: center; margin-bottom: 1em;">
		<span style="position: relative; left: 20em">등록수 <span
			style="font-weight: 900"><%-- "${length(list)}" --%></span>마리
		</span>
	</div>

	<!-- <div align="center">
		<div style="height: 13em; width: 50em; border-style: solid;"
			onclick="location.href = 'nml_my_pet_detail.html' "> -->
	
	<div style="margin-left:15em; margin-right:15em;">
	<c:choose>
		<c:when test="${fn:length(list)>0 }">
			<c:forEach items="${list}" var="row">
			<!-- 프로필 이미지 -->
			<div
				style="border-style: solid; border-radius: 10em; width: 10em; hight: 10em; position: relative; top: 1.5em; right: 9em">
				<img
					style="object-fit: cover; border-style: solid; border-radius: 10em; width: 100%; hight: 100%;"
					src="/first/resources/downimage/${path}"> 
			</div>  
 
			<!-- 이름 -->
			<div style="position: relative; left: 5em; bottom: 5em">
				<span style="font-weight: 900; font-size: 1.1em">이름</span> <span
					style="margin-left: 2em;">${row.PET_MEM_NAME}</span>

			<!--  품종 -->
			
				<span style="font-weight: 900; font-size: 1.1em; margin-left: 5em;">품종</span> <span
					style="margin-left: 2em;">${row.PET_MEM_KIND}</span>

		

			<!--  생년월일 -->
			
				<span style="font-weight: 900; font-size: 1.1em; margin-left: 5em">생년월일</span> <span
					style="margin-left: 2em;">${row.PET_MEM_AGE}</span>

		


			<!--  등록번호 -->
			
				<span style="font-weight: 900; font-size: 1.1em; margin-left: 5em">등록번호</span> <span
					style="margin-left: 2em;">${row.PET_NO}</span>

		

			<!--  성별 -->
		
				<span style="font-weight: 900; font-size: 1.1em; margin-left: 5em">성별</span> <span
					style="margin-left: 2em;">${row.PET_MEM_SEX}</span>

			</div>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p>조회된 결과가 없습니다.</p>
	</c:otherwise>
	</c:choose>
		
			<!-- 추가등록 버튼 -->
			<div>
				<button style="width: 8em; height: 2em; font-size: 1.3em; margin-top:2em; left:15em;"
					onclick="location.href = 'nml_my_pet_add.html' ">추가 등록</button>
			</div>
		</div>
</div>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>