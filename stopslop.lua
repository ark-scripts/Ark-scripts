local player = game.Players.LocalPlayer
local user = player.Name
local sg = {
	"Cross roads for brainrots, 89072926726733",
	"PlaceHolder"
}

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Stop slop",
    Icon = 0,
    LoadingTitle = "Loading stop slop",
    LoadingSubtitle = "By team ark",
    Theme = "Dark",
    DisableBuildWarnings = true,
    ConfigurationSaving = {
        Enabled = true
    },
    ToggleUIKeybind = "K"
})

local GameTab = Window:CreateTab("Game", 11396131982)
local GamesTab = Window:CreateTab("Games", 11476626403)
local UniversalTab = Window:CreateTab("Universal", 11476626403)
local GamesSection = GamesTab:CreateSection("Games supported:")
GamesTab:CreateButton({
	Name = "Print supported games",
	Callback = function()
	for i, v in ipairs(sg) do
    	print(i, v)
	end
	end,
})


local ButtonSection = GameTab:CreateSection("Scripts for this game:")
if game.PlaceId == 89072926726733 then
	local plot = game.Workspace:FindFirstChild("Plot_" .. user)
	local sf = plot.Floor1.Slots -- add more shit if u want but thats ur stuff
	GameTab:CreateButton({
		Name = "Anti pedophile",
		Callback = function()
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.HUD.Right:Destroy()
		end,
	})

	GameTab:CreateButton({
		Name = "Best zone",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				hrp.CFrame = CFrame.new(336, 4, 2253)
			end
		end,
	})

	GameTab:CreateButton({
		Name = "Go back",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				hrp.CFrame = CFrame.new(351, 2, -4)
			end
		end,
	})

	GameTab:CreateButton({
		Name = "Claim (hold brainrot)",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				local oldCFrame = hrp.CFrame

				hrp.CFrame = CFrame.new(661, 195, 2242)
				task.wait(0.2) 
				hrp.CFrame = oldCFrame
			end
		end,
	})

	local ToggleSection = GameTab:CreateSection("Scripts for this game: (toggles)")

	local player = game:GetService("Players").LocalPlayer

	local AutoClaim = false

	GameTab:CreateToggle({
		Name = "Auto Celestial",
		CurrentValue = false,
		Flag = "AutoClaimCelestial",
		Callback = function(Value)
			AutoClaim = Value

			while AutoClaim do
				local player = game:GetService("Players").LocalPlayer
				local character = player.Character
				local hrp = character and character:FindFirstChild("HumanoidRootPart")

				local spawner = workspace.ItemSpawners:FindFirstChild("Celestial")
				local item = spawner and spawner:FindFirstChild("SpawnedItem")
				local mesh = item and (item:FindFirstChildWhichIsA("SpecialMesh") or item:FindFirstChildWhichIsA("MeshPart"))
				if hrp and mesh then
					local oldCFrame = hrp.CFrame
					local vim = game:GetService("VirtualInputManager")

					hrp.CFrame = CFrame.new(mesh.Position)

					local endTime = tick() + 0.2
					while tick() < endTime and AutoClaim do
						vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
						vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
						task.wait()
					end

					hrp.CFrame = CFrame.new(661, 195, 2242)
					task.wait(0.2)
					hrp.CFrame = oldCFrame
				end
				task.wait(0.5)
			end
		end,
	})

	GameTab:CreateToggle({
		Name = "Auto Collect",
		CurrentValue = false,
		Flag = "AutoCollectMoney",
		Callback = function(Value)
			AutoCollect = Value

			while AutoCollect do
				local character = player.Character
				local hrp = character and character:FindFirstChild("HumanoidRootPart")

				for _, v in ipairs(sf:GetChildren()) do
					local collectTouch = v:FindFirstChild("CollectTouch")
					if collectTouch and hrp then
						firetouchinterest(hrp, collectTouch, 0)
						firetouchinterest(hrp, collectTouch, 1)
					end
				end
				task.wait(1)
			end
		end
	})

