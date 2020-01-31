<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<head>
<script type="text/javascript">
$(document).ready(function(){ 
	var message = "${message}";
	var url = "${url}";
	if(message!=null && message!=''){
		alert(message);
		if(url!=null && url!=''){
			location.href = "<c:url value='${url}'/>";
		}else{
			history.go(-1);
		}
	}else{
		location.href = "<c:url value='/main'/>";
	}
})
</script>
</head>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>