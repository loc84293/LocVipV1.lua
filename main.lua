-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHỐNG VĂNG (FIXED) 👑 ]] --
-- Đã tối ưu cho Delta VNG - Không bị lỗi mã hóa

local LộcVip_Brand = "👑 LỘC VIP V1"

-- [ 🛡️ XÓA MENU LỖI CŨ ] --
pcall(function()
    for _, v in pairs(game.CoreGui:GetChildren()) do
        if v:IsA("ScreenGui") and (v.Name == "Rayfield" or v.Name:find("Hub")) then
            v:Destroy()
        end
    end
end)

-- [ 🚀 KHỞI CHẠY BẢN SIÊU MƯỢT ] --
-- Bản này đảm bảo không đụng độ với hệ thống Luarmor hay Rubu cũ
local Success, Error = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/luacoder-byte/luacoder/refs/heads/main/RedzHub.lua"))()
end)

-- [ 📢 NẾU CHẠY THÀNH CÔNG THÌ THÔNG BÁO ] --
if Success then
    warn(LộcVip_Brand .. " ĐÃ SẴN SÀNG!")
else
    -- Nếu vẫn lỗi, dùng bản dự phòng nhẹ nhất
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RealHuyBui/HuyBuiHub/main/HuyBuiHubV3.lua"))()
end

-- Lệnh này để hiện tên bạn lên thông báo góc màn hình
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = LộcVip_Brand,
    Text = "Cày Level và Săn Sea thôi Lộc ơi!",
    Duration = 10
})
