package chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.Bean;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.zlzkj.app.service.HandleService;

@Component("BeanDefineConfigue")
public class BeanDefineConfigue implements ApplicationListener<ContextRefreshedEvent> {

	// @Autowired
	// private IRoleDao roleDao;

	@Autowired
	private HandleService service;

    @Bean
    public ChatHandler chatHandler() {
        return new ChatHandler();
    }
    
	/**
	* 当一个ApplicationContext被初始化或刷新触发
	*/
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		System.out.println("spring容易初始化完毕================================================");
		MyThread myThread = new MyThread();
		Thread thread = new Thread(myThread);  
		thread.start();
	}
	public class MyThread  implements Runnable {  
		public void run() {  
			//Service server = new Service(chatHandler().getWebSocketSessions());
			service.init();    
		}  
	}  

}
