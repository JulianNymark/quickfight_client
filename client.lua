client = {}

player = {}
player.loc = Vec( gr.getWidth()/2, gr.getHeight()/2 )

function client.init() 
	host = "localhost"
	port = 56789
	tcp = assert(socket.tcp())
	tcp:connect(host, port);
end

function client.update( dt ) 
	print("send()")
	tcp:send( "".. gr.getWidth()/2 ..",".. gr.getHeight()/2 .."\n")
	print("receive()")
	local line, err = tcp:receive()
	if not err then
		print("received: " .. line)
		local l = split(line, ",")
		player.loc.x = l[1]
		player.loc.y = l[2]
	end
end

function client.draw()
	gr.circle( "fill", player.loc.x, player.loc.y, 10, 10)
end
