<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
  ${demo}<br/>
  ${demo1}<br/>
  ${demo2}<br/>
  <div>
		<c:forEach items="${map }" var="m">
		
		${m.key }:${m.value }
		
		</c:forEach>
	</div>
	<div>..........................</div>
	<form action="/SpringMVC/demo/addUser" method="post">
	<div>
		${result }
	</div>
		<input type="submit" value="post请求">
	</form>
	<div>..........................</div>
	<div>
	    <form name="userForm" action="/SpringMVC/demo/uploadFile" method="post" enctype="multipart/form-data" >
		选择文件：<input type="file" name="file">
		<input type="submit" value="上传" >
		<br/>
		
		<span style="color: blue;">${msg }</span>
	
	</form>
	</div>
	<div>............@PathVariable..............</div>
	userId:${userId }.....topicId:${topicId }
</body>
</html>