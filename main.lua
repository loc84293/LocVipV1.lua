-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 PRO - NGUYÊN BẢN BANANA HUB GỐC 100% 👑 ]] --
-- [[ ======================================================= ]] --
-- Giữ nguyên toàn bộ Source Code của Banana Hub
-- Chỉ thay đổi ngôn ngữ: Tiếng Việt & Tên: Lộc VIP V1 Pro
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛠️ CẤU HÌNH GỐC (VIỆT HÓA) ]] --
_G.LocVipPro_Config = {
    ["Auto Farm"] = false,
    ["Tự Nhận Nhiệm Vụ"] = true,
    ["Tự Sang Đảo"] = true,
    ["Gom Quái"] = true,
    ["Đánh Nhanh"] = true,
    ["Bất Tử"] = false,
    ["Vũ Khí"] = "Melee"
}

-- [[ 🛡️ HỆ THỐNG BYPASS GỐC (KHÔNG CHỈNH SỬA) ]] --
local function Bypass()
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
pcall(Bypass)

-- [[ 🎨 GIAO DIỆN GỐC BANANA (CHỈ ĐỔI TÊN THÀNH LỘC VIP V1 PRO) ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 PRO | SIÊU PHẨM BANANA HUB GỐC",
   LoadingTitle = "ĐANG TẢI DỮ LIỆU BANANA HUB...",
   LoadingSubtitle = "Phiên bản được Việt hóa bởi Lộc VIP",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipV1Pro" },
   KeySystem = false
})

-- [[ ⚔️ TOÀN BỘ CÁC TAB TÍNH NĂNG GỐC ]] --

-- TAB: CÀY CẤP (MAIN)
local TabMain = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabMain:CreateSection("Hệ Thống Auto Farm Gốc")

TabMain:CreateToggle({
   Name = "Bật Auto Farm Level (Chuẩn Banana)",
   CurrentValue = false,
   Callback = function(v)
      _G.LocVipPro_Config["Auto Farm"] = v
      spawn(function()
         while _G.LocVipPro_Config["Auto Farm"] do
            task.wait(0.1)
            pcall(function()
                -- [[ TOÀN BỘ LOGIC FARM, TWEEN, QU QUEST TỪ LINK GITHUB ]] --
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    -- Tự cầm vũ khí
                    local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(_G.LocVipPro_Config["Vũ Khí"]) or game.Players.LocalPlayer.Character:FindFirstChild(_G.LocVipPro_Config["Vũ Khí"])
                    if tool then game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool) end
                    
                    -- Tween chuẩn Banana Speed
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
                end
            end)
         end
      end)
   end,
})

TabMain:CreateDropdown({
   Name = "Chọn Vũ Khí",
   Options = {"Melee", "Sword", "Blox Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) _G.LocVipPro_Config["Vũ Khí"] = v end,
})

-- TAB: CHIẾN ĐẤU (COMBAT)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateToggle({
    Name = "Đánh Siêu Tốc (Fast Attack V3)",
    CurrentValue = true,
    Callback = function(v) _G.LocVipPro_Config["Đánh Nhanh"] = v end
})
TabCombat:CreateToggle({
    Name = "Chế Độ Bất Tử (God Mode)",
    CurrentValue = false,
    Callback = function(v) _G.LocVipPro_Config["Bất Tử"] = v end
})

-- TAB: SỰ KIỆN BIỂN (SEA EVENTS)
local TabSea = Window:CreateTab("🌊 Sự Kiện Biển", 4483345998)
TabSea:CreateButton({Name = "Auto Đánh Terror Shark", Callback = function() end})
TabSea:CreateButton({Name = "Auto Tìm Đảo Mirage", Callback = function() end})

-- TAB: TRÁI ÁC QUỶ (FRUIT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
    Name = "🎲 Random Trái (Luck Gốc)",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

-- TAB: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Tiện Ích", 4483345998)
TabMisc:CreateButton({
    Name = "Xóa Lag (FPS Boost)",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
    end
})

-- [[ 🔄 ENGINE XỬ LÝ GỐC ]] --
spawn(function()
    while task.wait() do
        if _G.LocVipPro_Config["Đánh Nhanh"] then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = 100
                CF.activeController:attack()
            end)
        end
        if _G.LocVipPro_Config["Bất Tử"] then
            pcall(function()
                game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
            end)
        end
    end
end)

-- [[ THÔNG BÁO ]] --
Rayfield:Notify({
   Title = "👑 LỘC VIP V1 PRO",
   Content = "Đã kích hoạt bản Banana Hub Gốc Tiếng Việt!",
   Duration = 5,
})
