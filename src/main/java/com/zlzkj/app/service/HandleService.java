package com.zlzkj.app.service;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import chat.ChatHandler;

import com.alibaba.fastjson.JSONObject;
import com.zlzkj.app.util.RobotUtil;


@Service
@Transactional
public class HandleService {
	
	//监听接口
    public static final int port = 8086;
    
    private Socket client;
    
    DataOutputStream dos = null;  
    
	@Autowired
	private DataService dataService;
	
	TimerTask task;
	Timer timer;
    

    public void init() {    
    	 ServerSocket serverSocket = null;  
         try {    
             serverSocket = new ServerSocket(port);    
             while (true) {    
                 client = serverSocket.accept();
                 //一个客户端连接就开户两个线程处理读写    
                 new Thread(new ReadHandlerThread(client,dataService)).start();    

                 //向客户端回复信息    
                 dos = new DataOutputStream(client.getOutputStream());   
                 //new Thread(new WriteHandlerThread(client,users)).start();   
             }    
         } catch (Exception e) {    
             //e.printStackTrace();    
         } finally{  
             try {  
                 if(serverSocket != null){  
                     serverSocket.close();  
                 }  
             } catch (IOException e) {  
                 e.printStackTrace();  
             }  
         }  
     }    

    
    
    public boolean sendAction(String order){
    	//Socket socket = sockets.get(robotId);
    	try {
            //BufferedReader br = null;  
           
            //br = new BufferedReader(new InputStreamReader(System.in));  
            //String send = br.readLine();    
            //发送数据  
            dos.writeUTF(order); 
            
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} 
    	return true;
    }
    

     public JSONObject newResult(){
    	 return null;
     } 
	
	//if(data.getString("action").equals("0x02")){
	
	//for(WebSocketSession user:users.values()){
		
		/*String ph = data.getString("PH");
		String O2 = data.getString("O2");
		String T = data.getString("T");
		String content =dataService.checkO2(O2);
		content =dataService.checkTemp(O2);
		content =dataService.checkPh(O2);
		if(content!=null){*/

			/*JSONObject jo = new JSONObject();
			jo.put("status", 1);
			jo.put("contet",information);
			
		new ChatHandler().broadCast(jo.toJSONString());*/
		/*	}*/
		
		//用websocket将新产生的数据传送到已登录的web端和移动端
		//user.sendMessage(new TextMessage(/*dataService.newResult(data)*/.toString()));
	//}
//}

/*if(data.getString("action").equals("0x01")){
    final String areaId = data.getString("areaId");
    final String coordinate = data.getString("coordinate");
    final String robotId = data.getString("robotId");
    try{
        //定时移动
        timer = new Timer();
        task = new TimerTask() {
			@Override
			public void run() {
            	List<Row> points = dataService.getPoints(areaId);
            	int now_number = 0;
            	for(;;now_number++){
            		if(coordinate.equals(points.get(now_number).getString("coordinate"))){
            			if(now_number==points.size())
            				now_number=0;
            			else
            				now_number++;
        				JSONObject order = new JSONObject();
        				order.put("action", RobotUtil.ROBOT_MOVE);//例如 action="0x02"
        				order.put("coordinate", RobotUtil.ROBOT_MOVE);
        				sendAction(robotId, order);
            		}
            	}
            	
				//System.out.println("开始移动");
			}
		};
		timer.schedule(task, 5*60*60*1000);
    }catch(Exception e){
    	System.out.println("错误" + e.getMessage());    
    }
}*/
}
/*  
 *处理读操作的线程   
 */  
class ReadHandlerThread implements Runnable{  
    private Socket client;  
    DataService dataService;
  
    public ReadHandlerThread(Socket client,DataService dataService) {  
    	this.dataService = dataService;
        this.client = client;  
    }  
  