elseif game.PlaceId == 84332574190497 then
		local plot = game.Workspace.Plots:FindFirstChild("Plot_" .. user)
		local sf = plot.Floor1.Slots -- add more shit if u want but thats ur stuff and also idk why its the same system
		GameTab:CreateButton({
		Name = "god section",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				hrp.CFrame = CFrame.new(32, 3, 9999)
			end
		end,
	})


		GameTab:CreateButton({
		Name = "cosmic section",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				hrp.CFrame = CFrame.new(38, 7, 6163)
			end
		end,
	})

		GameTab:CreateButton({
		Name = "claim (hold brainrot)",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				local oldCFrame = hrp.CFrame
				hrp.CFrame = CFrame.new(5, 2, 5)
				task.wait(0.1) 
				hrp.CFrame = oldCFrame
			end
		end,
	})

		GameTab:CreateButton({
		Name = "go back",
		Callback = function()
			local player = game:GetService("Players").LocalPlayer
			local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

			if hrp then
				hrp.CFrame = CFrame.new(5, 2, 5)
			end
		end,
	})
	local ToggleSection = GameTab:CreateSection("Scripts for this game: (toggles)")

	GameTab:CreateToggle({
		Name = "Auto Collect",
		CurrentValue = false,
		Flag = "AutoCollectMoney",
		Callback = function(Value)
			AutoCollect = Value

			while AutoCollect do
				local character = player.Character
				local hrp = character and character:FindFirstChild("HumanoidRootPart")

				for _, v in ipairs(sf:GetChildren()) do
					local collectTouch = v:FindFirstChild("CollectTouch")
					if collectTouch and hrp then
						firetouchinterest(hrp, collectTouch, 0)
						firetouchinterest(hrp, collectTouch, 1)
					end
				end
				task.wait(1)
			end
		end
	})

	local vim = game:GetService("VirtualInputManager")

	GameTab:CreateToggle({
		Name = "Auto cosmic",
		CurrentValue = false,
		Flag = "AutoClaimCosmic",
		Callback = function(Value)
			AutoCosmic = Value

			while AutoCosmic do
				local character = player.Character
				local hrp = character and character:FindFirstChild("HumanoidRootPart")

				if hrp then
					local sg = workspace.ItemSpawners:FindFirstChild("Cosmic")

					if sg then
						local foundItem = false

						for _, item in ipairs(sg:GetChildren()) do
							local part = item:FindFirstChildWhichIsA("BasePart", true)

							if part then
								foundItem = true

								hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
								task.wait(0.2)

								vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
								task.wait(0.1)
								vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)

								task.wait(1)

								hrp.CFrame = CFrame.new(5, 2, 5)

								break
							end
						end

						if not foundItem then
							hrp.CFrame = sg.CFrame + Vector3.new(0, 3, 0)
						end
					else
						hrp.CFrame = CFrame.new(38, 7, 6163)
					end
				end

				task.wait(0.25)
			end
		end,
	})

		GameTab:CreateToggle({
		Name = "Auto god",
		CurrentValue = false,
		Flag = "AutoClaimGod",
		Callback = function(Value)
			AutoGod = Value

			while AutoGod do
				local character = player.Character
				local hrp = character and character:FindFirstChild("HumanoidRootPart")

				if hrp then
					local sg = workspace.ItemSpawners:FindFirstChild("God")

					if sg then
						local foundItem = false

						for _, item in ipairs(sg:GetChildren()) do
							local part = item:FindFirstChildWhichIsA("BasePart", true)

							if part then
								foundItem = true

								hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
								task.wait(0.2)

								vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
								task.wait(0.1)
								vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)

								task.wait(1)

								hrp.CFrame = CFrame.new(5, 2, 5)

								break
							end
						end

						if not foundItem then
							hrp.CFrame = sg.CFrame + Vector3.new(0, 3, 0)
						end
					else
						hrp.CFrame = CFrame.new(27, 3, 10002)
					end
				end

				task.wait(0.25)
			end
		end,
	})

else
local z = GameTab:CreateParagraph({
    Title = "Ts game doesnt support da script, check games tab",
    Content = "🥀"
})
end
