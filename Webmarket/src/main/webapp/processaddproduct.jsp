<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>


<%
	request.setCharacterEncoding("UTF-8");
	

	String filename = "";
	String realfolder = request.getServletContext().getRealPath("/resources/images");	//웹 애플리케이션상의 절대 경로
	int maxsize = 5*1024*1024; 			//최대 업로드될 파일의 크기 5MB
	String enctype = "UTF-8";			//인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realfolder,maxsize,enctype,new DefaultFileRenamePolicy());

	String productid = multi.getParameter("productid");
	String name = multi.getParameter("name");
	String unitprice = multi.getParameter("unitprice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsinstock = multi.getParameter("unitsinstock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitprice.isEmpty())
		price=0;	
	else
		price = Integer.valueOf(unitprice);
	
	long stock;
	
	if(unitsinstock.isEmpty())
		stock = 0;
	else
		stock=Long.valueOf(unitsinstock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, productid);
	pstmt.setString(2, name);
	pstmt.setString(3, unitprice);
	pstmt.setString(4, description);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, category);
	pstmt.setString(7, unitsinstock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		conn.close();
	}
	
	response.sendRedirect("products.jsp");
	
	

%>