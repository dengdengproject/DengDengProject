<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="EUC-KR">
<title>���̵� ã�� ���</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>
</head>
<body> 

<div class="result" style="height: 500px; margin-top: 6em; margin-bottom: 6em; text-align: center;">
<c:if test="${id.ID==null || id.ID==''}">
<span style="font-size: 1.5em; font-weight: bold">��ȸ�� ���̵� �����ϴ�.</span>
</c:if>
<c:if test="${id.ID!=null && id.ID!=''}">
<span style="font-size: 1.5em; font-weight: bold">�Է��Ͻ� ������ ��ϵ� ���̵�� '${id.ID}'�Դϴ�.</span>
</c:if>
<br>
<a href="#" onclick="javascript:history.go(-1);" class="btn">�ڷΰ���</a>
<a href="#" onclick="javascript:window.close();" class="btn">�ݱ�</a>


<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>
</div>
</body>
</html>