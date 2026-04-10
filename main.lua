-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHỐNG MẤT HACK 👑 ]] --
-- ĐÃ FIX: TÀNG HÌNH AVATAR | ĐỔI TÊN LIỀN | MÀU XANH LÁ

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống xử lý Giao diện (Quét siêu nhanh)
task.spawn(function()
    while task.wait() do -- Quét liên tục để đè tên ngay lập tức
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [XÓA AVATAR BẰNG CÁCH CHO TÀNG HÌNH]
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v.ImageTransparency = 1 -- Làm ảnh trong suốt hoàn toàn
                    v.BackgroundTransparency = 1 -- Xóa luôn nền của ảnh
                end

                -- [ĐỔI TÊN THÀNH LỘC VIP V1]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") or v.Text:find("tuananhios") then
                        v.Text = MyBrand
                        v.TextColor3 = Green -- Chữ màu xanh lá cho ngầu
                    end
                    
                    -- [ẨN MỤC THÔNG TIN | INFO]
                    if v.Text:find("Thông Tin") or v.Text:find("Info") then
                        v.Parent.Visible = false -- Ẩn đi để menu gọn hơn
                    end
                end

                -- [ĐỔI MÀU GIAO DIỆN XANH LÁ]
                if v:IsA("Frame") and v.BackgroundColor3 == Color3.fromRGB(0, 102, 255) then 
                    v.BackgroundColor3 = Green
                end
                if v:IsA("UIStroke") then
                    v.Color = Green
                end
            end
        end)
    end
end)

-- Lời chào cảm ơn Lộc
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Duration = 5
})
