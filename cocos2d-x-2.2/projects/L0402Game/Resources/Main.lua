
require("Card")

function Main()
	
	local self = CCScene:create()
	local layer
	local allPoints
	local allCards={}
	local currentNum
	
	local function genPoints()
		
		allPoints = {}
		
		for i=0, 9 do
			for j=0, 5 do
				table.insert(allPoints,1,ccp(i*80,j*80))
			end
		end
	end
	
	local function addCards()
		
		math.randomseed(os.time())
		
		local c
		local randNum
		local p
		
		for var=1, 5 do
			c = Card(var)
			layer:addChild(c)
			
			randNum = math.random(table.maxn(allPoints))
			p=table.remove(allPoints,randNum)
			c:setPosition(p)
			
			table.insert(allCards,1,c)
		end
		
	end
	
	local function startGame()
		currentNum = 1
	
		genPoints()
		addCards()
		
	end
	
	local function showAllCardsBg()
		for key, var in pairs(allCards) do
			var:showBg()
		end
	end
	
	local function onTouch(type,x,y)
		local p = ccp(x,y)
		
		for key, var in pairs(allCards) do
			if var:boundingBox():containsPoint(p) then
				if currentNum==var.num then
					table.remove(allCards,key)
					layer:removeChild(var,true)
					
					if currentNum==1 then
						showAllCardsBg()
					end
					
					if table.maxn(allCards)<=0 then
						print("Success")
					end
					
					currentNum=currentNum+1
				end
				
				break
			end
		end
	end
	
	local function init()
		
		layer = CCLayer:create()
		self:addChild(layer)
		layer:setTouchEnabled(true)
		layer:registerScriptTouchHandler(onTouch);
		
		
		startGame()
		
--		local s = CCSprite:create("mn.jpg")
--		s:setPosition(ccp(300,300))
--		layer:addChild(s)
		
--		layer:setTouchEnabled(true)
--		layer:registerScriptTouchHandler( function (type,x,y)
--		
--			if s:boundingBox():containsPoint(ccp(x,y)) then
--				print("mn clicked")
--			end
--			print(type)
--			return true
--		end )
	end
	
	init()
	
	return self
	
end


local function __main()
	CCEGLView:sharedOpenGLView():setDesignResolutionSize(800,480,kResolutionShowAll)
	
	local dir = CCDirector:sharedDirector()
	dir:setDisplayStats(false)
	dir:runWithScene(Main())
end

__main()