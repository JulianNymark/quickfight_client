require "setup"

function love.load()
	modes = { menu=menu, game=client }
	mode = "game"
	init = true
end

function love.draw()
	if modes[mode].draw then
		modes[mode].draw()
	end
end

function love.update( dt )
	if init and modes[mode].init then
		modes[mode].init()
		init = false
	end

	if modes[mode].update then
		modes[mode].update( dt )
	end
end
