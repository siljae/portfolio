<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 체크</title>
    <style>
        body
        {
            background-color: #fec6ca;
        }
        .email
        {
            height: 20px;
        }
        .email_check
        {
            border: none;
            background-color: #e4e4e6;
            padding: 4px;
            cursor: pointer;
        }
        .email_check_box
        {
            display: flex;
            justify-content: end;
            margin-top: 10px;
            margin-right: 20px;
        }
        .email_submit
        {
            border: 1px solid;
            border-radius: 5px;
            background-color: #ff8ea3;
            padding: 3px 10px;
        }
        .email_close
        {
            border: 1px solid;
            border-radius: 5px;
            background-color: #ff8ea3;
            padding: 3px 10px;
            margin-left: 10px;
        }
    </style>
    <script>
	    window.onload = function(){
			let msg = '${msg}';
			if(msg == null){}
			if (msg == 1){
				alert("해당 닉네임은 사용중입니다!\n새로운 닉네임을 입력해주세요!");
			}
			if(msg == 2){
                alert("해당 닉네임을 사용할 수 있습니다!");
                let name = document.getElementById('name').value;
                window.close();
                let parentname = window.opener.document.getElementById('maskname');
                window.opener.namedecide();
                parentname.value = name.toString();
            }
        }
        function popup_close(){
            window.close();
        }
    </script>        
</head>
<body>
    <div class="container">
        <h2>닉네임 중복 체크</h2>
        <form action="<c:url value="/login/chkname"/>" method="post">
            닉네임  <input type="text" id="name" name="name" class="name" value="${name}" required
            pattern="^[가-힣a-zA-Z]{2,6}$" title="닉네임은 2~6글자의 한글과 영어만 입력해야 합니다.">        
            <input type="submit" value="중복확인" class="email_check">
            <br>
        </form>
        <div class="email_check_box">
            <button onclick="popup_close()" class="email_close">닫기</button>
        </div>
    </div>
</body>
</html>