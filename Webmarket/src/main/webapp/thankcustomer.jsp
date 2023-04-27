<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<body>
	<%
		
		String shipping_cartId="";
		String shipping_name = "";
		String shipping_shippingDate ="";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for (int i=0;i<cookies.length;i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"UTF-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"UTF-8");
			}
		}
	%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <%=shipping_shippingDate %>에 배송될 예정입니다!
		<p>주문번호 : <%=shipping_cartId %>
	</div>
	<div class="container">
		<a href="./products.jsp" class="btn btn-secondary">&laquo;상품 목록</a>
	</div>
</body>
</html>

<%
	session.invalidate();

	for (int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if(n.equals("customer_Id"))
			thisCookie.setMaxAge(0);
		if(n.equals("customer_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("customer_phoneNumber"))
			thisCookie.setMaxAge(0);
		if(n.equals("customer_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("customer_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("customer_addressName"))
			thisCookie.setMaxAge(0);
		
		if(n.equals("shipping_cartId"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_name"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_country"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if(n.equals("shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}

%>