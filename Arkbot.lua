-- by Bintyzzz (discord)
-- not complete, not everything works and some stuff is buggy
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("ArkBot") then
	PlayerGui.ArkBot:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ArkBot"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(1100, 650)
Main.Position = UDim2.fromScale(.5,.5)
Main.AnchorPoint = Vector2.new(.5,.5)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,16)
MainCorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(40,40,40)
Stroke.Parent = Main

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0,240,1,0)
Sidebar.BackgroundColor3 = Color3.fromRGB(20,20,20)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0,16)
SidebarCorner.Parent = Sidebar

local LogoHolder = Instance.new("Frame")
LogoHolder.BackgroundTransparency = 1
LogoHolder.Size = UDim2.new(1,0,0,90)
LogoHolder.Parent = Sidebar

local Logo = Instance.new("ImageLabel")
Logo.BackgroundTransparency = 1
Logo.Size = UDim2.fromOffset(52,52)
Logo.Position = UDim2.new(0,18,0,18)
Logo.Image = "rbxassetid://88150027972320"
Logo.Parent = LogoHolder

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0,80,0,15)
Title.Size = UDim2.new(1,-90,0,30)
Title.Text = "ArkBot"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1,1,1)
Title.TextSize = 22
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = LogoHolder

local Subtitle = Instance.new("TextLabel")
Subtitle.BackgroundTransparency = 1
Subtitle.Position = UDim2.new(0,80,0,45)
Subtitle.Size = UDim2.new(1,-90,0,20)
Subtitle.Text = "By bintyzz on Discord"
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextColor3 = Color3.fromRGB(140,140,140)
Subtitle.TextSize = 12
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = LogoHolder

local ButtonHolder = Instance.new("Frame")
ButtonHolder.BackgroundTransparency = 1
ButtonHolder.Position = UDim2.new(0,0,0,100)
ButtonHolder.Size = UDim2.new(1,0,1,-100)
ButtonHolder.Parent = Sidebar

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,6)
Layout.Parent = ButtonHolder

local Content = Instance.new("Frame")
Content.Position = UDim2.new(0,250,0,15)
Content.Size = UDim2.new(1,-265,1,-30)
Content.BackgroundTransparency = 1
Content.Parent = Main

local function CreateNavButton(Name)
	local Button = Instance.new("TextButton")
	Button.Size = UDim2.new(1,-20,0,42)
	Button.Position = UDim2.new(0,10,0,0)
	Button.BackgroundColor3 = Color3.fromRGB(20,20,20)
	Button.BorderSizePixel = 0
	Button.Text = Name
	Button.Font = Enum.Font.GothamMedium
	Button.TextSize = 15
	Button.TextColor3 = Color3.new(1,1,1)
	Button.Parent = ButtonHolder

	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,10)
	Corner.Parent = Button

	Button.MouseEnter:Connect(function()
		TweenService:Create(Button,TweenInfo.new(.15),
			{BackgroundColor3 = Color3.fromRGB(30,30,30)}
		):Play()
	end)

	Button.MouseLeave:Connect(function()
		TweenService:Create(Button,TweenInfo.new(.15),
			{BackgroundColor3 = Color3.fromRGB(20,20,20)}
		):Play()
	end)

	return Button
end

local function CreateToggle(Parent, Text, YPos, Callback)
	local ToggleFrame = Instance.new("Frame")
	ToggleFrame.Size = UDim2.new(1,0,0,45)
	ToggleFrame.Position = UDim2.new(0,0,0,YPos)
	ToggleFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	ToggleFrame.BorderSizePixel = 0
	ToggleFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = ToggleFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(.7,0,1,0)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = ToggleFrame
	
	local ToggleBtn = Instance.new("TextButton")
	ToggleBtn.Size = UDim2.fromOffset(50,26)
	ToggleBtn.Position = UDim2.new(1,-70,.5,-13)
	ToggleBtn.Text = ""
	ToggleBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	ToggleBtn.Parent = ToggleFrame
	
	Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1,0)
	
	local Knob = Instance.new("Frame")
	Knob.Size = UDim2.fromOffset(22,22)
	Knob.Position = UDim2.fromOffset(2,2)
	Knob.BackgroundColor3 = Color3.new(1,1,1)
	Knob.Parent = ToggleBtn
	
	Instance.new("UICorner", Knob).CornerRadius = UDim.new(1,0)
	
	local Enabled = false
	
	ToggleBtn.MouseButton1Click:Connect(function()
		Enabled = not Enabled
		Callback(Enabled)
		
		TweenService:Create(
			Knob,
			TweenInfo.new(.2,Enum.EasingStyle.Quad),
			{
				Position = Enabled and UDim2.fromOffset(26,2) or UDim2.fromOffset(2,2)
			}
		):Play()
		
		TweenService:Create(
			ToggleBtn,
			TweenInfo.new(.2,Enum.EasingStyle.Quad),
			{
				BackgroundColor3 = Enabled and Color3.fromRGB(0,200,0) or Color3.fromRGB(40,40,40)
			}
		):Play()
	end)
	
	return {Set = function(v) 
		Enabled = v
		Callback(v)
		Knob.Position = v and UDim2.fromOffset(26,2) or UDim2.fromOffset(2,2)
		ToggleBtn.BackgroundColor3 = v and Color3.fromRGB(0,200,0) or Color3.fromRGB(40,40,40)
	end}
