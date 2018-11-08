package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

/**
 * 自定义的Filter用于处理乱码， Filter的名字是Servlet3Filter，表示urlPatterns="/*"该Filter拦截所有的请求，
 * initParams使用这个设置初始化参数
 */
@WebFilter(filterName = "EncodeFilter", urlPatterns = "/*", initParams = {@WebInitParam(name = "encode", value = "UTF-8") })
public class EncodeFilter implements Filter {

	private String encode = null;

	public EncodeFilter() {
	}
	@Override
	public void destroy() {
		encode = null;
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		if (null == request.getCharacterEncoding()) {
			request.setCharacterEncoding(encode);// 设置request编码
			response.setContentType("text/html;charset=" + encode);// 设置response编码
		}
//		System.out.println("set encode:" + encode);
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
		// 获取初始化时设置的编码
		String encode = fConfig.getInitParameter("encode");
		if (this.encode == null) {
			this.encode = encode;// 查找配置文件中欲设的字符集编码
		}
	}

}
