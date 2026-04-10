-- [[ 👑 LỘC VIP V1 - TANJIRO EDITION 👑 ]] --
-- ĐÃ FIX LỖI MẤT HACK | THAY AVATAR TANJIRO

local MyBrand = "👑 LỘC VIP V1"
local Tanjiro_Img = "rbxassetid://18320495116" -- ID ảnh Tanjiro ngầu
local Green = Color3.fromRGB(0, 255, 0)

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống xử lý thông minh (Không làm mất hack)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- ĐỔI TÊN & MÀU (BỎ CHỮ IOS)
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") then
                        v.Text = MyBrand
                        v.TextColor3 = Green
                    end
                end

                -- THAY AVATAR TUẤN ANH BẰNG TANJIRO
                if v:IsA("ImageLabel") then
                    -- Thay vì xóa (Destroy), mình chỉ thay đổi cái ảnh bên trong
                    -- giúp bản hack không bị lỗi hệ thống
                    v.Image = Tanjiro_Img
                    v.ScaleType = Enum.ScaleType.Stretch
                end

                -- XÓA MỤC THÔNG TIN (ẨN ĐI CHO CHẮC)
                if v.Name:lower():find("info") or v.Name:lower():find("credit") then
                    v.Visible = false
                end

                -- NHUỘM XANH GIAO DIỆN
                if v:IsA("Frame") and (v.Name:lower():find("top") or v.Name:lower():find("header")) then
                    v.BackgroundColor3 = Green
                end
                if v:IsA("UIStroke") then
                    v.Color = Green
                end
            end
        end)
    end
end)

-- Lời chào khi mở
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Chào Lộc! Cảm ơn bạn đã dùng Lộc VIP V1",
    Duration = 5
})
