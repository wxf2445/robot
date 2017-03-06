package chat;

import java.nio.charset.Charset;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.util.CharsetUtil;

public class Echo843ServerHandler extends ChannelInboundHandlerAdapter{
	public void channelRead(ChannelHandlerContext ctx,Object msg) throws Exception{
		ByteBuf in = (ByteBuf) msg;  
        String message = in.toString(Charset.forName("UTF-8"));  
        System.out.println(message);
		 if(message.toString().trim().equals("<policy-file-request/>")){  
	            ctx.writeAndFlush(Unpooled.copiedBuffer("<?xml version=\"1.0\"?><cross-domain-policy><allow-access-from domain=\"*\" to-ports=\"*\"/></cross-domain-policy>\0",CharsetUtil.UTF_8));  
	     } 
	}
}