end

local function CreateSlider(Parent, Text, YPos, Min, Max, Default, Callback)
	local SliderFrame = Instance.new("Frame")
	SliderFrame.Size = UDim2.new(1,0,0,65)
	SliderFrame.Position = UDim2.new(0,0,0,YPos)
	SliderFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	SliderFrame.BorderSizePixel = 0
	SliderFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = SliderFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(1,-30,0,25)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = SliderFrame
	
	local ValueLabel = Instance.new("TextLabel")
	ValueLabel.BackgroundTransparency = 1
	ValueLabel.Position = UDim2.new(1,-70,0,0)
	ValueLabel.Size = UDim2.new(0,60,0,25)
	ValueLabel.Text = string.format("%.1f", Default)
	ValueLabel.Font = Enum.Font.GothamBold
	ValueLabel.TextSize = 14
	ValueLabel.TextColor3 = Color3.fromRGB(0,200,0)
	ValueLabel.TextXAlignment = Enum.TextXAlignment.Right
	ValueLabel.Parent = SliderFrame
	
	local SliderBtn = Instance.new("TextButton")
	SliderBtn.Size = UDim2.new(1,-30,0,4)
	SliderBtn.Position = UDim2.new(0,15,0,45)
	SliderBtn.Text = ""
	SliderBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	SliderBtn.AutoButtonColor = false
	SliderBtn.Parent = SliderFrame
	
	local Fill = Instance.new("Frame")
	Fill.Size = UDim2.new((Default-Min)/(Max-Min),0,1,0)
	Fill.BackgroundColor3 = Color3.fromRGB(0,200,0)
	Fill.BorderSizePixel = 0
	Fill.Parent = SliderBtn
	
	Instance.new("UICorner", SliderBtn).CornerRadius = UDim.new(1,0)
	Instance.new("UICorner", Fill).CornerRadius = UDim.new(1,0)
	
	local Value = Default
	local dragging = false
	local connection = nil
	
	local function UpdateSlider(input)
		if not dragging then return end
		local pos = math.clamp((input.Position.X - SliderBtn.AbsolutePosition.X) / SliderBtn.AbsoluteSize.X, 0, 1)
		Value = Min + (Max - Min) * pos
		Fill.Size = UDim2.new(pos,0,1,0)
		ValueLabel.Text = string.format("%.1f", Value)
		Callback(Value)
	end
	
	SliderBtn.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			UpdateSlider(input)
			
			if connection then connection:Disconnect() end
			connection = UserInputService.InputChanged:Connect(function(input2)
				if input2.UserInputType == Enum.UserInputType.MouseMovement and dragging then
					UpdateSlider(input2)
				end
			end)
		end
	end)
	
	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
			if connection then 
				connection:Disconnect()
				connection = nil
			end
		end
	end)
	
	return {Set = function(v)
		Value = math.clamp(v, Min, Max)
		local pos = (Value - Min) / (Max - Min)
		Fill.Size = UDim2.new(pos,0,1,0)
		ValueLabel.Text = string.format("%.1f", Value)
		Callback(Value)
	end}
end

