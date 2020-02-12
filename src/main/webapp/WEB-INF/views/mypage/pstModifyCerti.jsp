<!-- 2020.02.11. PM6:10 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<script type="text/javascript" src="resources/js/common.js"></script>

<%
	String id = request.getParameter("PSMEM_ID");
%> 


<script type="text/javascript">

	function get(){
	document.getElementById("CERTI_NAME").value = opener.document.getElementById("CERTI_NAME").value;
	document.getElementById("CERTI_ORG").value = opener.document.getElementById("CERTI_ORG").value;
	document.getElementById("CERTI_DATE").value = opener.document.getElementById("CERTI_DATE").value;

	}
	$(document).ready(function() {
		
		$("#modify").on("click", function(e) {
			e.preventDefault();
			fn_modifySubmit();
		});
		
	});


	function fn_modifySubmit() {

		var comSubmit = new ComSubmit("modifyCerti");
		comSubmit.setUrl("<c:url value='/modifyCerti' />");
		comSubmit.submit();
		window.opener.parent.location.reload();
		//window.opener.parent.location.href="memInfoModifyForm";
		window.close();
	}

       
</script>




<!--  위탁장소 등록-->
<div style="height: auto; margin-top:1em;">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">자격증파일 수정</span>
	</div>

	 
<div style="margin-top:2em;">
	<form action="" id="modifyCerti" enctype="multipart/form-data" method="post">
	
	<div style= "TEXT-ALIGN: center">
	자격증 이름<input type="text"  style="width: 10em; margin-left:1em;" id="CERTI_NAME" name="CERTI_NAME" value="${certi.CERTI_NAME }"></input>
				발급 기관<input type="text"  style="width:10em; margin-left:1em" id="CERTI_ORG" name="CERTI_ORG" value="${certi.CERTI_ORG }"></input>
				취득일자<input type="text"  style="width:10em; margin-lefg:1em" id="CERTI_DATE" name="CERTI_DATE" value="${certi.CERTI_DATE }"></input>
	
	<p>자격증 파일 선택			
	<input type="file" id="file" name="file_0" style="position: relative; left: 60em; margin-top:1em;">
	</div>			

	
	<div align="center">
		<div
			style="text-align: center; position: relative; right: 2em;  margin-top: 2em; margin-bottom:2em">
			<button style="width: 13em; height: 3em" onclick="window.close()">돌아가기</button>
			<button style="width: 13em; height: 3em; margin-left:2em;" id="modify">완료</button>
		</div>
	</div>
	</form>
</div>




<style type="text/css">


.my_button {
	display: inline-block;
	width: 200px;
	text-align: center;
	padding: 10px;
	background-color: #006BCC;
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
}

.imgs_wrap {
	width: 15em;
	height: 15em;
	border: 2px solid #A8A8A8;
	margin-top: 15px;
	margin-bottom: 15px;
}

.imgs_wrap img {
	width: 14.5em;
	height: 14.5em;
}
</style>




</html>