<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模拟登陆、注销</title>
 <link href="../css/themes/default/easyui.css" rel="stylesheet" type="text/css" />
  <link href="../css/themes/icon.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">
  $(function(){
	 $('#login').click(function(){
		 $.ajax({
				url: "/SpringMVC/demo/login",
				type: "POST",
				dataType:'json',
				data:{},
				success: function(json) {
					if(json.result == "ok"){
						$.messager.alert('返回信息',json.msg);
					} else {
						$.messager.alert('返回信息',json.msg);
					}},
				error: function(er) {
					$.messager.alert('返回信息','服务器错误');} 
			});
	 });
	 $('#logout').click(function(){
		 $.ajax({
				url: "/SpringMVC/demo/logout",
				type: "POST",
				dataType:'json',
				data:{},
				success: function(json) {
					if(json.result == "ok"){
						$.messager.alert('返回信息',json.msg);
					} else {
						$.messager.alert('返回信息',json.msg);
					}},
				error: function(er) {
					$.messager.alert('返回信息','服务器错误');
				} 
			});
	 });
  });
</script>
</head>
<body>
<div>
  <input type="button" value="用户登陆" id ="login" ">
  <input type="button" value="用户注销" id ="logout">

</div>	

</body>
</html>