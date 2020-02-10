<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<%@ include file="/WEB-INF/views/include/include-head.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

<%@ include file="/WEB-INF/views/include/include-header-menu.jspf"%>

<%
 String id=request.getParameter("pst_id");

%>



<div style="height: 950px">
	<div style="text-align: center; margin-top: 3em">
		<span style="font-size: 1.5em; font-weight: bold;">댕댕이의 성향을
			알려주세요.</span>
	</div>

	<div align="center">
		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">1.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch1" value="1_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em"><input
				type="checkbox" name="ch1" value="1_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;"><input
				type="checkbox" name="ch1" value="1_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;"><input
				type="checkbox" name="ch1" value="1_4">별로 관심을 두지 않아요.</label>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">2.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch2" value="2_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em"><input
				type="checkbox" name="ch2" value="2_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;"><input
				type="checkbox" name="ch2" value="2_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;"><input
				type="checkbox" name="ch2" value="2_4">별로 관심을 두지 않아요.</label>
		</div>

		<div
			style="text-align: left; border: 0.3em dashed rgb(3, 127, 187); margin-top: 2em; width: 50em; height: 15em;">
			<span
				style="position: relative; top: 1em; left: 1em; font-weight: bold;">3.
				다른 강아지를 만났을 때 반응을 알려주세요.</span> <label
				style="position: relative; top: 4em; right: 19.1em;"><input
				type="checkbox" name="ch2" value="3_1">무서워하며 경계해요.</label> <label
				style="position: relative; top: 6em; right: 30.1em"><input
				type="checkbox" name="ch2" value="3_2">짖거나 달려들어요.</label> <label
				style="position: relative; top: 6em; left: 1.9em;"><input
				type="checkbox" name="ch2" value="3_3">반가워하며 함께 놀아요.</label> <label
				style="position: relative; top: 8em; right: 10.4em;"><input
				type="checkbox" name="ch2" value="3_4">별로 관심을 두지 않아요.</label>
		</div>

		<div style="margin-top: 1em">
			<span>※ 사실과 다른 정보로 인해 사고가 발생할 경우 책임은 견주 본인에게 있음을 안내해드립니다.</span>
		</div>

		<div align="center">
			<div
				style="text-align: center; position: relative; right: 8em; top: 1em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em">이전</button>
			</div>
			<div
				style="text-align: center; position: relative; left: 13em; bottom: 3em; margin-top: 1em; width: 14em;">
				<button style="width: 13em; height: 3em"
					onclick="location.href = 'join_success.html' ">등록 완료</button>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/include/include-footer.jspf"%>

</html>