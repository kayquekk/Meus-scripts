-- Proteção para rodar no ambiente do executor (Ronix)
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Criando GUI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DarkXHubGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Botão para abrir o hub
local openButton = Instance.new("TextButton")
openButton.Name = "OpenHubButton"
openButton.Text = "dark x Hub beta"
openButton.Size = UDim2.new(0, 180, 0, 50)
openButton.Position = UDim2.new(0, 10, 0.5, -25)
openButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
openButton.BackgroundTransparency = 0.2
openButton.TextColor3 = Color3.fromRGB(255, 255, 255)
openButton.TextScaled = true
openButton.Parent = gui

-- Frame do Hub
local main = Instance.new("Frame")
main.Name = "MainHub"
main.Size = UDim2.new(0, 450, 0, 300)
main.Position = UDim2.new(0.5, -225, 0.5, -150)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
main.BackgroundTransparency = 0.2
main.Visible = false
main.Active = true
main.Parent = gui

-- Drag mobile e PC
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

main.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragging = true
		dragStart = input.Position
		startPos = main.Position

		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)

main.InputChanged:Connect(function(input)
	if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)

-- Abrir/fechar o Hub
openButton.MouseButton1Click:Connect(function()
	main.Visible = not main.Visible
end)

 -- Container lateral de botões (abas)
local tabButtons = Instance.new("Frame")
tabButtons.Name = "TabButtons"
tabButtons.Size = UDim2.new(0, 120, 1, 0)
tabButtons.Position = UDim2.new(0, 0, 0, 0)
tabButtons.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
tabButtons.BackgroundTransparency = 0.3
tabButtons.Parent = main

-- Função para criar botões e abas
local function createTab(name)
	local tabFrame = Instance.new("Frame")
	tabFrame.Name = name
	tabFrame.Size = UDim2.new(1, -120, 1, 0)
	tabFrame.Position = UDim2.new(0, 120, 0, 0)
	tabFrame.BackgroundTransparency = 1
	tabFrame.Visible = false
	tabFrame.Parent = main

	local button = Instance.new("TextButton")
	button.Text = name
	button.Size = UDim2.new(1, 0, 0, 40)
	button.Position = UDim2.new(0, 0, 0, #tabButtons:GetChildren() * 40)
	button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.TextScaled = true
	button.Parent = tabButtons

	button.MouseButton1Click:Connect(function()
		for _, frame in pairs(main:GetChildren()) do
			if frame:IsA("Frame") and frame.Name ~= "TabButtons" then
				frame.Visible = false
			end
		end
		tabFrame.Visible = true
	end)

	return tabFrame
end

-- Criar as abas
local principalTab = createTab("Principal")
local meusScriptsTab = createTab("Meus Scripts")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 200, 0, 40)
flyButton.Position = UDim2.new(0, 10, 0, 10)
flyButton.Text = "FlyGui v3"
flyButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
flyButton.TextScaled = true
flyButton.Parent = principalTab

flyButton.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end) 

local tpToolButton = Instance.new("TextButton")
tpToolButton.Size = UDim2.new(0, 200, 0, 40)
tpToolButton.Position = UDim2.new(0, 10, 0, 60)
tpToolButton.Text = "Tp Tool (Click to TP)"
tpToolButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tpToolButton.TextColor3 = Color3.fromRGB(255, 255, 255)
tpToolButton.TextScaled = true
tpToolButton.Parent = principalTab

tpToolButton.MouseButton1Click:Connect(function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Tp tool(Equip to Click TP)"

    tool.Activated:Connect(function()
        local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
        pos = CFrame.new(pos.X, pos.Y, pos.Z)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
    end)

    tool.Parent = game.Players.LocalPlayer.Backpack
end)
local mudarCorpoButton = Instance.new("TextButton")
mudarCorpoButton.Size = UDim2.new(0, 200, 0, 40)
mudarCorpoButton.Position = UDim2.new(0, 10, 0, 10) -- Ajuste essa altura se tiver mais botões
mudarCorpoButton.Text = "Mudar de corpo Brookhaven"
mudarCorpoButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mudarCorpoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mudarCorpoButton.TextScaled = true
mudarCorpoButton.Parent = meusScriptsTab

mudarCorpoButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Jfdedit3/z4trox-hub-v1/main/z4trox%20hub"))()
end)

local draconicEvadeButton = Instance.new("TextButton")
draconicEvadeButton.Size = UDim2.new(0, 200, 0, 40)
draconicEvadeButton.Position = UDim2.new(0, 10, 0, 60) -- Ajuste se houver botões acima
draconicEvadeButton.Text = "Draconic Hub Evade"
draconicEvadeButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
draconicEvadeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
draconicEvadeButton.TextScaled = true
draconicEvadeButton.Parent = meusScriptsTab

draconicEvadeButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nyxarth910/Draconic-Hub-X/refs/heads/main/files/Evade/Overhaul.lua'))()
end)

