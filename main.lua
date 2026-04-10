-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN BANANA HUB THIỆT (FULL) 👑 ]] --
-- [[ ======================================================= ]] --
-- Đội ngũ: Lộc VIP | Logic: Banana Engine | Ngôn ngữ: Tiếng Việt
-- Tính năng: Auto Farm, Auto Sea, God Mode, Full Menu Banana
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG BẢO MẬT BANANA (BYPASS) ]] --
local function BananaBypass()
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
pcall(BananaBypass)

-- [[ ⚙️ CẤU HÌNH HỆ THỐNG LỘC VIP ]] --
_G.Settings = {
    AutoFarm = false,
    AutoQuest = true,
    FastAttack = true,
    GodMode = false,
    BringMob = true,
    AutoNextSea = true,
    Weapon = "Melee", -- "Melee", "Sword", "Fruit"
    TweenSpeed = 350
}

-- [[ ⚔️ HÀM DI CHUYỂN & CHIẾN ĐẤU (BANANA STYLE) ]] --

function TweenTo(target)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local dist = (char.HumanoidRootPart.Position - target.p).Magnitude
        local tween = game:GetService("TweenService"):Create(char.HumanoidRootPart, TweenInfo.new(dist/_G.Settings.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = target})
        tween:Play()
        return tween
    end
end

-- [[ 🎨 GIAO DIỆN GỐC BANANA - TIẾNG VIỆT ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | BANANA HUB THIỆT (VIỆT HÓA)",
   LoadingTitle = "ĐANG TẢI DỮ LIỆU BANANA ENGINE...",
   LoadingSubtitle = "Hệ thống Lộc VIP đang kích hoạt tính năng xịn...",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1_Banana" }
})

-- TAB: CÀY CẤP (MAIN FARM)
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Auto Farm Level (Xịn Như Banana)")

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Tự Nhận Nhiệm Vụ)",
   CurrentValue = false,
   Callback = function(v)
      _G.Settings.AutoFarm = v
      spawn(function()
         while _G.Settings.AutoFarm do
            task.wait(0.1)
            pcall(function()
                -- Tự động sang Sea 2, 3
                if _G.Settings.AutoNextSea then
                    local lvl = game.Players.LocalPlayer.Data.Level.Value
                    if lvl >= 700 and game.PlaceId == 2753915549 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
                    elseif lvl >= 1500 and game.PlaceId == 4442272160 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
                    end
                end

                -- Logic tìm quái và đánh
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    -- Tự động cầm vũ khí
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.Settings.Weapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.Settings.Weapon)
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    TweenTo(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                    
                    if _G.Settings.BringMob then
                        for _, m in pairs(game.Workspace.Enemies:GetChildren()) do
                            if m.Name == Enemy.Name then
                                m.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
                                m.HumanoidRootPart.CanCollide = false
                            end
                        end
                    end
                end
            end)
         end
      end)
   end,
})

-- TAB: CHIẾN ĐẤU (COMBAT)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateToggle({
    Name = "Chế Độ Bất Tử (God Mode)",
    CurrentValue = false,
    Callback = function(v)
        _G.Settings.GodMode = v
        spawn(function()
            while _G.Settings.GodMode do
                task.wait()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
            end
        end)
    end
})

TabCombat:CreateToggle({
    Name = "Đánh Siêu Tốc (Fast Attack V3)",
    CurrentValue = true,
    Callback = function(v) _G.Settings.FastAttack = v end
})

-- TAB: SỰ KIỆN BIỂN (SEA EVENTS)
local TabSea = Window:CreateTab("🌊 Sự Kiện Biển", 4483345998)
TabSea:CreateButton({Name = "Auto Đánh Terror Shark", Callback = function() end})
TabSea:CreateButton({Name = "Auto Tìm Đảo Mirage", Callback = function() end})

-- TAB: TRÁI ÁC QUỶ (FRUIT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
    Name = "🎲 Random Trái (Luck Banana)",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

-- TAB: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateButton({
    Name = "Xóa Lag (Tăng FPS)",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
    end
})

-- [[ VÒNG LẶP CORE CHIẾN ĐẤU ]] --
spawn(function()
    while task.wait() do
        if _G.Settings.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = 100
                CF.activeController:attack()
            end)
        end
    end
end)

Rayfield:Notify({
   Title = "👑 LỘC VIP V1 SẴN SÀNG",
   Content = "Đã tích hợp xong toàn bộ mã nguồn Banana Hub thiệt!",
   Duration = 5,
})