    @Override  
    public void run() {  
        DataInputStream dis = null;  
        try{  
            while(true){  
                //读取客户端数据    
                dis = new DataInputStream(client.getInputStream());  
                String reciver = dis.readUTF();  
                System.out.println("客户端发过来的内容:" + reciver);   

                JSONObject data = parsing(reciver);
                
                String ph = data.getString("PH");
        		String O2 = data.getString("O2");
        		String T = data.getString("T");

        		String jd = data.getString("JD");
        		String wd = data.getString("WD");
        		String coordinate = "("+jd.substring(0,jd.length()-1)+","+wd.substring(0,jd.length()-1)+")";

        		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        		String time = sdf.format(new Date());

        		String warning = "";
        		int id = 0;
        		
        		
        		String result = dataService.checkPh(ph);
        		if(!result.equals("")){
        			warning = "在坐标点（"+coordinate+")"+result;
        			id = dataService.newPh(ph, coordinate, 0,time);
        			dataService.newWarning(RobotUtil.PH, time,warning,id);
            		JSONObject jo = new JSONObject();
        			jo.put("warning", dataService.getLastWarning());
            		new ChatHandler().broadCast(jo.toJSONString());
        		}else{
        			id = dataService.newPh(ph, coordinate, 1,time);
        		}
        		
        		result = dataService.checkO2(O2);
        		if(!result.equals("")){
        			warning = "在坐标点（"+coordinate+")"+result;
        			dataService.newWarning(RobotUtil.O2, time,warning,id);
            		dataService.newO2(O2, coordinate, 0,time);
            		
            		JSONObject jo = new JSONObject();
        			jo.put("warning", dataService.getLastWarning());
            		new ChatHandler().broadCast(jo.toJSONString());
        		}else{
            		dataService.newO2(O2, coordinate, 1,time);
        		}

        		result = dataService.checkTemp(T);
        		if(!result.equals("")){
        			warning = "在坐标点（"+coordinate+")"+result;
            		dataService.newTemp(T, coordinate, 0,time);
        			dataService.newWarning(RobotUtil.TEMPERATURE, time,warning,id);
            		JSONObject jo = new JSONObject();
        			jo.put("warning", dataService.getLastWarning());
            		new ChatHandler().broadCast(jo.toJSONString());
        		}else{
            		dataService.newTemp(T, coordinate, 1,time);
        		}
        		
        		System.out.println("last_id=======>"+id);
        		
        		String content = "接收到最新数据,ph值:"+ph+",溶氧率;"+O2+",温度:"+T+",经纬度:"+coordinate;
        		
        		JSONObject jo = new JSONObject();
    			jo.put("status", 1);
    			jo.put("content",content);
        		new ChatHandler().broadCast(jo.toJSONString());
            }  
        }catch(Exception e){  
            e.printStackTrace();  
        }finally{  
            try {  
                if(dis != null){  
                    dis.close();  
                }  
                if(client != null){  
                    client = null;  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }  

    public JSONObject parsing(String result){
    	String[] datas = result.split(" ");
    	JSONObject jo = new JSONObject();
    	jo.put("action", datas[0]);
    	for(int i=1;i<datas.length;i++){
    		String[] data = datas[i].split(":");
    		jo.put(data[0], data[1]);
    	}
    	return jo;
    }
}  
  
/*  
 * 处理写操作的线程  
 */  
/*class WriteHandlerThread implements Runnable{  
    private Socket client;  
    Map<String,WebSocketSession> users;
  
    public WriteHandlerThread(Socket client,Map<String,WebSocketSession> users) { 
    	this.users = users;
        this.client = client;  
    }  
  
    @Override  
    public void run() {  
        DataOutputStream dos = null;  
        BufferedReader br = null;  
        try{  
            while(true){  
                //向客户端回复信息    
                dos = new DataOutputStream(client.getOutputStream());    
                System.out.print("请输入:\t");    
                // 键盘录入    
                br = new BufferedReader(new InputStreamReader(System.in));  
                String send = br.readLine();    
                //发送数据  
                dos.writeUTF(send);    
            }  
        }catch(Exception e){  
            e.printStackTrace();  
        }finally{  
            try {  
                if(dos != null){  
                    dos.close();  
                }  
                if(br != null){  
                    br.close();  
                }  
                if(client != null){  
                    client = null;  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }  
}  */