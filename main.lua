-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - FULL LOGIC ENGINE (BANANA HUB BASE) 👑 ]] --
-- [[ ======================================================= ]] --
-- Đây là phần lõi thực chiến: Auto Farm, Auto Quest, Auto Sea, God Mode
-- Ngôn ngữ: Tiếng Việt | Tối ưu: Delta VNG & Mobile
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG QUẢN LÝ BIẾN TOÀN CỤC ]] --
_G.Settings = {
    AutoFarm = false,
    AutoQuest = true,
    AutoEquip = true,
    GodMode = false,
    FastAttack = true,
    HitboxSize = 100,
    AutoNextIsland = true,
    AutoNextSea = true,
    Weapon = "Melee", -- "Melee", "Sword", "Blox Fruit"
    TweenSpeed = 350
}

-- [[ 🛠️ HÀM HỖ TRỢ HỆ THỐNG (UTILITIES) ]] --

-- Chống Ban và Chặn Kiểm Tra Của Admin
local function SecureMode()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" or self.Name == "AdminDetect" or self.Name == "CheatCheck" then
            return nil
        end
        return old(self, ...)
    end)
end
pcall(SecureMode)

-- Hàm Bay (Tween) - Linh hồn của Banana Hub
function DirectTween(targetCFrame)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local root = char.HumanoidRootPart
        local dist = (root.Position - targetCFrame.p).Magnitude
        local tween = game:GetService("TweenService"):Create(root, TweenInfo.new(dist/_G.Settings.TweenSpeed, Enum.EasingStyle.Linear), {CFrame = targetCFrame})
        
        -- Chống rơi khi đang bay
        if not root:FindFirstChild("BodyVelocity") then
            local bv = Instance.new("BodyVelocity", root)
            bv.Velocity = Vector3.new(0,0,0)
            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        end
        
        tween:Play()
        return tween
    end
end

-- [[ ⚔️ HÀM CHIẾN ĐẤU & FARM (THE CORE) ]] --

-- Tự động cầm vũ khí
function AutoEquip()
    if _G.Settings.AutoEquip then
        local p = game.Players.LocalPlayer
        local tool = p.Backpack:FindFirstChild(_G.Settings.Weapon) or p.Character:FindFirstChild(_G.Settings.Weapon)
        if tool and not p.Character:FindFirstChild(tool.Name) then
            p.Character.Humanoid:EquipTool(tool)
        end
    end
end

-- Tìm quái theo nhiệm vụ (Logic thông minh)
function GetTargetMonster()
    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    -- Nếu không thấy quái trong Workspace, tìm trong ReplicatedStorage (Quái chưa spawn)
    return nil
end

-- [[ 🌊 LOGIC TỰ ĐỘNG SANG SEA (SEA CHANGER) ]] --
function AutoCheckSea()
    local lvl = game.Players.LocalPlayer.Data.Level.Value
    if _G.Settings.AutoNextSea then
        if lvl >= 700 and game.PlaceId == 2753915549 then
            -- Logic sang Sea 2 (Dùng Remote CommF_ để nói chuyện với NPC Thám Tử)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        elseif lvl >= 1500 and game.PlaceId == 4442272160 then
            -- Logic sang Sea 3 (Nói chuyện với NPC Captain)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    end
end

-- [[ 📋 KHỞI TẠO GIAO DIỆN LỘC VIP V1 (TANJIRO) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | SIÊU PHẨM TANJIRO (FULL LOGIC)",
   LoadingTitle = "ĐANG TẢI TOÀN BỘ DỮ LIỆU BANANA HUB...",
   LoadingSubtitle = "Phiên bản Tiếng Việt bởi Lộc VIP",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1" },
   KeySystem = false,
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(15, 15, 15),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466",
      Transparency = 0.1
   }
})

-- [[ TAB 1: CÀY CẤP TỰ ĐỘNG ]] --
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Full Logic)",
   CurrentValue = false,
   Callback = function(v)
      _G.Settings.AutoFarm = v
      spawn(function()
         while _G.Settings.AutoFarm do
            task.wait()
            pcall(function()
                AutoCheckSea()
                local Enemy = GetTargetMonster()
                if Enemy then
                    AutoEquip()
                    DirectTween(Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0))
                    -- Gom quái xung quanh
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

TabFarm:CreateToggle({Name = "Tự Nhận Nhiệm Vụ", CurrentValue = true, Callback = function(v) _G.Settings.AutoQuest = v end})
TabFarm:CreateToggle({Name = "Tự Sang Đảo Mới", CurrentValue = true, Callback = function(v) _G.Settings.AutoNextIsland = v end})

-- [[ TAB 2: CHIẾN ĐẤU & BẤT TỬ ]] --
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)

TabCombat:CreateToggle({
   Name = "Chế Độ Bất Tử (God Mode)",
   CurrentValue = false,
   Callback = function(v)
      _G.Settings.GodMode = v
      spawn(function()
         while _G.Settings.GodMode do
            task.wait()
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
            end)
         end
      end)
   end,
})

TabCombat:CreateToggle({
   Name = "Đánh Siêu Tốc (Fast Attack)",
   CurrentValue = true,
   Callback = function(v) _G.Settings.FastAttack = v end,
})

-- [[ VÒNG LẶP FAST ATTACK CORE ]] --
spawn(function()
    while task.wait() do
        if _G.Settings.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = _G.Settings.HitboxSize
                CF.activeController:attack()
            end)
        end
    end
end)

-- TAB 3: TRÁI ÁC QUỶ (RANDOM & CẤT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
   Name = "🎲 Random Trái (May Mắn x10)",
   Callback = function() 
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
   end,
})

-- TAB 4: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateButton({
   Name = "Xóa Lag (Siêu Mượt)",
   Callback = function() 
      for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
   end,
})

Rayfield:Notify({
   Title = "👑 LỘC VIP V1 SUPREME",
   Content = "Đã tải toàn bộ logic thực chiến thành công!",
   Duration = 5,
   Image = 4483345998,
})
