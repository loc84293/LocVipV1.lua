-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN MIN HUB SIÊU CẤP 👑 ]] --
-- Giữ nguyên 100% sức mạnh của MinXT2
-- Đổi tên thương hiệu thành Lộc VIP V1

local MyBrand = "👑 LỘC VIP V1"

-- [ 🛠️ FIX LỖI GIAO DIỆN ] --
if not game:IsLoaded() then game.Loaded:Wait() end

-- [ 🚀 KỸ THUẬT ĐỔI TÊN MÀ KHÔNG HỎNG CODE ] --
-- Chúng ta sẽ thay thế tên hiển thị ngay khi script load vào bộ nhớ
local RawCode = game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinXt2Eng")
local FinalCode = RawCode:gsub("Min Hub", MyBrand):gsub("MinHub", MyBrand):gsub("MinXT2", MyBrand)

-- [ 🔥 THỰC THI SCRIPT ] --
loadstring(FinalCode)()

-- [ 📢 THÔNG BÁO XÁC NHẬN ] --
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Đã kích hoạt Min Hub phiên bản Lộc VIP!",
    Duration = 5
})

warn("-----------------------------------------")
warn(MyBrand .. " LOADED SUCCESSFULLY!")
warn("-----------------------------------------")
