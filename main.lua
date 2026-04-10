-- [[ 👑 LỘC VIP V1 PRO 👑 ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ ⚙️ CONFIGURATION ]] --
_G.LocVip_Config = {
    ["Auto Farm"] = false,
    ["Auto Quest"] = true,
    ["Auto Next Island"] = true,
    ["Bring Mob"] = true,
    ["Fast Attack"] = true,
    ["God Mode"] = false,
    ["Weapon"] = "Melee"
}

-- [[ 🛡️ SECURITY BYPASS ]] --
local function InitBypass()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" or self.Name == "AdminDetect" then
            return nil
        end
        return old(self, ...)
    end)
end
pcall(InitBypass)

-- [[ 🎨 UI RENDER ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 PRO",
   LoadingTitle = "LỘC VIP V1 PRO LOADING...",
   LoadingSubtitle = "BY LỘC VIP",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipProConfig" },
   KeySystem = false
})

-- [[ ⚔️ MAIN TABS ]] --

local TabMain = Window:CreateTab("Main", 4483345998)
TabMain:CreateSection("Auto Farm")

TabMain:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(v)
      _G.LocVip_Config["Auto Farm"] = v
      spawn(function()
         while _G.LocVip_Config["Auto Farm"] do
            task.wait(0.1)
            pcall(function()
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.LocVip_Config["Weapon"]) or game.Players.LocalPlayer.Character:FindFirstChild(_G.LocVip_Config["Weapon"])
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                end
            end)
         end
      end)
   end,
})

TabMain:CreateDropdown({
   Name = "Select Weapon",
   Options = {"Melee", "Sword", "Blox Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) _G.LocVip_Config["Weapon"] = v end,
})

local TabCombat = Window:CreateTab("Combat", 4483345998)
TabCombat:CreateToggle({
    Name = "Fast Attack",
    CurrentValue = true,
    Callback = function(v) _G.LocVip_Config["Fast Attack"] = v end
})
TabCombat:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Callback = function(v) _G.LocVip_Config["God Mode"] = v end
})

local TabSea = Window:CreateTab("Sea Events", 4483345998)
TabSea:CreateButton({Name = "Auto Terror Shark", Callback = function() end})

local TabFruit = Window:CreateTab("Fruit", 4483345998)
TabFruit:CreateButton({
    Name = "Random Fruit",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

local TabMisc = Window:CreateTab("Misc", 4483345998)
TabMisc:CreateButton({
    Name = "FPS Boost",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
    end
})

-- [[ 🔄 CORE ENGINE ]] --
spawn(function()
    while task.wait() do
        if _G.LocVip_Config["Fast Attack"] then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = 100
                CF.activeController:attack()
            end)
        end
        if _G.LocVip_Config["God Mode"] then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
            end)
        end
    end
end)

Rayfield:Notify({
   Title = "👑 LỘC VIP V1 PRO",
   Content = "SCRIPT LOADED SUCCESSFULLY!",
   Duration = 5,
})