local function CreateDropdown(Parent, Text, YPos, Options, Callback)
	local DropdownFrame = Instance.new("Frame")
	DropdownFrame.Size = UDim2.new(1,0,0,65)
	DropdownFrame.Position = UDim2.new(0,0,0,YPos)
	DropdownFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	DropdownFrame.BorderSizePixel = 0
	DropdownFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = DropdownFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(1,-30,0,25)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = DropdownFrame
	
	local DropdownBtn = Instance.new("TextButton")
	DropdownBtn.Size = UDim2.new(1,-30,0,30)
	DropdownBtn.Position = UDim2.new(0,15,0,30)
	DropdownBtn.Text = Options[1]
	DropdownBtn.Font = Enum.Font.Gotham
	DropdownBtn.TextSize = 13
	DropdownBtn.TextColor3 = Color3.new(1,1,1)
	DropdownBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
	DropdownBtn.Parent = DropdownFrame
	
	Instance.new("UICorner", DropdownBtn).CornerRadius = UDim.new(0,6)
	
	local Selected = Options[1]
	local dropdownList = nil
	
	DropdownBtn.MouseButton1Click:Connect(function()
		if dropdownList then
			dropdownList:Destroy()
			dropdownList = nil
			return
		end
		
		dropdownList = Instance.new("Frame")
		dropdownList.Size = UDim2.new(1,0,0,30 * #Options)
		dropdownList.Position = UDim2.new(0,0,0,60)
		dropdownList.BackgroundColor3 = Color3.fromRGB(30,30,30)
		dropdownList.BorderSizePixel = 0
		dropdownList.ClipsDescendants = true
		dropdownList.Parent = DropdownFrame
		
		Instance.new("UICorner", dropdownList).CornerRadius = UDim.new(0,6)
		
		local listLayout = Instance.new("UIListLayout")
		listLayout.Padding = UDim.new(0,1)
		listLayout.Parent = dropdownList
		
		for i, option in ipairs(Options) do
			local optionBtn = Instance.new("TextButton")
			optionBtn.Size = UDim2.new(1,0,0,30)
			optionBtn.Text = option
			optionBtn.Font = Enum.Font.Gotham
			optionBtn.TextSize = 13
			optionBtn.TextColor3 = Color3.new(1,1,1)
			optionBtn.BackgroundColor3 = Color3.fromRGB(40,40,40)
			optionBtn.Parent = dropdownList
			
			optionBtn.MouseButton1Click:Connect(function()
				Selected = option
				DropdownBtn.Text = option
				Callback(option)
				if dropdownList then
					dropdownList:Destroy()
					dropdownList = nil
				end
			end)
		end
		
		task.delay(5, function()
			if dropdownList then 
				dropdownList:Destroy()
				dropdownList = nil
			end
		end)
	end)
	
	return {Set = function(v)
		Selected = v
		DropdownBtn.Text = v
		Callback(v)
	end}
end

local function CreateKeybind(Parent, Text, YPos, Default, Callback)
	local KeybindFrame = Instance.new("Frame")
	KeybindFrame.Size = UDim2.new(1,0,0,65)
	KeybindFrame.Position = UDim2.new(0,0,0,YPos)
	KeybindFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	KeybindFrame.BorderSizePixel = 0
	KeybindFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = KeybindFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(1,-30,0,25)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = KeybindFrame
	
	local KeybindBtn = Instance.new("TextButton")
	KeybindBtn.Size = UDim2.new(0,120,0,30)
	KeybindBtn.Position = UDim2.new(1,-135,0,30)
	KeybindBtn.Text = Default
	KeybindBtn.Font = Enum.Font.GothamBold
	KeybindBtn.TextSize = 13
	KeybindBtn.TextColor3 = Color3.new(1,1,1)
	KeybindBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	KeybindBtn.Parent = KeybindFrame
	
	Instance.new("UICorner", KeybindBtn).CornerRadius = UDim.new(0,6)
	
	local Key = Default
	local Listening = false
	local connection = nil
	
	KeybindBtn.MouseButton1Click:Connect(function()
		Listening = true
		KeybindBtn.Text = "..."
		
		if connection then connection:Disconnect() end
		connection = UserInputService.InputBegan:Connect(function(input)
			if Listening and input.UserInputType == Enum.UserInputType.Keyboard then
				local keyName = input.KeyCode.Name
				Key = keyName
				KeybindBtn.Text = keyName
				Callback(keyName)
				Listening = false
				if connection then
					connection:Disconnect()
					connection = nil
				end
			end
		end)
		
		task.delay(3, function()
			if Listening then
				Listening = false
				KeybindBtn.Text = Key
				if connection then
					connection:Disconnect()
					connection = nil
				end
			end
		end)
	end)
	
	return {Set = function(v)
		Key = v
		KeybindBtn.Text = v
		Callback(v)
	end}
end

local function CreateColorPicker(Parent, Text, YPos, DefaultColor, Callback)
	local ColorFrame = Instance.new("Frame")
	ColorFrame.Size = UDim2.new(1,0,0,65)
	ColorFrame.Position = UDim2.new(0,0,0,YPos)
	ColorFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	ColorFrame.BorderSizePixel = 0
	ColorFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = ColorFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(1,-30,0,25)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = ColorFrame
	
	local ColorPreview = Instance.new("Frame")
	ColorPreview.Size = UDim2.fromOffset(40,30)
	ColorPreview.Position = UDim2.new(1,-55,0,30)
	ColorPreview.BackgroundColor3 = DefaultColor
	ColorPreview.Parent = ColorFrame
	
	Instance.new("UICorner", ColorPreview).CornerRadius = UDim.new(0,6)
	
	local ColorBtn = Instance.new("TextButton")
	ColorBtn.Size = UDim2.new(0,80,0,30)
	ColorBtn.Position = UDim2.new(1,-145,0,30)
	ColorBtn.Text = "Pick Color"
	ColorBtn.Font = Enum.Font.Gotham
	ColorBtn.TextSize = 12
	ColorBtn.TextColor3 = Color3.new(1,1,1)
	ColorBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
	ColorBtn.Parent = ColorFrame
	
	Instance.new("UICorner", ColorBtn).CornerRadius = UDim.new(0,6)
	
	ColorBtn.MouseButton1Click:Connect(function()
		local colorPicker = Instance.new("Frame")
		colorPicker.Size = UDim2.fromOffset(200,150)
		colorPicker.Position = UDim2.fromScale(.5,.5)
		colorPicker.AnchorPoint = Vector2.new(.5,.5)
		colorPicker.BackgroundColor3 = Color3.fromRGB(30,30,30)
		colorPicker.BorderSizePixel = 0
		colorPicker.Parent = ScreenGui
		
		Instance.new("UICorner", colorPicker).CornerRadius = UDim.new(0,10)
		
		local hueSlider = Instance.new("TextButton")
		hueSlider.Size = UDim2.new(.8,0,0,15)
		hueSlider.Position = UDim2.new(.1,0,0.3,0)
		hueSlider.Text = ""
		hueSlider.BackgroundColor3 = Color3.new(1,0,0)
		hueSlider.Parent = colorPicker
		
		local hue = 0
		
		local function updateColor()
			local color = Color3.fromHSV(hue, 1, 1)
			ColorPreview.BackgroundColor3 = color
			Callback(color)
		end
		
		local function closePicker()
			colorPicker:Destroy()
		end
		
		task.delay(10, closePicker)
		colorPicker.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				task.wait(0.1)
				closePicker()
			end
		end)
		
		local dragging = false
		local connection = nil
		
		hueSlider.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
			end
		end)
		
		connection = UserInputService.InputChanged:Connect(function(input)
			if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
				local pos = math.clamp((input.Position.X - hueSlider.AbsolutePosition.X) / hueSlider.AbsoluteSize.X, 0, 1)
				hue = pos
				updateColor()
			end
		end)
		
		UserInputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)
	end)
	
	return {Set = function(v)
		ColorPreview.BackgroundColor3 = v
		Callback(v)
	end}
