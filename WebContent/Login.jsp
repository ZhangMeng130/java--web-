<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
</head>
<body>
	<!-- 为用户输入创建表单，采用post方法提交表单到action指向的servlet-->
	<form action="Login" method="post">
		<table>
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="username" id="username"></td>
			</tr>
			
			<tr>
				<td>密码：</td>
				<td><input type="password" name="password" id="password"></td>
			</tr>
			
			<tr>
				<td>验证码：</td>
			  	<td><input  type="text" name="checkCode"></td>
			  	<!--使用img标签将ImageServlet中创建好的验证码图片插入页面 -->
    			<td><img alt="验证码" id="imagecode" src="ImageServlet"></td>
    			<!--创建刷新验证码的js代码的超链接 -->
    			<td><a href="javascript:reloadCode();">看不清楚</a></td>
			</tr>
			
			<tr>
				<td><input type="submit" value=登录></td>
			</tr>
			
		</table>
	</form>
	
	<!--当输入不正确时，输出提示信息 -->
	<font color="red">
		<%
			if(request.getAttribute("message")!= null){
				out.print(request.getAttribute("message"));
				}
		%>
	</font>
	
	<!--在点击页面中的看不清楚时，实现验证码的刷新-->
	<script type="text/javascript">
		function reloadCode()
    	{
       		var time=new Date().getTime();
        	document.getElementById("imagecode").src="ImageServlet?d="+time;
    	}		
	</script>
	 
</body>
</html>
