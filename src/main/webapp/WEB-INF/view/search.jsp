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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	function showInsert(){
		document.getElementById("insertDiv").style.display = 'block';
	}
	
	function cancelInsert(){
		document.getElementById("insertDiv").style.display = 'none';
	}
	
	function insert(){
		if($("#insertBookName").val() == "" && $("#insertBookClassName").val() == ""){
			alert("請選擇類別並輸入書名");
		}else if($("#insertBookName").val() == ""){
			alert("書名不可為空");
		}else if($("#insertBookClassName").val() == ""){
			alert("請選擇類別");
		}else{
			$.ajax({
				type: "post",
				url: "/insert",
				data: {
					bookClassName: $("#insertBookClassName").val(),
					bookName: $("#insertBookName").val()
				},
				success: function(data){
					if(data){
						//console.log(data.bookName);
						alert(data.bookName + " 這本書已新增");
						document.getElementById("insertDiv").style.display = 'none';
					}
				},
				error: function (error) {
					alert("系統發生錯誤");
					document.getElementById("insertDiv").style.display = 'none';
				}
			})
		}
	}
	
	function doDelete(item){
		var Check = confirm('確認刪除這本書籍?');
        if (Check == true) {
			$.ajax({
				type: "post",
				url: "/delete",
				data: {
					id: $(item).attr("value")
				},
				success: function(){
					alert("圖書已刪除");
				},
	            error: function () {
	            	alert("系統發生錯誤");
	            }
			})
        }
	}
	
	function logout(){
		var Check = confirm('確認登出?');
        if (Check == true) {
        	window.location.href="/logout";
        	alert("已登出, 按下確定返回登入頁");
        }
	}
	
</script>
</head>
<body>
	<nav aria-label="breadcrumb" style="position: fixed; top: 0; overflow: hidden; width: 100%;">
		<ol class="breadcrumb">
			<li class="breadcrumb-item active" aria-current="page">搜尋</li>
			<li style="position:absolute; right:10px; top:5px;"><button class="btn btn-primary" onclick="logout()">登出</button></li>
		</ol>
	</nav>
	<div class="container" style="margin-top: 70px;">
		<div>
			<form action="search" method="post" style="width:50%; float:left;">
				<label>類別 :</label>
				<select id="bookClassName" name="bookClassName">
					<option value="">請選擇類別</option>
					<c:forEach var="i" begin="0" end="${respSearch.size()-1}" step="1">
						<option value="${respSearch.get(i).bookClassName}">
							${respSearch.get(i).bookClassName}
						</option>
					</c:forEach>
				</select>
				書名 : <input type="text" id="bookName" name="bookName" placeholder="請輸入書名">
				<input class="btn btn-secondary" type="submit" value="搜尋">
			</form>
			<button class="btn btn-success" style="float:left;" onclick="showInsert()">新增</button>
		</div>
		<table class="table table-hover">
			<thead class="thead-light">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">BookName</th>
					<th scope="col">bookClass</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<c:if test="${respBooks != null}">
				${respNoBook}
				<c:if test="${respBooks.size()>0}">
					<tbody>
						<c:forEach var="i" begin="0" end="${respBooks.size()-1}" step="1">
							<tr>
								<td scope="row">${respBooks.get(i).bookId}</td>
								<td scope="row">${respBooks.get(i).bookName}</td>
								<td scope="row">${respBooks.get(i).bookClass.bookClassName}</td>
								<td scope="row">
									<a class="btn btn-success" type="button" href="/update?id=${respBooks.get(i).bookId}">修改</a>
									<button class="btn btn-danger" onclick="doDelete(this)" id="btDelete" value="${respBooks.get(i).bookId}">刪除</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</c:if>
		</table>
		
		<div id="insertDiv" style="display: none;" class="modal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">新增</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="cancelInsert()">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<label>類別 :</label>
						<select id="insertBookClassName" name="insertBookClassName">
							<option value="">請選擇類別</option>
							<c:forEach var="i" begin="0" end="${respSearch.size()-1}" step="1">
								<option value="${respSearch.get(i).bookClassName}">
									${respSearch.get(i).bookClassName}
								</option>
							</c:forEach>
						</select>
						<br><br>
						書名 : <input type="text" id="insertBookName" name="insertBookName" placeholder="請輸入書名"><br><br>
						<button style="float: right;" id="btInsert" class="btn btn-primary" onclick="insert()">新增</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>