package chat;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.zlzkj.core.sql.Row;



@Component
public class ChatInterceptor extends HttpSessionHandshakeInterceptor{
	
	
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Map<String, Object> attributes) throws Exception {
        if (request instanceof ServletServerHttpRequest) {
            ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
            HttpSession session = servletRequest.getServletRequest().getSession(false);
            if (session != null) {
                attributes.put("userId",((Row)session.getAttribute("user")).getString("id"));
            }
        }
		//System.out.println("Before Handshake"+request.getHeaders());
        return super.beforeHandshake(request, response, wsHandler, attributes);
        //return true;
    }

    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        //System.out.println("After Handshake");
        //super.afterHandshake(request, response, wsHandler, ex);
    }

}
