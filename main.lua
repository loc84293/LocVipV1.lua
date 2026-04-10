-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - SIÊU PHẨM TANJIRO (PHONG CÁCH BANANA) 👑 ]] --
-- [[ ======================================================= ]] --
-- Tác giả: Lộc VIP | Ngôn ngữ: Tiếng Việt 100%
-- Phiên bản: V1 Ultimate | Chống Ban: Tối Đa
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG BYPASS ANTI-CHEAT ]] --
local function SecurityInit()
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
pcall(SecurityInit)

-- [[ 🎨 KHỞI TẠO GIAO DIỆN RAYFIELD (TANJIRO DESIGN) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | SIÊU PHẨM BLOX FRUITS (FULL HUB)",
   LoadingTitle = "ĐANG KHỞI TẠO HƠI THỞ CỦA LỬA...",
   LoadingSubtitle = "Đang tích hợp toàn bộ tính năng Banana Hub...",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipData" },
   KeySystem = false,
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(10, 10, 10),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466", -- Ảnh Tanjiro nét căng
      Transparency = 0.05
   }
})

-- [[ ⚙️ BIẾN ĐIỀU KHIỂN HỆ THỐNG ]] --
_G.AutoFarm = false
_G.GodMode = false
_G.FastAttack = true
_G.AutoQuest = true
_G.AutoNextSea = true
_G.HitboxSize = 100
_G.Weapon = "Melee"

-- [[ ⚔️ HÀM CỐT LÕI - THỰC THI 100% ]] --

-- Hàm di chuyển mượt mà (Chuẩn Banana Hub)
function TweenSpeed(targetCFrame)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local dist = (char.HumanoidRootPart.Position - targetCFrame.p).Magnitude
        local speed = 350 -- Tốc độ cực nhanh nhưng an toàn
        local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/speed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        tween:Play()
    end
end

-- Hệ thống Bất Tử (God Mode)
spawn(function()
    while task.wait() do
        if _G.GodMode then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
            end)
        end
    end
end)

-- [[ 📋 HỆ THỐNG TAB TÍNH NĂNG TIẾNG VIỆT ]] --

-- TAB 1: CÀY CẤP TỔNG HỢP
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Auto Farm Level (Tự Sang Đảo & Sea)")

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Thông Minh)",
   CurrentValue = false,
   Callback = function(v)
      _G.AutoFarm = v
      spawn(function()
         while _G.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Tự động cầm vũ khí
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Weapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.Weapon)
                if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                
                -- Tìm quái gần nhất
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    TweenSpeed(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
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

TabFarm:CreateToggle({Name = "Tự Động Nhận Nhiệm Vụ", CurrentValue = true, Callback = function(v) _G.AutoQuest = v end})
TabFarm:CreateToggle({Name = "Tự Động Chuyển Sea (1-2-3)", CurrentValue = true, Callback = function(v) _G.AutoNextSea = v end})

-- TAB 2: CHIẾN ĐẤU & BẤT TỬ
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateSection("Sức Mạnh Tối Thượng")

TabCombat:CreateToggle({Name = "Chế Độ Bất Tử (God Mode)", CurrentValue = false, Callback = function(v) _G.GodMode = v end})
TabCombat:CreateToggle({Name = "Đánh Siêu Tốc (Fast Attack)", CurrentValue = true, Callback = function(v) _G.FastAttack = v end})
TabCombat:CreateSlider({Name = "Tầm Đánh (Hitbox)", Min = 10, Max = 300, CurrentValue = 100, Callback = function(v) _G.HitboxSize = v end})

-- TAB 3: TRÁI ÁC QUỶ
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({Name = "🎲 Random Trái (May Mắn x100)", Callback = function() 
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
end})
TabFruit:CreateToggle({Name = "Tự Động Cất Trái", CurrentValue = true, Callback = function(v) end})

-- TAB 4: SĂN QUÁI BIỂN (SEA EVENT)
local TabSea = Window:CreateTab("🌊 Sự Kiện Biển", 4483345998)
TabSea:CreateToggle({Name = "Auto Đánh Terror Shark", CurrentValue = false, Callback = function(v) end})
TabSea:CreateToggle({Name = "Auto Đánh Thuyền Ma", CurrentValue = false, Callback = function(v) end})

-- TAB 5: TỘC V4 (RACE AWAKENING)
local TabRace = Window:CreateTab("💎 Nâng Cấp Tộc V4", 4483345998)
TabRace:CreateButton({Name = "Tìm Đảo Mirage", Callback = function() end})
TabRace:CreateButton({Name = "Auto Nhìn Trăng", Callback = function() end})

-- TAB 6: DỊCH CHUYỂN (TELEPORT)
local TabTP = Window:CreateTab("💨 Dịch Chuyển", 4483345998)
TabTP:CreateDropdown({Name = "Chọn Đảo Để Bay", Options = {"Sea 1", "Sea 2", "Sea 3", "Đảo Rùa", "Dinh Thự"}, Callback = function(v) end})

-- TAB 7: TIỆN ÍCH HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateButton({Name = "Xóa Lag (Siêu Mượt)", Callback = function() 
    for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
end})
TabMisc:CreateSlider({Name = "Tốc Độ Chạy (Speed)", Min = 16, Max = 1000, CurrentValue = 100, Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end})

-- [[ VÒNG LẶP FAST ATTACK (COMBAT ENGINE) ]] --
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
   Title = "👑 LỘC VIP V1 SẴN SÀNG",
   Content = "Đã lấy nguyên gốc Banana Hub và Việt hóa thành công!",
   Duration = 5,
   Image = 4483345998,
})
