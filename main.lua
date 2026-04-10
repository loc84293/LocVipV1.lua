-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN KHÔNG KEY (NO KEY) 👑 ]] --
-- NỀN TẢNG: REDZ HUB SUPREME (MƯỢT HƠN MIXI)
-- TRẠNG THÁI: ĐÃ PHÁ KHÓA VĨNH VIỄN | VIỆT HÓA 100%

local LộcVip_Brand = "👑 LỘC VIP V1"

-- [ 🛡️ BYPASS HỆ THỐNG KEY ] --
getgenv().Config = {["Key"] = "LocVipNoKey"}
getgenv().Verified = true

-- [ 🎨 KHỞI CHẠY INTERFACE ] --
local RedzLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/luacoder-byte/luacoder/refs/heads/main/RedzHub.lua"))()

local Window = RedzLib:MakeGui({
  Name = LộcVip_Brand,
  VisualName = "Lộc VIP V1 - No Key Edition",
  ConfigGuid = "LocVipConfig"
})

-- [ ⚔️ TAB CHÍNH: CÀY CẤP ] --
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", "rbxassetid://4483345998")

TabFarm:AddToggle({
  Name = "Auto Farm Level (Siêu Tốc)",
  Default = false,
  Callback = function(v)
    _G.AutoFarm = v
  end
})

TabFarm:AddDropdown({
  Name = "Chọn Vũ Khí",
  Options = {"Cận Chiến", "Kiếm", "Trái Ác Quỷ"},
  Default = "Cận Chiến",
  Callback = function(v) _G.SelectWeapon = v end
})

-- [ 🔥 TAB CHIẾN ĐẤU ] --
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", "rbxassetid://4483345998")
TabCombat:AddToggle({Name = "Đánh Siêu Nhanh (Fast Attack)", Default = true, Callback = function(v) _G.FastAttack = v end})
TabCombat:AddToggle({Name = "Bất Tử (God Mode)", Default = false, Callback = function(v) _G.GodMode = v end})

-- [ 🍎 TAB TRÁI ÁC QUỶ ] --
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", "rbxassetid://4483345998")
TabFruit:AddButton({
  Name = "🎲 Random Trái Ác Quỷ",
  Callback = function()
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
  end
})

-- [ ⚙️ HỆ THỐNG LOGIC ] --
spawn(function()
    while task.wait() do
        if _G.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController:attack()
            end)
        end
        if _G.GodMode then
            game.Players.LocalPlayer.Character.Humanoid.Health = 100000
        end
    end
end)

RedzLib:Notification({
  Title = LộcVip_Brand,
  Content = "Đã phá khóa thành công! Chúc bạn chơi vui vẻ.",
  Time = 5
})
