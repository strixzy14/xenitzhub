--// Obfuscated Simple Version //--

local A = loadstring
local B = game
local C = "https://raw.githubusercontent.com/3345-c-a-t-s-u-s/NOTHING/main/source.lua"
local D = A(B:HttpGetAsync(C))()
local E = D.Notification()

E.new({
	Title = "Notification",
	Description = "Script Loaded",
	Duration = 5,
	Icon = "rbxassetid://8997385628"
})

local F = D.new({
	Title = "Xenitz Hub",
	Description = "Hi, Welcome!!!",
	Keybind = Enum.KeyCode.LeftControl,
	Logo = 'http://www.roblox.com/asset/?id=18898582662'
})

local G = F:NewTab({
	Title = "Mian",
	Description = "Auto farm",
	Icon = "rbxassetid://7733960981"
})

local H = G:NewSection({
	Title = "Section",
	Icon = "rbxassetid://7743869054",
	Position = "Left"
})

local I = G:NewSection({
	Title = "Information",
	Icon = "rbxassetid://7733964719",
	Position = "Right"
})

local J = CFrame.new(198, 454.4, 2)
local K = false
local L

H:NewToggle({
	Title = "auto farm win",
	Default = false,
	Callback = function(M)
		K = M
		if K then
			L = coroutine.create(function()
				while K do
					E.new({Title="Teleport",Description="wait for delay",Duration=5,Icon="rbxassetid://8997385628"})
					wait(5)
					E.new({Title="Teleport",Description="SUCCESS",Duration=3,Icon="rbxassetid://8997385628"})
					local N = B.Players.LocalPlayer
					local O = N.Character or N.CharacterAdded:Wait()
					O:WaitForChild("HumanoidRootPart").CFrame = J
					wait(3)
				end
			end)
			coroutine.resume(L)
		end
	end,
})

local P = false
local Q = 60
local R = nil
local S = nil

function startFly()
	local T = B.Players.LocalPlayer
	local U = T.Character or T.CharacterAdded:Wait()
	local V = U:WaitForChild("HumanoidRootPart")

	R = Instance.new("BodyVelocity")
	R.Velocity = Vector3.new(0, 0, 0)
	R.MaxForce = Vector3.new(1, 1, 1) * 1e5
	R.Name = "FlyVelocity"
	R.Parent = V

	S = B:GetService("RunService").RenderStepped:Connect(function()
		if P and T.Character and T.Character:FindFirstChild("HumanoidRootPart") then
			local W = workspace.CurrentCamera
			local X = Vector3.zero

			if T:GetMouse().KeyDown then
				X = W.CFrame.LookVector
			end

			R.Velocity = W.CFrame.LookVector * Q
		end
	end)
end

function stopFly()
	if R then R:Destroy() R = nil end
	if S then S:Disconnect() S = nil end
end

H:NewToggle({
	Title = "Fly",
	Default = false,
	Callback = function(Y)
		P = Y
		if P then
			startFly()
		else
			stopFly()
		end
	end,
})

H:NewSlider({
	Title = "WalkSpeed(Not work😢)",
	Min = 1,
	Max = 1000,
	Default = 16,
	Callback = function(Z)
		local a0 = B.Players.LocalPlayer
		local a1 = a0.Character
		a1.Humanoid.WalkSpeed = Z
	end,
})

H:NewKeybind({
	Title = "Keybind",
	Default = Enum.KeyCode.LeftControl,
	Callback = function(a2)
		print(a2)
	end,
})

I:NewTitle('join discord')
I:NewButton({
	Title = "สวัสดีคนไทย",
	Callback = function()
		print('NONE')
	end,
})
