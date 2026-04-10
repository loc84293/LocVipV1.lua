-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN HOÀN THIỆN 👑 ]] --
-- LẤP KHOẢNG TRỐNG | HIỆN TANJIRO | ĐỔI TÊN TRIỆT ĐỂ

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Tanjiro_Img = "http://www.roblox.com/asset/?id=17343261541" -- ID Tanjiro chuẩn

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống xử lý Giao diện thông minh
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [XỬ LÝ AVATAR: ÉP HIỆN HÌNH TANJIRO]
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v.Image = Tanjiro_Img
                    v.ImageTransparency = 0 -- Hiện rõ hình
                    v.Visible = true
                end

                -- [XỬ LÝ TÊN & LẤP KHOẢNG TRỐNG]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    -- Đổi toàn bộ tên cũ sang Lộc VIP V1
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") or v.Text:find("tuananhios") then
                        v.Text = MyBrand
                        v.TextColor3 = Green
                    end
                    
                    -- Tìm mục "Thông Tin" hoặc "Info" để xóa hẳn khung chứa, 
                    -- giúp các mục dưới (Farming, Fishing...) tự động đôn lên trên.
                    if v.Text:find("Thông Tin") or v.Text:find("Info") then
                        if v.Parent and v.Parent:IsA("GuiObject") then
                            v.Parent:Destroy() -- Xóa hẳn khung để lấp khoảng trống
                        end
                    end
                end

                -- [ĐỔI MÀU XANH LÁ TOÀN DIỆN]
                if v:IsA("Frame") and (v.BackgroundColor3 == Color3.fromRGB(0, 102, 255) or v.Name:lower():find("header")) then 
                    v.BackgroundColor3 = Green
                end
                if v:IsA("UIStroke") then
                    v.Color = Green
                end
            end
        end)
    end
end)

-- Lời chào uy tín
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Chào Lộc! Bản VIP V1 đã sẵn sàng chiến!",
    Duration = 5
})
