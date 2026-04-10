-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN SIÊU MƯỢT 👑 ]] --
-- Tác giả: Lộc VIP

local MyBrand = "👑 LỘC VIP V1"

-- [ 🛡️ KHỞI TẠO HỆ THỐNG ] --
if not game:IsLoaded() then game.Loaded:Wait() end

-- [ 🚀 CHẠY SCRIPT CHÍNH ] --
-- Mình sẽ tải bản Rubu V5 về và ép nó đổi tên thành Lộc VIP V1 ngay lập tức
pcall(function()
    local RawCode = game:HttpGet("https://raw.githubusercontent.com/Bubu2k/Rubutv/refs/heads/main/rubuhubv5.lua")
    
    -- Thay thế toàn bộ tên cũ sang tên của Lộc
    local LocVipCode = RawCode:gsub("Rubu TV", MyBrand):gsub("RubuHub", MyBrand):gsub("Rubu", MyBrand)
    
    -- Thực thi bản đã đổi tên
    loadstring(LocVipCode)()
end)

-- [ 📢 THÔNG BÁO ] --
warn(MyBrand .. " ĐÃ KÍCH HOẠT! NẾU KHÔNG HIỆN MENU, HÃY KIỂM TRA LẠI EXECUTOR.")