end

local function CreateTextBox(Parent, Text, YPos, Default, Callback)
	local TextBoxFrame = Instance.new("Frame")
	TextBoxFrame.Size = UDim2.new(1,0,0,65)
	TextBoxFrame.Position = UDim2.new(0,0,0,YPos)
	TextBoxFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	TextBoxFrame.BorderSizePixel = 0
	TextBoxFrame.Parent = Parent
	
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(0,8)
	Corner.Parent = TextBoxFrame
	
	local Label = Instance.new("TextLabel")
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0,15,0,0)
	Label.Size = UDim2.new(1,-30,0,25)
	Label.Text = Text
	Label.Font = Enum.Font.Gotham
	Label.TextSize = 14
	Label.TextColor3 = Color3.fromRGB(200,200,200)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.Parent = TextBoxFrame
	
	local Box = Instance.new("TextBox")
	Box.Size = UDim2.new(0,120,0,30)
	Box.Position = UDim2.new(1,-135,0,30)
	Box.Text = tostring(Default)
	Box.Font = Enum.Font.Gotham
	Box.TextSize = 13
	Box.TextColor3 = Color3.new(1,1,1)
	Box.BackgroundColor3 = Color3.fromRGB(40,40,40)
	Box.Parent = TextBoxFrame
	
	Instance.new("UICorner", Box).CornerRadius = UDim.new(0,6)
	
	Box.FocusLost:Connect(function()
		Callback(tonumber(Box.Text) or Default)
	end)
	
	return {Set = function(v)
		Box.Text = tostring(v)
		Callback(v)
	end}
end

local navButtons = {}
local currentPage = nil
local pages = {}

local function SwitchToPage(pageName)
	if currentPage then
		currentPage.Visible = false
	end
	
	if pages[pageName] then
		pages[pageName].Visible = true
		currentPage = pages[pageName]
	end
end

local function CreatePage(Name)
	local Page = Instance.new("ScrollingFrame")
	Page.Size = UDim2.new(1,0,1,0)
	Page.BackgroundTransparency = 1
	Page.BorderSizePixel = 0
	Page.ScrollBarThickness = 6
	Page.ScrollBarImageColor3 = Color3.fromRGB(60,60,60)
	Page.Visible = false
	Page.Parent = Content
	
	local PageLayout = Instance.new("UIListLayout")
	PageLayout.Padding = UDim.new(0,8)
	PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	PageLayout.Parent = Page
	
	PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		Page.CanvasSize = UDim2.new(0,0,0,PageLayout.AbsoluteContentSize.Y + 20)
	end)
	
	pages[Name] = Page
	return Page
end

CreateNavButton("Aimbot")
CreateNavButton("Triggerbot")
CreateNavButton("Visuals")
CreateNavButton("Player")
CreateNavButton("Settings")
CreateNavButton("Configs")

local aimbotPage = CreatePage("Aimbot")
local triggerbotPage = CreatePage("Triggerbot")
local visualsPage = CreatePage("Visuals")
local playerPage = CreatePage("Player")
local settingsPage = CreatePage("Settings")
local configsPage = CreatePage("Configs")

local currentY = 0
local function ResetY() currentY = 0 end
local function AddSpace(amount) currentY = currentY + amount end

-- Settings table must be defined before use
Settings = {
	Aimbot = {
		Enabled = false,
		VisibleFOV = true,
		FOVRadius = 150,
		FOVColor = Color3.fromRGB(255,0,0),
		Smoothness = 5,
		TeamCheck = true,
		WallCheck = true,
		HitboxPart = "Head",
		HitboxExpand = 0,
		Keybind = "X"
	},
	Triggerbot = {
		Enabled = false,
		Delay = 50,
		HitboxSize = 3,
		TeamCheck = true,
		WallCheck = true,
		HitboxPart = "Head",
		Keybind = "V"
	},
	ESP = {
		Enabled = false,
		BoxESP = true,
		BoxColor = Color3.fromRGB(0,255,0),
		Tracer = true,
		TracerColor = Color3.fromRGB(255,255,255),
		NameTags = true,
		NameColor = Color3.fromRGB(255,255,255),
		TeamCheck = true,
		MaxDistance = 500
	},
	Player = {
		Walkspeed = 16,
		JumpPower = 50
	}
}

