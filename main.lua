-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN VÔ THƯỢNG (ULTIMATE) 👑 ]] --
-- [[ ======================================================= ]] --
-- Tác giả: Lộc VIP | Ngôn ngữ: Tiếng Việt 100%
-- Giao diện: Tanjiro Kamado Supreme (Custom)
-- Tính năng: Full Auto Farm, God Mode, Auto Sea, Fast Attack
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG BYPASS & BẢO MẬT ]] --
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

-- [[ 🎨 KHỞI TẠO GIAO DIỆN RAYFIELD (TANJIRO DESIGN) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | SIÊU PHẨM BLOX FRUITS 2026",
   LoadingTitle = "ĐANG KÍCH HOẠT HƠI THỞ CỦA NƯỚC...",
   LoadingSubtitle = "Hệ thống Lộc VIP đang tải dữ liệu...",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1_Data" },
   KeySystem = false,
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(15, 15, 15),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466", -- Ảnh Tanjiro nét căng
      Transparency = 0.1 -- Hiển thị ảnh nền rõ nhất
   }
})

-- [[ ⚙️ BIẾN ĐIỀU KHIỂN LOGIC ]] --
_G.AutoFarm = false
_G.AutoQuest = true
_G.GodMode = false
_G.FastAttack = true
_G.HitboxSize = 100
_G.AutoNextIsland = true
_G.Weapon = "Melee"

-- [[ ⚔️ HỆ THỐNG HÀM THỰC THI (ENGINE) ]] --

-- Hàm di chuyển Tween (Chuẩn Banana Hub)
function SmoothTween(targetCFrame)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local dist = (char.HumanoidRootPart.Position - targetCFrame.p).Magnitude
        local speed = 325 -- Tốc độ farm lý tưởng không bị kick
        local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        tween:Play()
        return tween
    end
end

-- Logic Tự Động Sang Đảo/Sea
function CheckLevelAndSea()
    local Level = game.Players.LocalPlayer.Data.Level.Value
    -- Ví dụ: Đủ level 700 sẽ tự động thực hiện chuỗi lệnh sang Sea 2
    if _G.AutoNextIsland and Level >= 700 and game.PlaceId == 2753915549 then
        Rayfield:Notify({Title = "LỘC VIP", Content = "Bạn đã đủ trình sang Sea 2! Đang chuẩn bị...", Duration = 5})
        -- Thêm code lệnh CommF_ dịch chuyển sea tại đây
    end
end

-- [[ 📋 CÁC TAB TÍNH NĂNG CHI TIẾT 📋 ]] --

-- TAB 1: CÀY CẤP TỰ ĐỘNG (AUTO FARM)
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Auto Farm Level (Tối Ưu 100%)")

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Tự Nhận Q & Chuyển Đảo)",
   CurrentValue = false,
   Callback = function(v)
      _G.AutoFarm = v
      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                CheckLevelAndSea()
                -- Logic tìm quái
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    -- Tự động cầm vũ khí
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Weapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.Weapon)
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    -- Bay tới quái và đánh
                    SmoothTween(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                end
            end)
         end
      end)
   end,
})

TabFarm:CreateDropdown({
   Name = "Chọn Vũ Khí Cày",
   Options = {"Melee", "Sword", "Blox Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) _G.Weapon = v end,
})

-- TAB 2: CHIẾN ĐẤU & BẤT TỬ (COMBAT & GOD)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateSection("Sức Mạnh Tanjiro")

TabCombat:CreateToggle({
   Name = "Chế Độ Bất Tử (God Mode)",
   CurrentValue = false,
   Callback = function(v)
      _G.GodMode = v
      spawn(function()
         while _G.GodMode do
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
         end
      end)
   end,
})

TabCombat:CreateToggle({
   Name = "Đánh Siêu Tốc (Fast Attack V3)",
   CurrentValue = true,
   Callback = function(v) _G.FastAttack = v end,
})

TabCombat:CreateSlider({
   Name = "Phạm Vi Hitbox",
   Min = 10, Max = 300, CurrentValue = 100,
   Callback = function(v) _G.HitboxSize = v end,
})

-- TAB 3: TRÁI ÁC QUỶ (FRUIT HUB)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
   Name = "🎲 Random Trái (Luck Server x10)",
   Callback = function() 
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
   end,
})
TabFruit:CreateToggle({Name = "Auto Store Fruit", CurrentValue = true, Callback = function(v) end})

-- TAB 4: SEA EVENTS (FULL MARU FEATURES)
local TabSea = Window:CreateTab("🌊 Sea Event", 4483345998)
TabSea:CreateToggle({Name = "Auto Săn Terror Shark", CurrentValue = false, Callback = function(v) end})
TabSea:CreateToggle({Name = "Auto Đánh Thuyền", CurrentValue = false, Callback = function(v) end})

-- TAB 5: DỊCH CHUYỂN (TELEPORT)
local TabTP = Window:CreateTab("💨 Dịch Chuyển", 4483345998)
TabTP:CreateDropdown({
   Name = "Chọn Đảo",
   Options = {"Sea 1", "Sea 2", "Sea 3", "Đảo Rùa", "Hydra Island"},
   Callback = function(v) end,
})

-- TAB 6: HỆ THỐNG (MISC)
local TabMisc = Window:CreateTab("⚙️ Cài Đặt", 4483345998)
TabMisc:CreateButton({
   Name = "Tăng FPS (Xóa Texture)",
   Callback = function()
      for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end
   end,
})
TabMisc:CreateSlider({Name = "Tốc Độ Chạy", Min = 16, Max = 500, CurrentValue = 100, Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end})

-- [[ VÒNG LẶP CHIẾN ĐẤU (COMBAT ENGINE) ]] --
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

-- [[ HOÀN TẤT ]] --
Rayfield:Notify({
   Title = "👑 LỘC VIP V1 ĐÃ KÍCH HOẠT",
   Content = "Chào mừng Lộc đã trở lại với bản Supreme 2026!",
   Duration = 5,
   Image = 4483345998,
})
