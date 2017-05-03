package com.restaurant.filters;

import javax.servlet.*;
import java.io.IOException;

public class FilterEncoding implements Filter {

    public static final String FILTER_CONTENT_TYPE = "application/x-www-form-urlencoded";
    public static final String ENCODING_DEFAULT = "UTF-8";
    public static final String ENCODING_INIT_PARAM_NAME = "encoding";
    private String encoding;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter(ENCODING_INIT_PARAM_NAME);
        if (encoding == null)
            encoding =ENCODING_DEFAULT;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String contentType =request.getContentType();
        if (contentType != null && contentType.startsWith(FILTER_CONTENT_TYPE))
            request.setCharacterEncoding(encoding);
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
