package chat;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


@Configuration
@EnableWebMvc
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    	System.out.println("注册websocket");
        registry.addHandler(chatHandler(), "/chat").addInterceptors(new ChatInterceptor())
        //解决跨域问题
        .setAllowedOrigins("*");
        
    }

    @Bean
    public ChatHandler chatHandler() {
        return new ChatHandler();
    }

}
