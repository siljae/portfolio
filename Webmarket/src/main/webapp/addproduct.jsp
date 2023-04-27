<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="class-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korea</a> | <a href="?language=en">English</a>
			| <a href="logout.jsp" class="btn btn-sm btn-success pull-right">Logout</a>
		</div>
		<form name="newproduct" action="./processaddproduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productid"/></label>
				<div class="col-sm-3">
					<input type="text" name="productid" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname"/></label>
				<div class="col-sm-3">
					<input type="text" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitprice"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitprice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsinstock"/></label>
				<div class="col-sm-3">
					<input type="text" name="unitsinstock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition"/></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="new"><fmt:message key="condition_New"/>
					<input type="radio" name="condition" value="old"><fmt:message key="condition_Old"/>
					<input type="radio" name="condition" value="refurbished"><fmt:message key="condition_Refurbished"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productimage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productimage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="<fmt:message key="button"/>">
				</div>
			</div>
			
		</form>
	</div>
	</fmt:bundle>
	<jsp:include page="footer.jsp"/>
</body>
</html>