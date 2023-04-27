<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%

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
	
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,productid);
	rs = pstmt.executeQuery();
	if(rs.next()){
		if(fileName != null){
			sql = "update product set p_name=?, p_unitprice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsinstock=?, p_condition=?, p_filename=? where p_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, fileName);
			pstmt.setString(9, productid);
			pstmt.executeUpdate();
		}
		else{
			sql = "update product set p_name=?, p_unitprice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsinstock=?, p_condition=? where p_id=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setLong(6, stock);
			pstmt.setString(7, condition);
			pstmt.setString(8, productid);
			pstmt.executeUpdate();
		}
	}
	if(rs != null){
		rs.close();
	}
	if(pstmt != null){
		pstmt.close();
	}
	if(conn != null){
		conn.close();
	}
	response.sendRedirect("editproduct.jsp?edit=update");
%>