local infiniteYieldButton = Instance.new("TextButton")
infiniteYieldButton.Size = UDim2.new(0, 200, 0, 40)
infiniteYieldButton.Position = UDim2.new(0, 10, 0, 160) -- Ajuste a posição se tiver mais botões acima
infiniteYieldButton.Text = "Infinite Yield"
infiniteYieldButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
infiniteYieldButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteYieldButton.TextScaled = true
infiniteYieldButton.Parent = meusScriptsTab -- ou principalTab se quiser em outra aba

infiniteYieldButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)


local speedGuiButton = Instance.new("TextButton")
speedGuiButton.Size = UDim2.new(0, 200, 0, 40)
speedGuiButton.Position = UDim2.new(0, 10, 0, 210) -- Ajuste conforme seus outros botões
speedGuiButton.Text = "Abrir Speed GUI"
speedGuiButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
speedGuiButton.TextColor3 = Color3.fromRGB(255, 255, 255)
speedGuiButton.TextScaled = true
speedGuiButton.Parent = principalTab

speedGuiButton.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()

	if player.PlayerGui:FindFirstChild("SpeedGui") then return end -- Evita duplicação

	local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	screenGui.Name = "SpeedGui"
	screenGui.ResetOnSpawn = false

	local frame = Instance.new("Frame", screenGui)
	frame.Size = UDim2.new(0, 250, 0, 120)
	frame.Position = UDim2.new(0.5, -125, 0.2, 0)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 0.2
	frame.Active = true
	frame.Draggable = true

	local title = Instance.new("TextLabel", frame)
	title.Size = UDim2.new(1, 0, 0, 30)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.Text = "Speed Changer"
	title.BackgroundTransparency = 1
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.Font = Enum.Font.SourceSansBold

	local speedBox = Instance.new("TextBox", frame)
	speedBox.Size = UDim2.new(0.8, 0, 0, 35)
	speedBox.Position = UDim2.new(0.1, 0, 0, 40)
	speedBox.PlaceholderText = "Digite a velocidade"
	speedBox.Text = ""
	speedBox.TextScaled = true
	speedBox.Font = Enum.Font.SourceSans
	speedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)

	local applyButton = Instance.new("TextButton", frame)
	applyButton.Size = UDim2.new(0.8, 0, 0, 30)
	applyButton.Position = UDim2.new(0.1, 0, 0, 85)
	applyButton.Text = "Aplicar"
	applyButton.TextScaled = true
	applyButton.Font = Enum.Font.SourceSansBold
	applyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	applyButton.TextColor3 = Color3.fromRGB(255, 255, 255)

	applyButton.MouseButton1Click:Connect(function()
		local speed = tonumber(speedBox.Text)
		if speed and speed >= 0 and speed <= 99999 then
			local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid.WalkSpeed = speed
			end
		else
			speedBox.Text = ""
			speedBox.PlaceholderText = "Valor inválido"
		end
	end)
end)

local aimbotButton = Instance.new("TextButton")
aimbotButton.Size = UDim2.new(0, 200, 0, 40)
aimbotButton.Position = UDim2.new(0, 10, 0, 310) -- ajuste conforme os outros botões
aimbotButton.Text = "Aimbot Universal"
aimbotButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
aimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotButton.TextScaled = true
aimbotButton.Parent = principalTab

aimbotButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/qtZt0Nzb"))()
end)

local jumpBtn = Instance.new("TextButton")
jumpBtn.Size = UDim2.new(0, 200, 0, 40)
jumpBtn.Position = UDim2.new(0, 10, 0, 310) -- ajuste a posição se necessário
jumpBtn.Text = "Abrir JumpPower GUI"
jumpBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
jumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
jumpBtn.TextScaled = true
jumpBtn.Font = Enum.Font.SourceSansBold
jumpBtn.Parent = principalTab -- certifique-se de que essa aba existe

jumpBtn.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
	if player.PlayerGui:FindFirstChild("JumpGui") then return end

	local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
	gui.Name = "JumpGui"
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, 250, 0, 120)
	frame.Position = UDim2.new(0.5, -125, 0.4, 0)
	frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 0.2
	frame.Active = true
	frame.Draggable = true
	frame.Parent = gui

	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, 0, 0, 30)
	title.Position = UDim2.new(0, 0, 0, 0)
	title.Text = "JumpPower Changer"
	title.BackgroundTransparency = 1
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.Font = Enum.Font.SourceSansBold
	title.Parent = frame

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(0.8, 0, 0, 35)
	box.Position = UDim2.new(0.1, 0, 0, 40)
	box.PlaceholderText = "Digite o JumpPower"
	box.Text = ""
	box.TextScaled = true
	box.Font = Enum.Font.SourceSans
	box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	box.TextColor3 = Color3.fromRGB(255, 255, 255)
	box.Parent = frame

	local applyBtn = Instance.new("TextButton")
	applyBtn.Size = UDim2.new(0.8, 0, 0, 30)
	applyBtn.Position = UDim2.new(0.1, 0, 0, 85)
	applyBtn.Text = "Aplicar"
	applyBtn.TextScaled = true
	applyBtn.Font = Enum.Font.SourceSansBold
	applyBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	applyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	applyBtn.Parent = frame

	applyBtn.MouseButton1Click:Connect(function()
		local num = tonumber(box.Text)
		if num and num >= 0 and num <= 99999 then
			local character = player.Character or player.CharacterAdded:Wait()
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				humanoid.UseJumpPower = true
				humanoid.JumpPower = num
			end
		else
			box.Text = ""
			box.PlaceholderText = "Valor inválido"
		end
	end)
