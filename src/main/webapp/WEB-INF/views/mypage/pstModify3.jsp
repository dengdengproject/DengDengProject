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

var gfv_count = '${fn:length(list)+1}';

	$(document).ready(function() {
		
		

		$("#cancel").on("click", function(e) {
			e.preventDefault();
			fn_goHome();
		});

		$("#modify").on("click", function(e) {
			e.preventDefault();
			fn_modifySubmit();
		});
		
		$("#addFile").on("click", function(e){ //파일 추가 버튼
			e.preventDefault();
			fn_addFile();
		});
		
		$("a[name^='delete']").on("click", function(e){ //삭제 버튼
			e.preventDefault();
			fn_deleteFile($(this));
		});
	});

	function fn_goHome() {
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/login' />");
		comSubmit.submit();
	}

	function fn_modifySubmit() {

		var comSubmit = new ComSubmit("modifyPstPlace");
		comSubmit.setUrl("<c:url value='/modifyPstPlace' />");
		comSubmit.submit();
		//window.opener.parent.location.reload();
		window.opener.parent.location.href="MyInfodetail";
		window.close();
	}
	
	
	//var gfv_count = 1;
	
	function fn_addFile(){
			var str = "<p>" +
					"<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"'>"+
					"<a href='#this' class='btn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>삭제</a>" +
				"</p>";
			$("#fileDiv").append(str);
			$("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
       
</script>




<!--  위탁장소 등록-->
<div style="height: auto; margin-top:1em;">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">위탁장소 이미지 수정</span>
	</div>

	
<div style="margin-top:2em;">
	<form action="" id="modifyPstPlace" enctype="multipart/form-data" method="post">

 	

	<div
		style="text-align: center; position: relative; right: 21em; bottom: 0.5em;">
		<span style="font-weight: bold;">위탁 장소*</span>
	</div>	
	
	<!-- 위탁장소 이미지 파일 추가 -->
	<div style="text-align: center; position: relative; right: 5.3em; margin-top:1em;">
		<span style="font-weight: bold; position: relative; right: 15em; ">위탁장소 이미지</span>
		<div id="fileDiv" style="position: relative; margin-left:5em; bottom:1em">  
			<c:forEach var="row" items="${list }" varStatus="var">
				<p>
					<input type="hidden" id="PSMEM_FILE_NO" name="PSMEM_FILE_NO_${var.index }" value="${row.PSMEM_FILE_NO }"></input>
					<a href="#this" id="PSMEM_ORIGINAL_FILE_NAME_${var.index }" name="PSMEM_ORIGINAL_FILE_NAME_${var.index }"> ${row.PSMEM_ORIGINAL_FILE_NAME } (${row.PSMEM_FILE_SIZE }kb)</a>
					<input type="file" id="file_${var.index }" name="file_${var.index }"></input>
					<a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a>
				</p>
			</c:forEach>
		</div>	
				
			<p style="position:relative; bottom:1em;"><a href="#this" class="btn" id="addFile">파일 추가</a></p>
	
	</div>				
				
				
				
			
	<div align="center">
		<div
			style="text-align: center; position: relative; right: 2em;  margin-top: 2em; margin-bottom:2em">
			<button style="width: 13em; height: 3em" id="cancle">처음으로</button>
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



	




<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>