<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--输出,条件,迭代标签库-->
<%@ page isELIgnored="false"%>
<!--支持EL表达式，不设的话，EL表达式不会解析-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
	<nav aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">更新</li>
		</ol>
	</nav>
	<div class="container">
		<form action="update" method="post">
			<input type="hidden" id="bookId" name="bookId" value="${respUpdate.bookId}">
			<label>類別 :</label>
			<select id="bookClassName" name="bookClassName">
				<c:forEach var="i" begin="0" end="${respSearch.size()-1}" step="1">
					<c:if test="${respSearch.get(i).bookClassName == respUpdate.bookClass.bookClassName}">
						<option value="${respSearch.get(i).bookClassName}" SELECTED>
							${respSearch.get(i).bookClassName}
						</option>
					</c:if>
					<option value="${respSearch.get(i).bookClassName}">
						${respSearch.get(i).bookClassName}
					</option>
				</c:forEach>
			</select>
			<input type="text" id="bookName" name="bookName" value="${respUpdate.bookName}">
			<input class="btn btn-secondary" type="submit" value="確認修改">
		</form>
	</div>
</body>
</html>