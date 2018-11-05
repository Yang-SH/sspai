package controller;

import java.io.IOException;


/**
 * 这是所有servlet的基类
 * 
 */
@WebServlet("/BaseServlet")
@SuppressWarnings("all")
public class BaseServlet extends HttpServlet {
	/**
	 * 这是servlet被创建时，准备执行的功能
	 */
	private String function;

	public String getFunction() {
		return function;
	}

	public BaseServlet() {
		super();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		System.out.println("uri:" + uri);
		// 在这里获取执行功能
		this.function = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));

	}

}
