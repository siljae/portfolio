<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<nav class="navbar navbar-expand  navbar-dark bg-dark">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath() %>/welcome.jsp">Home</a>
		</div>
		<div>
			<ul class="navbar-nav mr-auto">				
					<% if(sessionId ==null)
						{
					%>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/loginMember.jsp">로그인 </a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/addMember.jsp">회원 가입</a></li>
					<%
						}
						else{
					%>
						<li style="padding-top: 7px; color: white">[<%=sessionId%>님]</li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/logoutMember.jsp">로그아웃 </a></li>
						<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/member/updateMember.jsp">회원 수정</a></li>
					<%
						}
					%>
				
				<li class="nav-item"><a class="nav-link" href="<c:url value="/products.jsp"/>">상품 목록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/addproduct.jsp"/>">상품 등록</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editproduct.jsp?edit=update"/>">상품 수정</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/editproduct.jsp?edit=delete"/>">상품 삭제</a></li>
				<li class="nav-item"><a class="nav-link" href="<c:url value="/BoardListAction.do?pageNum=1"/>">게시판</a></li>
			</ul>
		</div>
	</div>
</nav>
