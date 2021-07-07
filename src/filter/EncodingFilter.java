package filter;


import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

//实现全站同一编码 utf-8 防止出现乱码
public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        //处理请求乱码
        HttpServletRequest httpServletRequest = (HttpServletRequest)servletRequest;  //经典父到子强转
       //自定义的强化request对象
        HttpServletRequest myRequest = new MyRequest(httpServletRequest);
        //处理响应乱码
        servletResponse.setContentType("text/html;charset=utf-8");
        filterChain.doFilter(myRequest,servletResponse);

    }

    @Override
    public void destroy() {

    }
}
//自定义request对象 封装并强化方法
class MyRequest extends HttpServletRequestWrapper{

    private HttpServletRequest request;
    private boolean hasEncode;
    public MyRequest(HttpServletRequest request) {
        super(request);          //子类中父类的构造方法必须调用
        this.request = request;
    }
    //对需要增强的方法 进行覆盖
    @Override
    public Map getParameterMap(){
        //先获得请求方式 get or post
        String method = request.getMethod();
        if(method.equalsIgnoreCase("post")){
            //如果为post请求
            try {
                request.setCharacterEncoding("utf-8");
                return request.getParameterMap();
            }catch (UnsupportedEncodingException e){
                e.printStackTrace();
            }
        }else if (method.equalsIgnoreCase("get")){
            //get请求
            Map<String,String[]> parameterMap = request.getParameterMap();
            if(!hasEncode){  //确保编码后不会再次被执行
                for (String parameterName:parameterMap.keySet()){
                    String[] values = parameterMap.get(parameterName);
                    if(values!=null){
                        for (int i=0;i<values.length;i++){
                            try {
                                values[i] = new String(values[i].getBytes("iso8859-1"),"utf-8");
                            }catch (UnsupportedEncodingException e){
                                e.printStackTrace();
                            }
                        }
                    }
                }
                hasEncode = true;
            }
            return parameterMap;
        }
        return super.getParameterMap();
    }

    @Override
    public String getParameter(String name) {
        Map<String,String[]> parameterMap = getParameterMap();
        String[] values = parameterMap.get(name);
        if(values==null){
            return null;
        }
        return values[0];  //返回参数的第一个值
    }

    @Override
    public String[] getParameterValues(String name) {
        Map<String,String[]> parameterMap = getParameterMap();
        String[] values = parameterMap.get(name);
        return values;
    }
}
