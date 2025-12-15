local Players=game:GetService("Players")
local ReplicatedStorage=game:GetService("ReplicatedStorage")
local TextChatService=game:GetService("TextChatService")
local player=Players.LocalPlayer

local gui=Instance.new("ScreenGui")
gui.ResetOnSpawn=false
gui.IgnoreGuiInset=true
gui.Parent=player:WaitForChild("PlayerGui")

local frame=Instance.new("Frame")
frame.Size=UDim2.new(0,320,0,140)
frame.Position=UDim2.new(0.5,-160,0.5,-70)
frame.BackgroundColor3=Color3.fromRGB(40,40,40)
frame.Active=true
frame.Draggable=true
frame.Parent=gui

local title=Instance.new("TextLabel")
title.Size=UDim2.new(1,-40,0,30)
title.Position=UDim2.new(0,10,0,5)
title.Text="Chat Sender"
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1
title.TextXAlignment=Enum.TextXAlignment.Left
title.Parent=frame

local close=Instance.new("TextButton")
close.Size=UDim2.new(0,30,0,30)
close.Position=UDim2.new(1,-35,0,5)
close.Text="X"
close.TextColor3=Color3.new(1,1,1)
close.BackgroundColor3=Color3.fromRGB(120,40,40)
close.Parent=frame

local box=Instance.new("TextBox")
box.Size=UDim2.new(1,-20,0,40)
box.Position=UDim2.new(0,10,0,45)
box.Text=""
box.BackgroundColor3=Color3.new(1,1,1)
box.TextColor3=Color3.new(0,0,0)
box.Parent=frame

local send=Instance.new("TextButton")
send.Size=UDim2.new(1,-20,0,40)
send.Position=UDim2.new(0,10,0,95)
send.Text="OK"
send.BackgroundColor3=Color3.fromRGB(60,60,60)
send.TextColor3=Color3.new(1,1,1)
send.Parent=frame

local open=Instance.new("TextButton")
open.Size=UDim2.new(0,50,0,50)
open.Position=UDim2.new(0.5,-25,0.5,-25)
open.Text="●"
open.TextSize=24
open.TextColor3=Color3.new(1,1,1)
open.BackgroundColor3=Color3.fromRGB(60,60,60)
open.Visible=false
open.Active=true
open.Draggable=true
open.Parent=gui

local corner=Instance.new("UICorner")
corner.CornerRadius=UDim.new(1,0)
corner.Parent=open

send.MouseButton1Click:Connect(function()
	if box.Text=="" then return end
	if TextChatService.ChatVersion==Enum.ChatVersion.TextChatService then
		TextChatService.TextChannels.RBXGeneral:SendAsync(box.Text)
	else
		ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(box.Text,"All")
	end
	box.Text=""
end)

close.MouseButton1Click:Connect(function()
	frame.Visible=false
	open.Visible=true
end)

open.MouseButton1Click:Connect(function()
	frame.Visible=true
	open.Visible=false
end)