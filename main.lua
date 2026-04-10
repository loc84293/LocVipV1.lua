-- [[ 👑 LỘC VIP V1 PRO 👑 ]] --
-- PHIÊN BẢN GỐC 100% - KHÔNG CHỈNH SỬA LOGIC

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 1. HỆ THỐNG BIẾN (VARIABLES) GỐC ]] --
_G.AutoFarm = false
_G.AutoQuest = true
_G.FastAttack = true
_G.SelectWeapon = "Melee"
_G.BringMob = true

-- [[ 2. HÀM BYPASS ANTI-CHEAT (GỐC) ]] --
local function Bypass()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" then return nil end
        return old(self, ...)
    end)
end
pcall(Bypass)

-- [[ 3. KHỞI TẠO GIAO DIỆN (RAYFIELD UI) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 PRO",
   LoadingTitle = "LỘC VIP V1 PRO ĐANG TẢI...",
   LoadingSubtitle = "Vui lòng chờ trong giây lát",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipPro_Data" },
   KeySystem = false
})

-- [[ 4. CÁC TAB TÍNH NĂNG (GIỮ NGUYÊN BỐ CỤC GỐC) ]] --

-- TAB MAIN
local TabMain = Window:CreateTab("Main", 4483345998)
TabMain:CreateSection("Auto Farm")

TabMain:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Logic Farm: Tìm quái -> Tween -> Đánh
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    -- Auto Equip
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.SelectWeapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.SelectWeapon)
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    -- Tween chuẩn Banana Speed
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                    
                    -- Bring Mob
                    if _G.BringMob then
                        for _, v in pairs(workspace.Enemies:GetChildren()) do
                            if v.Name == Enemy.Name then
                                v.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
                                v.HumanoidRootPart.CanCollide = false
                            end
                        end
                    end
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
   Callback = function(Value) _G.SelectWeapon = Value end,
})

-- TAB COMBAT
local TabCombat = Window:CreateTab("Combat", 4483345998)
TabCombat:CreateToggle({
    Name = "Fast Attack",
    CurrentValue = true,
    Callback = function(Value) _G.FastAttack = Value end
})

-- TAB SEA EVENTS
local TabSea = Window:CreateTab("Sea Events", 4483345998)
TabSea:CreateButton({Name = "Auto Terror Shark", Callback = function() end})

-- TAB FRUIT
local TabFruit = Window:CreateTab("Fruit", 4483345998)
TabFruit:CreateButton({
    Name = "Random Fruit",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

-- [[ 5. ENGINE XỬ LÝ ẨN (BACKEND) ]] --
spawn(function()
    while task.wait() do
        if _G.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = 100
                CF.activeController:attack()
            end)
        end
    end
end)

Rayfield:Notify({
   Title = "👑 LỘC VIP V1 PRO",
   Content = "Hệ thống đã sẵn sàng!",
   Duration = 5,
})
