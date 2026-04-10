-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN QUÉT SẠCH DẤU VẾT 👑 ]] --
-- ĐÃ FIX: XÓA TRIỆT ĐỂ THÔNG TIN | Tên Tuấn Anh | Đổi Màu Xanh Lá

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống "Trảm" tận gốc (Sử dụng vòng lặp siêu tốc)
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [XÓA SẠCH MỤC THÔNG TIN & CÁC LINK MẠNG XÃ HỘI TRONG ẢNH]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local t = v.Text:lower()
                    if t:find("thông tin") or t:find("info") or t:find("discord") or t:find("facebook") or t:find("youtube") or t:find("tiktok") or t:find("tuananh") then
                        -- Xóa toàn bộ khung chứa cái nút/chữ đó để không còn dấu vết
                        v.Parent.Visible = false 
                        v:Destroy()
                    end
                end

                -- [XÓA AVATAR TRÊN GÓC VÀ TRONG CÁC Ô]
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v:Destroy()
                end

                -- [ÉP ĐỔI TÊN TIÊU ĐỀ CHÍNH]
                if v:IsA("TextLabel") and (v.Text:find("Tuấn Anh") or v.Text:find("iOS")) then
                    v.Text = MyBrand
                    v.TextColor3 = Green
                end

                -- [NHUỘM XANH LÁ TOÀN BỘ GIAO DIỆN]
                if v:IsA("Frame") then
                    -- Đổi các thanh màu xanh dương/đen sang xanh lá
                    if v.BackgroundColor3 == Color3.fromRGB(0, 102, 255) or v.Name:lower():find("header") then
                        v.BackgroundColor3 = Green
                    end
                end
                
                -- Nhuộm xanh các đường viền
                if v:IsA("UIStroke") then
                    v.Color = Green
                end
            end
        end)
    end
end)

-- Lời chào uy tín khi vừa mở hack
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Duration = 5
})
