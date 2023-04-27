<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니추가</title>
</head>
<body>
	<%
		//product에서 장바구니 추가를 눌리면 id값을 가지고 와서 id값이 있는지 확인하고 없으면 products로 돌려보낸다
		String id = request.getParameter("id");
	
		if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		//id값이 null아니고 공백이 아니면 dao를 가져와서 dao안의 dto id와 product에서 가져온 id가 맞는지 확인하고 그 값이 null이면 예외처리JSP페이지로 보낸다
		ProductRepository dao = ProductRepository.getInstance();		
		Product product = dao.getProductById(id);
		
		if(product == null){
			response.sendRedirect("exceptionnoproductid.jsp");			
		}
		//product의 값이 존재하면 dao의 모든 dto를 가져와서 담을 ArrayList<Product>타입의 goodsList변수를 만들어서 담고
		ArrayList<Product> goodsList = dao.getAllProducts();
		Product goods = new Product();
		
		for(int i=0; i<goodsList.size();i++){
			goods= goodsList.get(i);
			//goods에 담긴 dao의 dto의 i번째 dto와 product에서 가져온 id가 같으면 break;하고 for문을 빠져나온다 
			if(goods.getProductId().equals(id)){
				break;
			}
		}
		//여기까지 product에서 가져온 id와 dao안의 dto id가 맞는지 확인하는 기능
		//아래부터는 장바구니 기능
		ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("cartlist");
		//list값이 null이면 ArrayList<Product>()생성자를 생성해서 list에 담고 session의 setAttribute로 키 "cartlist" , 값 list로 설정한다
		//장바구니 만들기
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartlist", list);
		}
		//product에서 장바구니에 추가 할 때마다 수량을 누적시키는 기능
		int cnt=0;
		Product goodsQnt = new Product();
		
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);			
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
		}
		if(cnt == 0 ){
			goods.setQuantity(1);
			list.add(goods);
		}
		
		response.sendRedirect("product.jsp?id="+id);
	%>
</body>
</html>