ResetY()
CreateToggle(aimbotPage, "Enable Aimbot", currentY, function(enabled) Settings.Aimbot.Enabled = enabled end)
currentY = currentY + 50
CreateToggle(aimbotPage, "Show FOV Circle", currentY, function(enabled) Settings.Aimbot.VisibleFOV = enabled end)
currentY = currentY + 50
CreateSlider(aimbotPage, "FOV Radius", currentY, 50, 300, 150, function(value) Settings.Aimbot.FOVRadius = value end)
currentY = currentY + 70
CreateColorPicker(aimbotPage, "FOV Color", currentY, Color3.fromRGB(255,0,0), function(color) Settings.Aimbot.FOVColor = color end)
currentY = currentY + 70
CreateSlider(aimbotPage, "Aimbot Smoothness", currentY, 1, 20, 5, function(value) Settings.Aimbot.Smoothness = value end)
currentY = currentY + 70
CreateToggle(aimbotPage, "Team Check", currentY, function(enabled) Settings.Aimbot.TeamCheck = enabled end)
currentY = currentY + 50
CreateToggle(aimbotPage, "Wall Check", currentY, function(enabled) Settings.Aimbot.WallCheck = enabled end)
currentY = currentY + 50
CreateDropdown(aimbotPage, "Hitbox Target", currentY, {"Head", "Torso", "HumanoidRootPart"}, function(value) Settings.Aimbot.HitboxPart = value end)
currentY = currentY + 70
CreateSlider(aimbotPage, "Hitbox Expand (Studs)", currentY, 0, 5, 0, function(value) Settings.Aimbot.HitboxExpand = value end)
currentY = currentY + 70
CreateKeybind(aimbotPage, "Aimbot Toggle Key", currentY, "X", function(key) Settings.Aimbot.Keybind = key end)

ResetY()
CreateToggle(triggerbotPage, "Enable Triggerbot", currentY, function(enabled) Settings.Triggerbot.Enabled = enabled end)
currentY = currentY + 50
CreateSlider(triggerbotPage, "Triggerbot Delay (ms)", currentY, 0, 500, 50, function(value) Settings.Triggerbot.Delay = value end)
currentY = currentY + 70
CreateSlider(triggerbotPage, "Triggerbot Hitbox Size", currentY, 1, 10, 3, function(value) Settings.Triggerbot.HitboxSize = value end)
currentY = currentY + 70
CreateToggle(triggerbotPage, "Triggerbot Team Check", currentY, function(enabled) Settings.Triggerbot.TeamCheck = enabled end)
currentY = currentY + 50
CreateToggle(triggerbotPage, "Triggerbot Wall Check", currentY, function(enabled) Settings.Triggerbot.WallCheck = enabled end)
currentY = currentY + 50
CreateDropdown(triggerbotPage, "Triggerbot Hitbox", currentY, {"Head", "Torso", "HumanoidRootPart"}, function(value) Settings.Triggerbot.HitboxPart = value end)
currentY = currentY + 70
CreateKeybind(triggerbotPage, "Triggerbot Toggle Key", currentY, "V", function(key) Settings.Triggerbot.Keybind = key end)

ResetY()
CreateToggle(visualsPage, "Enable ESP", currentY, function(enabled) Settings.ESP.Enabled = enabled end)
currentY = currentY + 50
CreateToggle(visualsPage, "Box ESP", currentY, function(enabled) Settings.ESP.BoxESP = enabled end)
currentY = currentY + 50
CreateColorPicker(visualsPage, "Box Color", currentY, Color3.fromRGB(0,255,0), function(color) Settings.ESP.BoxColor = color end)
currentY = currentY + 70
CreateToggle(visualsPage, "Tracers", currentY, function(enabled) Settings.ESP.Tracer = enabled end)
currentY = currentY + 50
CreateColorPicker(visualsPage, "Tracer Color", currentY, Color3.fromRGB(255,255,255), function(color) Settings.ESP.TracerColor = color end)
currentY = currentY + 70
CreateToggle(visualsPage, "Name Tags", currentY, function(enabled) Settings.ESP.NameTags = enabled end)
currentY = currentY + 50
CreateColorPicker(visualsPage, "Name Color", currentY, Color3.fromRGB(255,255,255), function(color) Settings.ESP.NameColor = color end)
currentY = currentY + 70
CreateToggle(visualsPage, "ESP Team Check", currentY, function(enabled) Settings.ESP.TeamCheck = enabled end)
currentY = currentY + 50
CreateSlider(visualsPage, "ESP Max Distance", currentY, 100, 1000, 500, function(value) Settings.ESP.MaxDistance = value end)

ResetY()
local walkspeedEnabled = false
local originalWalkspeed = Player.Character and Player.Character.Humanoid.WalkSpeed or 16

