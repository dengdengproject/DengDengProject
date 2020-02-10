<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<script type="text/javascript" src="resources/js/common.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		 
		$("#cancel").on("click", function(e){
			e.preventDefault();
			fn_goHome();
		});
		
		$("#join").on("click", function(e){
			e.preventDefault();
			fn_joinSubmit();
		});
	});

	
	function fn_goHome(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}
	
	function fn_joinSubmit(){
		alert("petRegistAdd Submit!!!!!!!!!!!!!!!")
		var comSubmit = new ComSubmit("joinForm");
		comSubmit.setUrl("<c:url value='petRegisterAdd' />");
		comSubmit.submit();
	}
	

</script>




<div style="height: auto">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 1.5em; font-weight: bold;">댕댕이의 성향을
			알려주세요.</span>
	</div>

	<div align="center">
	<form action="petRegisterAdd" id="joinForm" method="post">
		<div style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_RESPONSE" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_RESPONSE" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_RESPONSE" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_RESPONSE" value="4">별로 관심을 두지 않아요.</label>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_HUMAN" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_HUMAN" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_HUMAN" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_HUMAN" value="4">별로 관심을 두지 않아요.</label>
		</div>
	

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_BARK" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_BARK" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_BARK" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_BARK" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_TRAINING" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_TRAINING" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_TRAINING" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_TRAINING" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_DDONG_STYLE" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_DDONG_STYLE" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_DDONG_STYLE" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_DDONG_STYLE" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_SHARP_BODY" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_SHARP_BODY" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_SHARP_BODY" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_SHARP_BODY" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_ATTACK" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_ATTACK" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_ATTACK" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_ATTACK" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;">
				<input	type="checkbox" name="PET_MEMBER_ADD_VACCINATION" value="1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em">
				<input type="checkbox" name="PET_MEMBER_ADD_VACCINATION" value="2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;">
				<input type="checkbox" name="PET_MEMBER_ADD_VACCINATION" value="3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;">
				<input type="checkbox" name="PET_MEMBER_ADD_VACCINATION" value="4">별로 관심을 두지 않아요.</label>
		</div>
		
		<input type = "hidden" id="ID" name="ID" value="${ID}">
		<input type = "hidden" id="ID" name="PET_MEM_ID" value="${PET_MEM_ID}">
		<input type = "hidden" id="ID" name="PET_MEM_NAME" value="${map.PET_MEM_NAME}">

		<div style="margin-top: 1em">
			<span>※ 사실과 다른 정보로 인해 사고가 발생할 경우 책임은 견주 본인에게 있음을 안내해드립니다.</span>
		</div>
      <p>PET_MEM_NAME은</p><p>${map.PET_MEM_NAME}</p>
		<div align="center">
			<div
				style="text-align: center; position: relative; right: 8em; top: 1em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em" id="cancel">이전</button>
			</div>
			<div
				style="text-align: center; position: relative; left: 13em; bottom: 3em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em" id="join">등록 완료</button>
			</div>
		</div>
	</form>	
		<%@ include file="/WEB-INF/views/include/include-body.jspf" %>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>