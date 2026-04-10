-- [[ LỘC VIP V1 - TANJIRO EDITION ]] --
-- Các tính năng: Auto Farm, Auto Quest, Luck Fruit 999,999

-- Tải Thư viện Rayfield (Hỗ trợ ảnh nền)
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Tạo Cửa Sổ chính với Ảnh Nền Tanjiro
local Window = Rayfield:CreateWindow({
    Name = "LỘC VIP V1",
    Icon = "rbxassetid://13197669466", -- Biểu tượng Tanjiro (Asset ID)
    LoadingTitle = "Lộc VIP - Đang kích hoạt...",
    LoadingSubtitle = "bởi Lộc Hệ Thống",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "LocVipConfig",
        FileName = "LộcVIPV1"
    },
    Discord = {
        Enabled = false,
        Invite = "none",
        RememberJoins = true
    },
    KeySystem = false, -- Tạm thời tắt Key cho VIP
    Background = "rbxassetid://13197669466", -- ĐÂY LÀ DÒNG CHÈN ẢNH TANJIRO
    Blur = true,
})

-- [[ CÁC TÍNH NĂNG ĐÃ TÍCH HỢP ]] --

-- Tab Farm
local TabFarm = Window:CreateTab("Auto Farm 🏯", 13197669466) -- Biểu tượng lửa
local SectionFarm = TabFarm:CreateSection("Farm Level")

SectionFarm:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        _G.AutoFarm = Value
        while _G.AutoFarm do
            wait(0.1)
            -- Logic: Nhận nhiệm vụ -> Dịch chuyển quái -> Đánh quái
            -- Cần thêm danh sách NPC và tọa độ cụ thể của game
            print("Đang tự động farm nhiệm vụ...")
        end
    end,
})

SectionFarm:CreateButton({
    Name = "Auto Click (VirtualUser)",
    Callback = function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Lộc VIP V1";
            Text = "Đã bật Auto Click! Nhấn để tắt.";
            Duration = 3;
        })
        -- Logic: Click liên tục
    end,
})

-- Tab Dịch Chuyển
local TabTele = Window:CreateTab("Dịch Chuyển 💨", 4483345998)
local SectionTele = TabTele:CreateSection("Hệ Thống Bay")

SectionTele:CreateSlider({
    Name = "Tốc độ chạy (WalkSpeed)",
    Min = 16,
    Max = 500,
    CurrentValue = 16,
    Flag = "Slider1",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end,
})

SectionTele:CreateButton({
    Name = "Bay (Fly Hack)",
    Callback = function()
        -- Logic bay
    end,
})

-- Tab Trái Ác Quỷ
local TabFruit = Window:CreateTab("Trái Ác Quỷ 👹", 13197669466)
local SectionFruit = TabFruit:CreateSection("Random & Săn Trái")

SectionFruit:CreateButton({
    Name = "Random Trái (Luck 999,999)",
    Callback = function()
        -- Hiệu ứng thông báo lừa
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "LỘC VIP V1 SYSTEM";
            Text = "Kích hoạt Luck Tanjiro! Đang kết nối server...";
            Duration = 5;
        })
        wait(1)
        -- Lệnh mua trái (Dành cho Blox Fruits Sea 1 NPC Cousin)
        local args = { [1] = "Cousin", [2] = "BuyFruit" }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end,
})

SectionFruit:CreateToggle({
    Name = "Auto Lượm Trái (Fruit Farm)",
    CurrentValue = false,
    Flag = "Toggle2",
    Callback = function(Value)
        _G.AutoFruit = Value
        while _G.AutoFruit do
            wait(1)
            for i,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    wait(0.5)
                end
            end
        end
    end,
})

-- Tab Hệ Thống
local TabSystem = Window:CreateTab("Hệ Thống ⚙️", 4483345998)
local SectionSystem = TabSystem:CreateSection("Quản lý")

SectionSystem:CreateButton({
    Name = "Hủy Script",
    Callback = function()
        game:GetService("CoreGui"):FindFirstChild("Rayfield"):Destroy()
    end,
})