CreateToggle(playerPage, "Enable Walkspeed", currentY, function(enabled)
	walkspeedEnabled = enabled
	if enabled then
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.WalkSpeed = Settings.Player.Walkspeed
		end
	else
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.WalkSpeed = originalWalkspeed
		end
	end
end)
currentY = currentY + 50
CreateSlider(playerPage, "Walkspeed Value", currentY, 16, 100, 16, function(value)
	Settings.Player.Walkspeed = value
	if walkspeedEnabled and Player.Character and Player.Character:FindFirstChild("Humanoid") then
		Player.Character.Humanoid.WalkSpeed = value
	end
end)
currentY = currentY + 70

local jumppowerEnabled = false
local originalJumppower = Player.Character and Player.Character.Humanoid.JumpPower or 50

CreateToggle(playerPage, "Enable Jump Power", currentY, function(enabled)
	jumppowerEnabled = enabled
	if enabled then
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.JumpPower = Settings.Player.JumpPower
		end
	else
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.JumpPower = originalJumppower
		end
	end
end)
currentY = currentY + 50
CreateSlider(playerPage, "Jump Power Value", currentY, 50, 200, 50, function(value)
	Settings.Player.JumpPower = value
	if jumppowerEnabled and Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.JumpPower = value
	end
end)
currentY = currentY + 70

local infinityJumpEnabled = false
local jumpConnection = nil

CreateToggle(playerPage, "Infinity Jump", currentY, function(enabled)
	infinityJumpEnabled = enabled
	if enabled then
		jumpConnection = UserInputService.JumpRequest:Connect(function()
			if Player.Character and Player.Character:FindFirstChild("Humanoid") then
				Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	else
		if jumpConnection then
			jumpConnection:Disconnect()
			jumpConnection = nil
		end
	end
end)

ResetY()
CreateToggle(settingsPage, "Show FOV Circle (Global)", currentY, function(enabled) FOVVisible = enabled end)

local Configs = {}

local function SaveConfig(name)
	local configData = {
		Aimbot = Settings.Aimbot,
		Triggerbot = Settings.Triggerbot,
		ESP = Settings.ESP,
		Player = Settings.Player
	}
	Configs[name] = configData
end

local function LoadConfig(name)
	if Configs[name] then
		local config = Configs[name]
		Settings.Aimbot = config.Aimbot
		Settings.Triggerbot = config.Triggerbot
		Settings.ESP = config.ESP
		Settings.Player = config.Player
	end
end

ResetY()
local configNameBox = Instance.new("TextBox")
configNameBox.Size = UDim2.new(0,200,0,35)
configNameBox.Position = UDim2.new(0,15,0,currentY + 5)
configNameBox.PlaceholderText = "Config Name"
configNameBox.Text = ""
configNameBox.Font = Enum.Font.Gotham
configNameBox.TextSize = 14
configNameBox.TextColor3 = Color3.new(1,1,1)
configNameBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
configNameBox.Parent = configsPage
Instance.new("UICorner", configNameBox).CornerRadius = UDim.new(0,6)

local saveBtn = Instance.new("TextButton")
saveBtn.Size = UDim2.new(0,100,0,35)
saveBtn.Position = UDim2.new(0,230,0,currentY + 5)
saveBtn.Text = "Save Config"
saveBtn.Font = Enum.Font.GothamBold
saveBtn.TextSize = 13
saveBtn.TextColor3 = Color3.new(1,1,1)
saveBtn.BackgroundColor3 = Color3.fromRGB(0,150,0)
saveBtn.Parent = configsPage
Instance.new("UICorner", saveBtn).CornerRadius = UDim.new(0,6)

local loadBtn = Instance.new("TextButton")
loadBtn.Size = UDim2.new(0,100,0,35)
loadBtn.Position = UDim2.new(0,345,0,currentY + 5)
loadBtn.Text = "Load Config"
loadBtn.Font = Enum.Font.GothamBold
loadBtn.TextSize = 13
loadBtn.TextColor3 = Color3.new(1,1,1)
loadBtn.BackgroundColor3 = Color3.fromRGB(0,150,0)
loadBtn.Parent = configsPage
Instance.new("UICorner", loadBtn).CornerRadius = UDim.new(0,6)

saveBtn.MouseButton1Click:Connect(function()
	local name = configNameBox.Text
	if name ~= "" then
		SaveConfig(name)
		configNameBox.Text = ""
	end
end)

loadBtn.MouseButton1Click:Connect(function()
	local name = configNameBox.Text
	if name ~= "" and Configs[name] then
		LoadConfig(name)
		configNameBox.Text = ""
	end
end)

local AimbotEnabled = false
local ESPEnabled = false
local TriggerbotEnabled = false
local CurrentFOV = nil
local FOVVisible = true

local function CreateFOVCircle()
	local circle = Instance.new("Frame")
	circle.Size = UDim2.fromOffset(Settings.Aimbot.FOVRadius * 2, Settings.Aimbot.FOVRadius * 2)
	circle.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(Settings.Aimbot.FOVRadius, Settings.Aimbot.FOVRadius)
	circle.BackgroundTransparency = 1
	circle.BorderSizePixel = 0
	circle.Parent = ScreenGui
	
	local uiCorner = Instance.new("UICorner")
	uiCorner.CornerRadius = UDim.new(1, 0)
	uiCorner.Parent = circle
	
	local stroke = Instance.new("UIStroke")
	stroke.Color = Settings.Aimbot.FOVColor
	stroke.Thickness = 2
	stroke.Transparency = 0.5
	stroke.Parent = circle
	
	return circle
end

CurrentFOV = CreateFOVCircle()

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode[Settings.Aimbot.Keybind] then
		AimbotEnabled = not AimbotEnabled
		Settings.Aimbot.Enabled = AimbotEnabled
	end
	
	if input.KeyCode == Enum.KeyCode[Settings.Triggerbot.Keybind] then
		TriggerbotEnabled = not TriggerbotEnabled
		Settings.Triggerbot.Enabled = TriggerbotEnabled
	end
end)

