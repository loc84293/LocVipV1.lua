-- [[ 👑 LỘC VIP V1 👑 ]] --
-- CHẾ ĐỘ: XÓA SẠCH AVATAR | MÀU XANH LÁ | KHÔNG IOS

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0) -- Màu xanh lá thuần

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Thông báo lời chào
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Duration = 5
})

-- 3. Bộ lọc "Siêu Cấp" - Xóa Avatar và Đổi Màu
task.spawn(function()
    while task.wait(0.3) do -- Quét nhanh hơn để không kịp hiện avatar cũ
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [XÓA TRIỆT ĐỂ AVATAR/IMAGE]
                -- Xóa tất cả các hình ảnh đại diện, logo của tác giả cũ
                if v:IsA("ImageLabel") then
                    v:Destroy() -- Xóa hẳn luôn thay vì chỉ ẩn
                end

                -- [ĐỔI TÊN & MÀU CHỮ]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") or v.Text:find("AnhTuấn") then
                        v.Text = MyBrand
                    end
                    -- Ép tất cả chữ quan trọng sang màu Xanh Lá
                    v.TextColor3 = Green
                end

                -- [ĐỔI MÀU GIAO DIỆN XANH LÁ]
                if v:IsA("Frame") then
                    -- Tìm các thanh tiêu đề hoặc viền để nhuộm xanh
                    if v.Name:lower():find("top") or v.Name:lower():find("bar") or v.Name:lower():find("header") then
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

print("--- LỘC VIP V1 ĐÃ DỌN DẸP XONG GIAO DIỆN ---")
