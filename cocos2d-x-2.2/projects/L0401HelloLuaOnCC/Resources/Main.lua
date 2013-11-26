--print("Hello Lua")
local label = CCLabelTTF:create("Hello Lua","Courier",50)
label:setPosition(ccp(300,300))

local scene = CCScene:create()
local layer = CCLayer:create()
scene:addChild(layer)

layer:addChild(label)

CCDirector:sharedDirector():runWithScene(scene)