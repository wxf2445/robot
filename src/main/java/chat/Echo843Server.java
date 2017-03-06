package chat;

import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.Channel;
import io.netty.channel.ChannelFuture;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;

public class Echo843Server {
	public void start() throws InterruptedException{
		EventLoopGroup group=new NioEventLoopGroup();
		ServerBootstrap boot=new ServerBootstrap();
		boot.group(group).channel(NioServerSocketChannel.class).localAddress(843).childHandler(
				new ChannelInitializer<Channel>() {
					protected void initChannel(Channel ch){
						ch.pipeline().addLast(new Echo843ServerHandler());
					}
				}
		);
		ChannelFuture f=boot.bind().sync();
		System.out.println(Echo843Server.class.getName()+"start on"+f.channel().localAddress());
		f.channel().closeFuture().sync();
	}
	public static void main(String [] args) throws InterruptedException{
		new Echo843Server().start();
	}
}