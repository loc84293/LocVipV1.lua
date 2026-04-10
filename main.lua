-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN HIỆN LÀ CÓ TÊN 👑 ]] --
-- ĐÃ FIX: HIỆN TÊN NGAY | XÓA INFO | THAY AVATAR | MÀU XANH LÁ

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Tanjiro_Img = "rbxassetid://17343261541"

-- 1. CHẠY BẢN GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. HỆ THỐNG "CƯỠNG ÉP" HIỆN TÊN LỘC VIP V1 NGAY LẬP TỨC
task.spawn(function()
    while task.wait() do -- Quét cực nhanh để không kịp hiện tên cũ
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- ĐỔI TÊN TIÊU ĐỀ (HIỆN LIỀN)
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    -- Xóa sạch mọi dấu vết Tuấn Anh, iOS, real_tuananhios
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") or v.Text:find("tuananhios") then
                        v.Text = MyBrand
                        v.TextColor3 = Green
                    end
                end

                -- XÓA MỤC THÔNG TIN | INFO (TRẢM TẬN GỐC)
                if v.Name:lower():find("info") or v.Text:find("Thông Tin") or v.Text:find("Info") then
                    if v:IsA("TextButton") or v:IsA("TextLabel") then
                        v.Parent.Visible = false
                        v:Destroy()
                    end
                end

                -- THAY AVATAR TANJIRO
                if v:IsA("ImageLabel") then
                    v.Image = Tanjiro_Img
                    v.Visible = true -- Đảm bảo ảnh Tanjiro hiện lên
                end

                -- NHUỘM XANH LÁ (THAY CHO XANH DƯƠNG)
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

-- 3. THÔNG BÁO LỜI CHÀO UY TÍN
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Duration = 5
})