local function UpdateFOV()
	if not CurrentFOV then return end
	
	CurrentFOV.Visible = FOVVisible and AimbotEnabled
	CurrentFOV.Size = UDim2.fromOffset(Settings.Aimbot.FOVRadius * 2, Settings.Aimbot.FOVRadius * 2)
	CurrentFOV.Position = UDim2.fromScale(0.5, 0.5) - UDim2.fromOffset(Settings.Aimbot.FOVRadius, Settings.Aimbot.FOVRadius)
	
	local stroke = CurrentFOV:FindFirstChildWhichIsA("UIStroke")
	if stroke then
		stroke.Color = Settings.Aimbot.FOVColor
	end
end

local function GetClosestPlayer()
	local closest = nil
	local shortestDistance = Settings.Aimbot.FOVRadius
	
	local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
	
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Player then
			if Settings.Aimbot.TeamCheck and player.Team == Player.Team then
				continue
			end
			
			local character = player.Character
			if not character or not character:FindFirstChild(Settings.Aimbot.HitboxPart) then
				continue
			end
			
			local hitbox = character[Settings.Aimbot.HitboxPart]
			local screenPos, onScreen = Camera:WorldToViewportPoint(hitbox.Position)
			
			if onScreen then
				local distance = (Vector2.new(screenPos.X, screenPos.Y) - center).Magnitude
				
				if distance < shortestDistance then
					if Settings.Aimbot.WallCheck then
						local ray = Ray.new(Camera.CFrame.Position, (hitbox.Position - Camera.CFrame.Position).Unit * 1000)
						local hit, pos = workspace:FindPartOnRay(ray, Player.Character)
						if hit and hit:IsDescendantOf(character) then
							shortestDistance = distance
							closest = player
						end
					else
						shortestDistance = distance
						closest = player
					end
				end
			end
		end
	end
	
	return closest
end

local function IsPlayerOnCursor()
	local mouse = Player:GetMouse()
	local target = mouse.Target
	
	if not target then return false end
	
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= Player then
			if Settings.Triggerbot.TeamCheck and player.Team == Player.Team then
				continue
			end
			
			local character = player.Character
			if not character then continue end
			
			local hitboxPart = character:FindFirstChild(Settings.Triggerbot.HitboxPart)
			if not hitboxPart then continue end
			
			local distance = (hitboxPart.Position - target.Position).Magnitude
			
			if distance <= Settings.Triggerbot.HitboxSize then
				if Settings.Triggerbot.WallCheck then
					local ray = Ray.new(Camera.CFrame.Position, (hitboxPart.Position - Camera.CFrame.Position).Unit * 1000)
					local hit, pos = workspace:FindPartOnRay(ray, Player.Character)
					if hit and hit:IsDescendantOf(character) then
						return true, player
					end
				else
					return true, player
				end
			end
		end
	end
	
	return false, nil
end

local function Aimbot()
	while RunService.RenderStepped:Wait() do
		if not AimbotEnabled then continue end
		
		local target = GetClosestPlayer()
		if target then
			local character = target.Character
			if character and character:FindFirstChild(Settings.Aimbot.HitboxPart) then
				local hitbox = character[Settings.Aimbot.HitboxPart]
				local targetPos = hitbox.Position
				
				if Settings.Aimbot.HitboxExpand > 0 then
					local expandVector = Vector3.new(Settings.Aimbot.HitboxExpand, Settings.Aimbot.HitboxExpand, Settings.Aimbot.HitboxExpand)
					targetPos = targetPos + Vector3.new(
						math.random(-expandVector.X, expandVector.X),
						math.random(-expandVector.Y, expandVector.Y),
						math.random(-expandVector.Z, expandVector.Z)
					)
				end
				
				local targetAngle = CFrame.new(Camera.CFrame.Position, targetPos)
				local currentAngle = Camera.CFrame
				
				local newCFrame = currentAngle:Lerp(targetAngle, 1 / Settings.Aimbot.Smoothness)
				Camera.CFrame = newCFrame
			end
		end
	end
end

