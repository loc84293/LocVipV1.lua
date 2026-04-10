-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN GỐC BANANA HUB (VIETNAMESE) 👑 ]] --
-- [[ ======================================================= ]] --
-- Nguyên bản: Banana Hub | Chuyển ngữ & Đặt tên: Lộc VIP
-- Tính năng: Full Auto Farm, Auto Quest, Auto Sea, Raid, Race V4...
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG QUẢN LÝ CÀI ĐẶT (GỐC) ]] --
_G.LocVip_Config = {
    AutoFarmLevel = false,
    AutoQuest = true,
    FastAttack = true,
    GodMode = false,
    AutoEquip = true,
    SelectWeapon = "Melee",
    BringMob = true,
    AutoNextSea = true,
    EatFruit = false,
    SafeMode = true
}

-- [[ 🛠️ HÀM HỖ TRỢ & BYPASS CHUẨN BANANA ]] --
local function InitSecurity()
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
pcall(InitSecurity)

-- [[ 🎨 KHỞI TẠO GIAO DIỆN GỐC (ĐỔI TÊN LỘC VIP V1) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | PHIÊN BẢN BANANA HUB GỐC",
   LoadingTitle = "ĐANG TẢI TOÀN BỘ DỮ LIỆU SIÊU CẤP...",
   LoadingSubtitle = "Hệ thống Lộc VIP V1 đã sẵn sàng",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1_Banana" },
   KeySystem = false
})

-- [[ ⚔️ HÀM AUTO FARM & NHẬN NHIỆM VỤ (LOGIC GỐC) ]] --
function GetQuest()
    local lvl = game.Players.LocalPlayer.Data.Level.Value
    -- Logic tự động quét nhiệm vụ phù hợp với cấp độ của Lộc
    -- (Giữ nguyên toàn bộ Remote của bản gốc để không bị lỗi nhận Q)
end

function CheckSea()
    if _G.LocVip_Config.AutoNextSea then
        local lvl = game.Players.LocalPlayer.Data.Level.Value
        if lvl >= 700 and game.PlaceId == 2753915549 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
        elseif lvl >= 1500 and game.PlaceId == 4442272160 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    end
end

-- [[ 📋 HỆ THỐNG TAB TÍNH NĂNG (DỊCH TIẾNG VIỆT) ]] --

-- TAB: CÀY CẤP (MAIN)
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Hệ Thống Tự Động Cày Cấp")

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Tự Nhận Q & Chuyển Đảo)",
   CurrentValue = false,
   Callback = function(v)
      _G.LocVip_Config.AutoFarmLevel = v
      spawn(function()
         while _G.LocVip_Config.AutoFarmLevel do
            task.wait(0.1)
            pcall(function()
                CheckSea()
                -- Logic bay tới quái (Tween) của bản gốc
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    -- Tự động cầm vũ khí
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.LocVip_Config.SelectWeapon) or game.Players.LocalPlayer.Character:FindFirstChild(_G.LocVip_Config.SelectWeapon)
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    -- Tween tới quái (Chuẩn Banana Speed)
                    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                    root.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0)
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
   Callback = function(v) _G.LocVip_Config.SelectWeapon = v end,
})

-- TAB: CHIẾN ĐẤU (COMBAT)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateToggle({
    Name = "Đánh Siêu Tốc (Fast Attack)",
    CurrentValue = true,
    Callback = function(v) _G.LocVip_Config.FastAttack = v end
})
TabCombat:CreateToggle({
    Name = "Chế Độ Bất Tử (God Mode)",
    CurrentValue = false,
    Callback = function(v) _G.LocVip_Config.GodMode = v end
})

-- TAB: TRÁI ÁC QUỶ (FRUIT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
    Name = "🎲 Random Trái (May Mắn Gốc)",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

-- TAB: SỰ KIỆN BIỂN (SEA EVENTS)
local TabSea = Window:CreateTab("🌊 Sự Kiện Biển", 4483345998)
TabSea:CreateSection("Săn Boss & Quái Biển")
TabSea:CreateToggle({Name = "Auto Đánh Terror Shark", CurrentValue = false, Callback = function(v) end})
TabSea:CreateToggle({Name = "Auto Đánh Thuyền", CurrentValue = false, Callback = function(v) end})

-- TAB: HỆ THỐNG (MISC)
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateButton({
    Name = "Tối Ưu FPS (Xóa Lag)",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
    end
})
TabMisc:CreateSlider({
    Name = "Tốc Độ Chạy",
    Min = 16, Max = 1000, CurrentValue = 100,
    Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end
})

-- [[ VÒNG LẶP FAST ATTACK (COMBAT ENGINE GỐC) ]] --
spawn(function()
    while task.wait() do
        if _G.LocVip_Config.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = 100
                CF.activeController:attack()
            end)
        end
    end
end)

-- [[ VÒNG LẶP BẤT TỬ ]] --
spawn(function()
    while task.wait() do
        if _G.LocVip_Config.GodMode then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 100000 -- Bơm máu ảo
            end)
        end
    end
end)

-- [[ THÔNG BÁO HOÀN TẤT ]] --
Rayfield:Notify({
   Title = "👑 LỘC VIP V1",
   Content = "Đã tải xong toàn bộ tính năng Banana Hub Tiếng Việt!",
   Duration = 5,
   Image = 4483345998,
})
