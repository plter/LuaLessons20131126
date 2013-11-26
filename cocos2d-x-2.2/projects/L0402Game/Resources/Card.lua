function Card(num)
	
	local self = CCSprite:create()
	local txt,bg
	
	local function init()
		self.num = num
		self:setContentSize(CCSizeMake(80,80))
		self:setAnchorPoint(ccp(0,0))
		
		txt = CCLabelTTF:create(num,"Courier",50)
		txt:setPosition(ccp(40,40))
		self:addChild(txt)		
		
		bg = CCSprite:create()
		bg:setTextureRect(CCRectMake(0,0,80,80))
		bg:setAnchorPoint(ccp(0,0))
--		bg:setColor(ccc3(255,255,255))
		self:addChild(bg)
		
		self:showTxt()
	end
	
	self.showTxt = function ()
		txt:setVisible(true)
		bg:setVisible(false)
	end
	
	self.showBg = function ()
		txt:setVisible(false)
		bg:setVisible(true)
	end
	
	
	init()
	return self
	
end