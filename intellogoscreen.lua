--Animations for Advapi Proof of Concept.
-- FallingBricks
os.loadAPI("advapi")
mon = peripheral.find("monitor")
mst,mstc,msb,msbu = advapi.createScreen(mon)
commands = {}
commands[1] = {1,30," ",colors.black,colors.red} 
commands[2] = {2,30," ",colors.black,colors.red} 
commands[3] = {3,30," ",colors.black,colors.red} 
commands[4] = {4,30," ",colors.black,colors.red} 
commands[5] = {5,30," ",colors.black,colors.red} 
commands[6] = {6,30," ",colors.black,colors.red} 
commands[7] = {7,30," ",colors.black,colors.red} 
commands[8] = {1,29," ",colors.black,colors.orange} 
commands[9] = {2,29," ",colors.black,colors.orange} 
commands[10] ={3,29," ",colors.black,colors.orange} 
commands[11] ={4,29," ",colors.black,colors.orange} 
commands[12] ={5,29," ",colors.black,colors.orange} 
commands[13] ={6,29," ",colors.black,colors.orange} 
commands[14] ={1,28," ",colors.black,colors.orange} 
commands[15] ={2,28," ",colors.black,colors.orange} 
commands[16] ={3,28," ",colors.black,colors.orange} 
commands[17] ={4,28," ",colors.black,colors.orange} 
commands[18] ={5,28," ",colors.black,colors.orange} 
commands[19] ={1,27," ",colors.black,colors.orange} 
commands[20] ={2,27," ",colors.black,colors.orange} 
commands[21] ={3,27," ",colors.black,colors.orange} 
sprites = {} -- Sprites table with all the falling bricks(makes a logo i guess?)
--stationary_render = {} -- Sprites which arent moving any more.
function addSprite(targetx,targety,charecter,textColor,BackgroundColor)
	table.insert(sprites,{targetx,1,targety,charecter,textColor,BackgroundColor})
end
function renderSprites(instance,mst,mstc,msb,msbu)
	for spriteIndex=1,#sprites do
		mst,mstc,msb,msbu = advapi.writePixel(instance,mst,mstc,msb,msbu,sprites[spriteIndex][1],sprites[spriteIndex][2],sprites[spriteIndex][5],sprites[spriteIndex][6],sprites[spriteIndex][4])	
	end
	return mst,mstc,msb,msbu
	
end
function udpateSprites() 
	finished = true
	for spriteIndex=1,#sprites do
		if sprites[spriteIndex][2] ~= sprites[spriteIndex][3] then
			sprites[spriteIndex][2] += 1
			finished = false
		end
	
	end
	return finished

end
function runAnimation()
	prog_frame = 1
	while true do
		mst,mstc,msb,msbu = advapi.createScreen(mon)
		if (prog_frame <= #commands) then
			addSprite(commands[i][1],commands[i][2],commands[i][3],commands[i][4],commands[i][5])
		end
		mst,mstc,msb,msbu = renderSprites(instance,mst,mstc,msb,msbu);
		advapi.updateScreen(instance,mst,mstc,msb,msbu)
		sleep(0.1)
	end
end