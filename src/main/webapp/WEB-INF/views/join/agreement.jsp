<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<div style="height: 600px">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 2em; font-weight: bold;">댕댕텔링 약관 동의</span>
	</div>
	<div style="text-align: center; margin-top: 3em">
		<textarea style="width: 40em; height: 20em; resize: none;"
			readonly="readonly">
		□ (필수) 이용약관 및 개인정보 수집 및 이용에 동의합니다.
		
		
		
		□ (선택) 위치정보 이용약관에 동의합니다.
		
		
		
		
		□ (선택) 프로모션 안내 메일 수신에 동의합니다.
		
		
		
		
		
		
		
		
		</textarea>
	</div>
	<div style="text-align: center; margin-top: 2em">
		<input type="checkbox">위의 내용을 모두 읽었으며 이에 모두 동의합니다.</input>
	</div>
	<div align="center">
		<div style="text-align: center; margin-top: 2e; width: 9em">
			<button
				style="width: 10em; height: 2.5em; position: relative; right: 8em"
				onclick="location.href = 'nml_join_form.html' ">다음</button>
		</div>
		<div style="text-align: center; margin-top: 2em; width: 12em">
			<button
				style="width: 10em; height: 2.5em; position: relative; left: 8em; bottom: 4.5em"
				onclick="location.href = 'join.html' ">동의하지 않습니다</button>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>