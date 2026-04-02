-- Guarda este archivo como RivalsPanel.lua

local TweenService = gameGetService(TweenService)
local UIS = gameGetService(UserInputService)
local player = game.Players.LocalPlayer

local gui = Instance.new(ScreenGui, playerWaitForChild(PlayerGui))
gui.Name = RivalsGodUI
gui.ResetOnSpawn = false

local states = {}
local active = 0

local main = Instance.new(Frame, gui)
main.Size = UDim2.new(0, 620, 0, 400)
main.Position = UDim2.new(0.5, -310, 0.5, -200)
main.BackgroundColor3 = Color3.fromRGB(12,10,5)
main.BorderSizePixel = 0
Instance.new(UICorner, main).CornerRadius = UDim.new(0,14)

local top = Instance.new(Frame, main)
top.Size = UDim2.new(1,0,0,45)
top.BackgroundColor3 = Color3.fromRGB(20,15,5)

local title = Instance.new(TextLabel, top)
title.Text = ⚔ RIVALS PANEL — GOD UI
title.Size = UDim2.new(1,0,1,0)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(212,170,80)
title.Font = Enum.Font.GothamBlack

-- DRAG
local dragging, dragStart, startPos
top.InputBeganConnect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = true
dragStart = input.Position
startPos = main.Position
end
end)

UIS.InputChangedConnect(function(input)
if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
local delta = input.Position - dragStart
main.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end
end)

UIS.InputEndedConnect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1 then
dragging = false
end
end)

local status = Instance.new(TextLabel, main)
status.Size = UDim2.new(1,0,0,20)
status.Position = UDim2.new(0,0,1,-20)
status.BackgroundColor3 = Color3.fromRGB(8,6,2)
status.TextColor3 = Color3.fromRGB(200,160,80)
status.Text = Listo  Activas 0

local function updateStatus(text)
status.Text = text..  Activas ..active
end

local function toggle(name)
states[name] = not states[name]
active = 0
for _,v in pairs(states) do
if v then active += 1 end
end
updateStatus(name.. ..(states[name] and ON or OFF))
end

local function createToggle(parent, text, y, name)
local frame = Instance.new(Frame, parent)
frame.Size = UDim2.new(0,260,0,40)
frame.Position = UDim2.new(0,20,0,y)
frame.BackgroundColor3 = Color3.fromRGB(25,18,5)
Instance.new(UICorner, frame)

```
local label = Instance.new(TextLabel, frame)
label.Text = text
label.Size = UDim2.new(1,-60,1,0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(230,200,120)

local toggleBtn = Instance.new(Frame, frame)
toggleBtn.Size = UDim2.new(0,40,0,20)
toggleBtn.Position = UDim2.new(1,-50,0.5,-10)
toggleBtn.BackgroundColor3 = Color3.fromRGB(60,30,10)
Instance.new(UICorner, toggleBtn).CornerRadius = UDim.new(1,0)

local circle = Instance.new(Frame, toggleBtn)
circle.Size = UDim2.new(0,16,0,16)
circle.Position = UDim2.new(0,2,0.5,-8)
circle.BackgroundColor3 = Color3.new(1,1,1)
Instance.new(UICorner, circle).CornerRadius = UDim.new(1,0)

frame.InputBeganConnect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		toggle(name)

		local goal = states[name] and UDim2.new(1,-18,0.5,-8) or UDim2.new(0,2,0.5,-8)

		TweenServiceCreate(circle, TweenInfo.new(0.2), {
			Position = goal
		})Play()

		toggleBtn.BackgroundColor3 = states[name]
			and Color3.fromRGB(200,160,60)
			or Color3.fromRGB(60,30,10)
	end
end)
```

end

local content = Instance.new(Frame, main)
content.Size = UDim2.new(1,0,1,-65)
content.Position = UDim2.new(0,0,0,45)
content.BackgroundTransparency = 1

createToggle(content,Modo Visual,40,visual)
createToggle(content,UI Animations,90,anim)
createToggle(content,Debug Mode,140,debug)
createToggle(content,Performance Mode,190,perf)

main.Size = UDim2.new(0,0,0,0)
TweenServiceCreate(main,TweenInfo.new(0.4,Enum.EasingStyle.Back),{
Size = UDim2.new(0,620,0,400)
})Play()
