<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异常处理</title>
</head>
<body>
<div>
    ${demo}<br/>
    ${demo1}<br/>
    ${demo2}<br/>
  <div>
		<c:forEach items="${map }" var="m">
		
		${m.key }:${m.value }
		
		</c:forEach>
	</div>

</div>	

</body>
</html>