local function Triggerbot()
	while RunService.RenderStepped:Wait() do
		if not TriggerbotEnabled then continue end
		
		local onCursor, target = IsPlayerOnCursor()
		
		if onCursor and target then
			local mouse = Player:GetMouse()
			mouse.Button1Down:Wait()
			task.wait(Settings.Triggerbot.Delay / 1000)
			mouse.Button1Up:Click()
		end
	end
end

local function CreateESP()
	local espObjects = {}
	
	while RunService.RenderStepped:Wait() do
		if not Settings.ESP.Enabled then
			for _, obj in pairs(espObjects) do
				if obj then obj:Destroy() end
			end
			espObjects = {}
			continue
		end
		
		for _, obj in pairs(espObjects) do
			if obj then obj:Destroy() end
		end
		espObjects = {}
		
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= Player then
				if Settings.ESP.TeamCheck and player.Team == Player.Team then
					continue
				end
				
				local character = player.Character
				if not character or not character:FindFirstChild("HumanoidRootPart") then
					continue
				end
				
				local hrp = character.HumanoidRootPart
				local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
				
				if distance > Settings.ESP.MaxDistance then
					continue
				end
				
				local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
				if not onScreen then
					continue
				end
				
				local root = character:FindFirstChild("HumanoidRootPart")
				local head = character:FindFirstChild("Head")
				
				if root and head then
					local rootScreen = Camera:WorldToViewportPoint(root.Position)
					local headScreen = Camera:WorldToViewportPoint(head.Position)
					local height = math.abs(rootScreen.Y - headScreen.Y)
					local width = height * 0.6
					
					if Settings.ESP.BoxESP then
						local box = Instance.new("Frame")
						box.Size = UDim2.fromOffset(width, height)
						box.Position = UDim2.fromOffset(headScreen.X - width/2, headScreen.Y)
						box.BackgroundTransparency = 0.7
						box.BackgroundColor3 = Settings.ESP.BoxColor
						box.BorderSizePixel = 1
						box.BorderColor3 = Settings.ESP.BoxColor
						box.Parent = ScreenGui
						table.insert(espObjects, box)
					end
					
					if Settings.ESP.Tracer then
						local tracer = Instance.new("Frame")
						local startPos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
						local endPos = Vector2.new(screenPos.X, screenPos.Y)
						local length = (endPos - startPos).Magnitude
						local angle = math.atan2(endPos.Y - startPos.Y, endPos.X - startPos.X)
						
						tracer.Size = UDim2.fromOffset(length, 2)
						tracer.Position = UDim2.fromOffset(startPos.X, startPos.Y)
						tracer.Rotation = math.deg(angle)
						tracer.BackgroundColor3 = Settings.ESP.TracerColor
						tracer.BackgroundTransparency = 0.5
						tracer.Parent = ScreenGui
						table.insert(espObjects, tracer)
					end
					
					if Settings.ESP.NameTags then
						local nameTag = Instance.new("TextLabel")
						nameTag.Size = UDim2.fromOffset(100, 20)
						nameTag.Position = UDim2.fromOffset(headScreen.X - 50, headScreen.Y - 25)
						nameTag.Text = player.Name
						nameTag.TextColor3 = Settings.ESP.NameColor
						nameTag.BackgroundTransparency = 1
						nameTag.TextStrokeTransparency = 0.5
						nameTag.TextScaled = true
						nameTag.Font = Enum.Font.GothamBold
						nameTag.Parent = ScreenGui
						table.insert(espObjects, nameTag)
					end
				end
			end
		end
	end
end

local function UpdateUISettings()
	while RunService.RenderStepped:Wait() do
		UpdateFOV()
	end
end

for _, btn in ipairs(ButtonHolder:GetChildren()) do
	if btn:IsA("TextButton") then
		btn.MouseButton1Click:Connect(function()
			SwitchToPage(btn.Text)
		end)
	end
end

coroutine.wrap(Aimbot)()
coroutine.wrap(Triggerbot)()
coroutine.wrap(CreateESP)()
coroutine.wrap(UpdateUISettings)()

Main.Size = UDim2.fromOffset(0,0)

TweenService:Create(
	Main,
	TweenInfo.new(.35,Enum.EasingStyle.Quint),
	{
		Size = UDim2.fromOffset(1100,650)
	}
):Play()

SwitchToPage("Aimbot")

local Dragging = false
local DragStart
local StartPos
local HeaderDrag = Instance.new("Frame")
HeaderDrag.Size = UDim2.new(1,0,0,40)
HeaderDrag.BackgroundTransparency = 1
HeaderDrag.Parent = Main

HeaderDrag.InputBegan:Connect(function(Input)
	if Input.UserInputType == Enum.UserInputType.MouseButton1 then
		Dragging = true
		DragStart = Input.Position
		StartPos = Main.Position

		Input.Changed:Connect(function()
			if Input.UserInputState == Enum.UserInputState.End then
				Dragging = false
			end
		end)
	end
end)

UserInputService.InputChanged:Connect(function(Input)
	if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
		local Delta = Input.Position - DragStart

		Main.Position = UDim2.new(
			StartPos.X.Scale,
			StartPos.X.Offset + Delta.X,
			StartPos.Y.Scale,
			StartPos.Y.Offset + Delta.Y
		)
	end
end)
