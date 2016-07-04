<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="query" method="post">
		<b>SQL命令:</b> <br>
		<textarea name="sqlStatement" id="sqlStatement" cols=80 rows=10>${inputSql}</textarea>
		<br> <br> <input type="submit" value="执行">
	</form>

	<b>SQL命令执行结果:</b>
	<br>
	<c:if test="${onlySelect}">
		<table border="1">
			<tr>
				<th></th>
				<c:forEach var="columncount" begin="1" end="${column}">
					<th>Item ${columncount}</th>
				</c:forEach>
			</tr>
			<c:forEach var="row" items="${list}" varStatus="countRow">
				<tr>
					<td>${countRow.index+1}</td>
					<c:forEach var="columncount" begin="0" end="${column}"
						items="${list[countRow.index]}">
						<td>${columncount}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</c:if>

	<c:if test="${!onlySelect}">
		${msg}
		${SQLException }
		${Exception }
	</c:if>
</body>
</html>