end)

local forsakenBtn = Instance.new("TextButton")
forsakenBtn.Size = UDim2.new(0, 200, 0, 40)
forsakenBtn.Position = UDim2.new(0, 10, 0, 360) -- ajuste se necessário
forsakenBtn.Text = "forsaken guis"
forsakenBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
forsakenBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
forsakenBtn.TextScaled = true
forsakenBtn.Font = Enum.Font.SourceSansBold
forsakenBtn.Parent = meusScriptsTab -- certifique-se de que essa variável aponte para a aba correta

forsakenBtn.MouseButton1Click:Connect(function()
	-- O script da interface Forsaken começa aqui
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "ForsakenHub"
	ScreenGui.Parent = game:GetService("CoreGui")

	local MainFrame = Instance.new("Frame")
	MainFrame.Name = "MainFrame"
	MainFrame.Size = UDim2.new(0, 400, 0, 200)
	MainFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
	MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	MainFrame.BorderColor3 = Color3.fromRGB(100, 0, 0)
	MainFrame.BorderSizePixel = 2
	MainFrame.Parent = ScreenGui

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, 0, 0, 40)
	Title.Position = UDim2.new(0, 0, 0, 10)
	Title.BackgroundTransparency = 1
	Title.Text = "QUAL SCRIPT FORSAKEN VOCÊ QUER?"
	Title.TextColor3 = Color3.fromRGB(255, 50, 50)
	Title.Font = Enum.Font.GothamBlack
	Title.TextSize = 18
	Title.Parent = MainFrame

	local GoodButton = Instance.new("TextButton")
	GoodButton.Size = UDim2.new(0.4, 0, 0, 50)
	GoodButton.Position = UDim2.new(0.05, 0, 0.5, -25)
	GoodButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	GoodButton.BorderColor3 = Color3.fromRGB(100, 0, 0)
	GoodButton.Text = "Forsaken GOOD"
	GoodButton.TextColor3 = Color3.fromRGB(255, 60, 60)
	GoodButton.Font = Enum.Font.GothamBold
	GoodButton.TextSize = 14
	GoodButton.Parent = MainFrame

	local NoxiousButton = Instance.new("TextButton")
	NoxiousButton.Size = UDim2.new(0.4, 0, 0, 50)
	NoxiousButton.Position = UDim2.new(0.55, 0, 0.5, -25)
	NoxiousButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	NoxiousButton.BorderColor3 = Color3.fromRGB(100, 0, 0)
	NoxiousButton.Text = "Noxious Beta"
	NoxiousButton.TextColor3 = Color3.fromRGB(255, 60, 60)
	NoxiousButton.Font = Enum.Font.GothamBold
	NoxiousButton.TextSize = 14
	NoxiousButton.Parent = MainFrame

	local CloseButton = Instance.new("TextButton")
	CloseButton.Size = UDim2.new(0, 30, 0, 30)
	CloseButton.Position = UDim2.new(1, -30, 0, 0)
	CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	CloseButton.BorderSizePixel = 0
	CloseButton.Text = "X"
	CloseButton.TextColor3 = Color3.new(1, 1, 1)
	CloseButton.Font = Enum.Font.GothamBold
	CloseButton.TextSize = 18
	CloseButton.Parent = MainFrame

	local function CloseHub()
		ScreenGui:Destroy()
	end

	GoodButton.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/MainMenu/main/Code"))()
		CloseHub()
	end)

	NoxiousButton.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Team-Noxious/Noxious-Hub/refs/heads/main/Forsaken/Noxious%20Hub"))()
		CloseHub()
	end)

	CloseButton.MouseButton1Click:Connect(CloseHub)

	local function SetupHover(button)
		button.MouseEnter:Connect(function()
			button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
		end)
		button.MouseLeave:Connect(function()
			button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		end)
	end

	SetupHover(GoodButton)
	SetupHover(NoxiousButton)

	CloseButton.MouseEnter:Connect(function()
		CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
	end)
	CloseButton.MouseLeave:Connect(function()
		CloseButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
	end)
end).
