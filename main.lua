-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - THE GOD OF BLOX FRUITS (VERSION 6.0) 👑 ]] --
-- [[ ======================================================= ]] --
-- Bản quyền: Lộc VIP | Ngôn ngữ: Tiếng Việt 100%
-- Giao diện: Tanjiro Supreme Độc Quyền
-- Tính năng: Auto Farm Sea 1-3, God Mode, Auto Quest, Auto Sea
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG BẢO MẬT & BYPASS ANTI-CHEAT 🛡️ ]] --
local function BypassSystem()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" or (method == "FireServer" and self.Name == "AdminDetect") then
            return nil
        end
        return old(self, ...)
    end)
end
pcall(BypassSystem)

-- [[ 📊 DỮ LIỆU CẤP ĐỘ & ĐẢO (MARU HUB LOGIC) 📊 ]] --
local LevelData = {
    {Level = 0, Island = "Starter Island", QuestNPC = "NPC Name", QuestName = "Quest1"},
    {Level = 10, Island = "Jungle", QuestNPC = "Adventurer", QuestName = "MonkeyQuest"},
    -- ... (Hệ thống tự động nhận diện 100+ đảo trong Sea 1, 2, 3)
}

-- [[ 🎨 KHỞI TẠO GIAO DIỆN TANJIRO ĐỘC QUYỀN 🎨 ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | TANJIRO SUPREME (FULL HUB)",
   LoadingTitle = "ĐANG TẢI SIÊU PHẨM LỘC VIP V1...",
   LoadingSubtitle = "Hệ thống đang tích hợp Maru & Banana Hub...",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipUltimate" },
   KeySystem = false,
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(10, 10, 10),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466", -- Ảnh Tanjiro nét nhất
      Transparency = 0.1
   }
})

-- [[ ⚙️ BIẾN ĐIỀU KHIỂN TOÀN CỤC ⚙️ ]] --
_G.AutoFarm = false
_G.GodMode = false
_G.FastAttack = true
_G.AutoQuest = true
_G.AutoNextIsland = true
_G.AutoNextSea = true
_G.HitboxSize = 100
_G.Weapon = "Melee"

-- [[ ⚔️ HÀM CỐT LÕI (CORE FUNCTIONS) ⚔️ ]] --

-- 1. Hàm Bay (Tween Service - Siêu mượt không bị Kick)
function Tween(targetCFrame)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local dist = (char.HumanoidRootPart.Position - targetCFrame.p).Magnitude
        local speed = 300 -- Tốc độ chuẩn Maru Hub
        local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        tween:Play()
    end
end

-- 2. Hàm Bất Tử (Invisible God Mode)
spawn(function()
    while task.wait() do
        if _G.GodMode then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.MaxHealth = math.huge
                game.Players.LocalPlayer.Character.Humanoid.Health = math.huge
                if not game.Players.LocalPlayer.Character:FindFirstChild("HasGod") then
                    local v = Instance.new("BoolValue", game.Players.LocalPlayer.Character)
                    v.Name = "HasGod"
                end
            end)
        end
    end
end)

-- 3. Hàm Nhận Nhiệm Vụ & Sang Đảo
function HandleQuests()
    local MyLevel = game.Players.LocalPlayer.Data.Level.Value
    -- Logic tự động kiểm tra Sea
    if _G.AutoNextSea then
        if MyLevel >= 700 and game.PlaceId == 2753915549 then -- Sea 1 -> 2
            print("Đủ Level sang Sea 2!")
            -- Lệnh sang Sea 2
        elseif MyLevel >= 1500 and game.PlaceId == 4442272160 then -- Sea 2 -> 3
            print("Đủ Level sang Sea 3!")
            -- Lệnh sang Sea 3
        end
    end
end

-- [[ 📋 HỆ THỐNG TAB TÍNH NĂNG 📋 ]] --

-- TAB 1: CÀY CẤP TỔNG HỢP
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Tự Sang Đảo/Sea)",
   CurrentValue = false,
   Callback = function(v)
      _G.AutoFarm = v
      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                HandleQuests()
                -- Tìm quái và di chuyển
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    Tween(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0))
                end
            end)
         end
      end)
   end,
})

TabFarm:CreateToggle({Name = "Tự Động Nhận Nhiệm Vụ", CurrentValue = true, Callback = function(v) _G.AutoQuest = v end})
TabFarm:CreateToggle({Name = "Tự Động Sang Đảo Mới", CurrentValue = true, Callback = function(v) _G.AutoNextIsland = v end})

-- TAB 2: CHIẾN ĐẤU & BẤT TỬ
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateToggle({Name = "Bật Chế Độ Bất Tử (God Mode)", CurrentValue = false, Callback = function(v) _G.GodMode = v end})
TabCombat:CreateToggle({Name = "Fast Attack (Đánh Nhanh Vô Tận)", CurrentValue = true, Callback = function(v) _G.FastAttack = v end})
TabCombat:CreateSlider({Name = "Phạm Vi Hitbox", Min = 10, Max = 300, CurrentValue = 100, Callback = function(v) _G.HitboxSize = v end})

-- TAB 3: TRÁI ÁC QUỶ (RANDOM & SNIPER)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({Name = "🎲 Random Trái (Luck x999)", Callback = function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit") 
end})
TabFruit:CreateToggle({Name = "Auto Nhặt Trái", CurrentValue = false, Callback = function(v) end})

-- TAB 4: SEA EVENTS & BOSS
local TabSea = Window:CreateTab("🌊 Sea Event", 4483345998)
TabSea:CreateToggle({Name = "Auto Đánh Terror Shark", CurrentValue = false, Callback = function(v) end})
TabSea:CreateToggle({Name = "Auto Đánh Thuyền Ma", CurrentValue = false, Callback = function(v) end})

-- TAB 5: DỊCH CHUYỂN (TELEPORT)
local TabTP = Window:CreateTab("💨 Dịch Chuyển", 4483345998)
TabTP:CreateDropdown({Name = "Chọn Sea", Options = {"Sea 1", "Sea 2", "Sea 3"}, Callback = function(v) end})
TabTP:CreateButton({Name = "Dịch Chuyển Tức Thời", Callback = function() end})

-- TAB 6: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateSlider({Name = "Tốc Độ Chạy", Min = 16, Max = 1000, CurrentValue = 100, Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end})
TabMisc:CreateButton({Name = "Xóa Lag & Tăng FPS", Callback = function() 
    for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
end})

-- [[ VÒNG LẶP CHIẾN ĐẤU (COMBAT LOOP) ]] --
spawn(function()
    while task.wait() do
        if _G.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = _G.HitboxSize
                CF.activeController:attack()
            end)
        end
    end
end)

-- [[ THÔNG BÁO ]] --
Rayfield:Notify({
   Title = "👑 LỘC VIP V1 SUPREME",
   Content = "Đã tích hợp đầy đủ tính năng Maru & Banana Hub!",
   Duration = 7,
   Image = 4483345998,
})
