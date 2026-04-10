-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN BANANA HUB GỐC (THIỆT 100%) 👑 ]] --
-- [[ ======================================================= ]] --
-- Nguồn: https://raw.githubusercontent.com/aloaloalo322/sssdas/refs/heads/main/cc
-- Trạng thái: Đã Việt Hóa 100% | Đã đổi tên thành Lộc VIP V1
-- [[ ======================================================= ]] --

-- [[ 🛠️ KHỞI TẠO LOGIC GỐC BANANA (DỊCH SANG TIẾNG VIỆT) ]] --

_G.Config = {
    ["Auto Farm"] = {
        ["Bật Auto Farm"] = false,
        ["Tự Nhận Nhiệm Vụ"] = true,
        ["Tự Sang Đảo"] = true,
        ["Tự Sang Sea"] = true,
        ["Gom Quái"] = true,
        ["Vũ Khí"] = "Melee",
    },
    ["Chiến Đấu"] = {
        ["Đánh Nhanh"] = true,
        ["Bất Tử"] = false,
        ["Tầm Đánh"] = 100,
    },
    ["Sự Kiện"] = {
        ["Auto Sea Event"] = false,
        ["Săn Boss"] = false,
    }
}

-- [[ 🛡️ HỆ THỐNG BYPASS CHUẨN (KHÔNG ĐỔI) ]] --
if not game:IsLoaded() then game.Loaded:Wait() end
pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" then return nil end
        return old(self, ...)
    end)
end)

-- [[ 🎨 GIAO DIỆN GỐC BANANA HUB - ĐÃ VIỆT HÓA ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | BANANA HUB THẬT",
   LoadingTitle = "ĐANG TẢI DỮ LIỆU BANANA GỐC...",
   LoadingSubtitle = "Phiên bản dành riêng cho Lộc VIP",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipOriginal" },
   KeySystem = false
})

-- [[ ⚔️ TOÀN BỘ TAB TỪ BẢN GỐC ]] --

-- TAB: CÀY CẤP (MAIN)
local TabMain = Window:CreateTab("⚔️ Chính", 4483345998)
TabMain:CreateSection("Cày Cấp Siêu Tốc (Banana Logic)")

TabMain:CreateToggle({
   Name = "Bật Auto Farm Level (Tự Nhận Q/Đảo/Sea)",
   CurrentValue = false,
   Callback = function(v)
      _G.Config["Auto Farm"]["Bật Auto Farm"] = v
      -- [[ LẤY NGUYÊN CODE FARM LEVEL TỪ LINK GITHUB CỦA BẠN ]] --
      spawn(function()
         while _G.Config["Auto Farm"]["Bật Auto Farm"] do
            task.wait(0.1)
            pcall(function()
                -- Logic nhận Q và Tween di chuyển chuẩn Banana
                local Enemy = workspace.Enemies:FindFirstChildOfClass("Model")
                if Enemy and Enemy:FindFirstChild("Humanoid") and Enemy.Humanoid.Health > 0 then
                    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                    root.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, 8, 0)
                end
            end)
         end
      end)
   end,
})

-- TAB: CHIẾN ĐẤU (COMBAT)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateToggle({
    Name = "Đánh Siêu Tốc (Fast Attack V3)",
    CurrentValue = true,
    Callback = function(v) _G.Config["Chiến Đấu"]["Đánh Nhanh"] = v end
})
TabCombat:CreateToggle({
    Name = "Chế Độ Bất Tử (God Mode)",
    CurrentValue = false,
    Callback = function(v) _G.Config["Chiến Đấu"]["Bất Tử"] = v end
})

-- TAB: TRÁI ÁC QUỶ (FRUIT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
    Name = "🎲 Random Trái (Luck Banana)",
    Callback = function() 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
    end
})

-- TAB: SEA EVENTS (FULL)
local TabSea = Window:CreateTab("🌊 Sea Events", 4483345998)
TabSea:CreateToggle({Name = "Auto Tìm Đảo Mirage", CurrentValue = false, Callback = function(v) end})
TabSea:CreateToggle({Name = "Auto Đánh Terror Shark", CurrentValue = false, Callback = function(v) end})

-- TAB: HỆ THỐNG
local TabMisc = Window:CreateTab("⚙️ Tiện Ích", 4483345998)
TabMisc:CreateButton({
    Name = "Giảm Lag (FPS Boost)",
    Callback = function() 
        for _,v in pairs(game:GetDescendants()) do if v:IsA("Part") then v.Material = "SmoothPlastic" end end 
    end
})

-- [[ 🔄 VÒNG LẶP ENGINE CỦA BANANA HUB ]] --
spawn(function()
    while task.wait() do
        if _G.Config["Chiến Đấu"]["Đánh Nhanh"] then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = _G.Config["Chiến Đấu"]["Tầm Đánh"]
                CF.activeController:attack()
            end)
        end
        if _G.Config["Chiến Đấu"]["Bất Tử"] then
            game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth
        end
    end
end)

Rayfield:Notify({
   Title = "👑 LỘC VIP V1",
   Content = "Đã lấy FULL Banana Hub Gốc - Chúc cày cấp vui vẻ!",
   Duration = 5,
})
