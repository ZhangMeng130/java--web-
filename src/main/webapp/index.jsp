<form action="<%= request.getContextPath()%>/servlet/LoginServlet" method="get" >
    验证码:<input  type="text" name="checkCode"/>
    <img alt="验证码" id="imagecode" src="<%= request.getContextPath()%>/servlet/ImageServlet"/>
    <a href="javascript:reloadCode();">看不清楚</a><br>
    <input type="submit" value="提交">
    </form>