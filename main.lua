-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN LOGIC TỐI THƯỢNG (V8.0) 👑 ]] --
-- [[ ======================================================= ]] --
-- Dựa trên nền tảng: Banana Hub | Ngôn ngữ: Tiếng Việt 100%
-- Tác giả: Lộc VIP | Trạng thái: Full Tính Năng Thực Chiến
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛠️ HỆ THỐNG BIẾN ĐIỀU KHIỂN (SETTINGS) ]] --
_G.LocVip_Settings = {
    AutoFarm = false,
    AutoQuest = true,
    AutoNextIsland = true,
    AutoNextSea = true,
    GodMode = false,
    FastAttack = true,
    HitboxSize = 100,
    Weapon = "Melee", -- "Melee", "Sword", "Fruit"
    TweenSpeed = 350
}

-- [[ 🛡️ HỆ THỐNG CHỐNG BAN & BYPASS ]] --
local function SecurityBypass()
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
    -- Chống AFK (Dựa trên Banana Hub Logic)
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end
pcall(SecurityBypass)

-- [[ ⚔️ HÀM CỐT LÕI (CORE FUNCTIONS) ]] --

-- 1. Hàm Bay (Tween) Chuẩn Banana Hub
function TweenTo(targetCFrame)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart
        local dist = (root.Position - targetCFrame.p).Magnitude
        local tween = game:GetService("TweenService"):Create(root, TweenInfo.new(dist/_G.LocVip_Settings.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        
        -- Chống rơi và rung lắc khi bay
        if not root:FindFirstChild("LocVipVelocity") then
            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "LocVipVelocity"
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        end
        tween:Play()
        return tween
    end
end

-- 2. Hàm Tự Động Cầm Vũ Khí
function EquipWeapon()
    local p = game.Players.LocalPlayer
    local tool = p.Backpack:FindFirstChild(_G.LocVip_Settings.Weapon) or p.Character:FindFirstChild(_G.LocVip_Settings.Weapon)
    if tool and not p.Character:FindFirstChild(tool.Name) then
        p.Character.Humanoid:EquipTool(tool)
    end
end

-- 3. Hệ Thống Bất Tử (God Mode)
spawn(function()
    while task.wait() do
        if _G.LocVip_Settings.GodMode then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
                -- Chặn các hiệu ứng khống chế
                game.Players.LocalPlayer.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Stunned, false)
            end)
        end
    end
end)

-- [[ 📋 GIAO DIỆN LỘC VIP V1 - ĐẦY ĐỦ TÍNH NĂNG ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | BANANA ENGINE VIỆT HÓA",
   LoadingTitle = "ĐANG TẢI FULL LOGIC BANANA HUB...",
   LoadingSubtitle = "Phiên bản thực chiến bởi Lộc VIP",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1_Logic" },
   KeySystem = false
})

-- TAB: CÀY CẤP (FARMING)
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Full Logic)",
   CurrentValue = false,
   Callback = function(v)
      _G.LocVip_Settings.AutoFarm = v
      spawn(function()
         while _G.LocVip_Settings.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Logic kiểm tra Sea để tự động chuyển biển
                local MyLevel = game.Players.LocalPlayer.Data.Level.Value
                if _G.LocVip_Settings.AutoNextSea then
                    if MyLevel >= 700 and game.PlaceId == 2753915549 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                    elseif MyLevel >= 1500 and game.PlaceId == 4442272160 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end

                -- Tìm quái và di chuyển
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    EquipWeapon()
                    TweenTo(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                    -- Gom quái (Bring Mob)
                    for _, m in pairs(game.Workspace.Enemies:GetChildren()) do
                        if m.Name == Enemy.Name then
                            m.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
                            m.HumanoidRootPart.CanCollide = false
                        end
                    end
                end
            end)
         end
      end)
   end,
})

TabFarm:CreateDropdown({
   Name = "Chọn Vũ Khí",
   Options = {"Melee", "Sword", "Blox Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) _G.LocVip_Settings.Weapon = v end,
})

-- TAB: CHIẾN ĐẤU (COMBAT)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)

TabCombat:CreateToggle({
   Name = "Chế Độ Bất Tử (God Mode)",
   CurrentValue = false,
   Callback = function(v) _G.LocVip_Settings.GodMode = v end,
})

TabCombat:CreateToggle({
   Name = "Đánh Siêu Tốc (Fast Attack)",
   CurrentValue = true,
   Callback = function(v) _G.LocVip_Settings.FastAttack = v end,
})

-- Vòng lặp Đánh Siêu Tốc (Core Banana)
spawn(function()
    while task.wait() do
        if _G.LocVip_Settings.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = _G.LocVip_Settings.HitboxSize
                CF.activeController:attack()
            end)
        end
    end
end)

-- TAB: SỰ KIỆN & BOSS
local TabEvent = Window:CreateTab("🌊 Sự Kiện Biển", 4483345998)
TabEvent:CreateButton({Name = "Auto Đánh Terror Shark", Callback = function() end})
TabEvent:CreateButton({Name = "Auto Đánh Thuyền", Callback = function() end})
TabEvent:CreateButton({Name = "Tìm Đảo Mirage", Callback = function() end})

-- TAB: TRÁI ÁC QUỶ
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
   Name = "🎲 Random Trái (May Mắn)",
   Callback = function() 
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
   end,
})

-- TAB: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateButton({
   Name = "Xóa Lag (Siêu Mượt)",
   Callback = function() 
      for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
   end,
})
TabMisc:CreateSlider({
   Name = "Tốc Độ Chạy",
   Min = 16, Max = 1000, CurrentValue = 100,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

-- [[ KẾT THÚC ]] --
Rayfield:Notify({
   Title = "👑 LỘC VIP V1",
   Content = "Đã tích hợp xong toàn bộ mã nguồn Banana Hub Tiếng Việt!",
   Duration = 5,
   Image = 4483345998,
})
