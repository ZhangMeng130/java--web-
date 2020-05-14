package cqu.edu.cn.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response); // 使用doPost方法
	}

	/**
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username"); // 从前台接收用户名和密码
		String password = request.getParameter("password");
		String name = "Dong"; // 这里没有连接数据库 写死了一个用户名和密码
		String pwd = "12345";
		String piccode = (String) request.getSession().getAttribute("piccode");
		String checkCode = request.getParameter("checkCode"); // 获取随机生成的验证码和用户输入的验证码
		checkCode=checkCode.toUpperCase(); //把字符全部转换为大写的（可以用于验证码不区分大小写）
		response.setContentType("text/html;charset=UTF-8");// 解决乱码问题
		if (checkCode.equals(piccode)) { //验证码输入正确
			if (username.equals(name) && password.equals(pwd)) { // 将写死的用户名和密码与前台接收来的数据进行对比
				response.sendRedirect("Loginsuccess.jsp"); // 正确则跳转到登录成功页面
			} else { // 如果登录失败，则往request域对象中存入登录失败的提示信息，然后通过请求的转发的方式跳转回登录页面并显示
				request.setAttribute("message", "账号或密码错误，请重新登录<br>");
				request.getRequestDispatcher("/Login.jsp").forward(request, response);

			}
		} else {//验证码输入错误
			request.setAttribute("message", "验证码错误，请重新输入<br>");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}

	}

}
