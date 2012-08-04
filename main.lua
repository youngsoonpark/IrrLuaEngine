
function createButton(w,x,y)
	local btn = Button.new(x,y+25,100,100,"0","")
	btn.test = 0

	btn.onButton = function(this)
		this.enabled = not this.enabled
	end

	btn.onHover = function(this)
		this.test = this.test + 1
		this.text = this.test
	end
	
	if w then
		w:addElement(btn)
	end
	
	return btn
end

function createWindow(k)
	local w = Widget.new(100,100,k*100+10,k*100+25,"Hi")
	w.onWindowClose = function(this)
		print("close")
	end
	
	for i=0, k-1 do
		for y=0, k-1 do
			createButton(w,y*100,i*100)
		end
	end
	return w
end

open = Button.new(100,10,100,100,"Open","")
function open:onButton() 
	if window then
		window:remove()
	end
	
	window = createWindow(3)
end

dogc = Button.new(210,10,100,100,"Do GC","")
function dogc:onButton() 
	collectgarbage("collect")
end

rem = Button.new(320,10,100,100,"Remove this!","")
function rem:onButton() 
	self:remove()
end

timer = Button.new(430,10,100,100,"Time","")
timer.time = 0
function timer:onButton() 
	if timer.time ~= 0 then
		return
	end
	
	while true do
		timer.time = timer.time+1
		suspend()
		self.text = timer.time
	end

end

test = Button.new(10,110,100,100,"test","test!!!")

function timer:onButton() 
	print("testbutton id is: " .. self.id)
	print("testbutton taborder is: " .. self.tabOrder)
	
	--print(pcall(self.id = 1))

end

print("lua loaded")
