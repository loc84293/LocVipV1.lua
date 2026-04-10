-- [[ 👑 LỘC VIP V1 - SIÊU PHẨM KẾT HỢP (RUBU V5 + LUARMOR) 👑 ]] --
-- Tác giả: Lộc VIP
-- Tính năng: Kết hợp sức mạnh của Rubu TV V5 và Luarmor Loader

local LocVipTitle = "👑 LỘC VIP V1 PRO"

-- 1. Thông báo khởi chạy thương hiệu Lộc VIP
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
Rayfield:Notify({
   Title = LocVipTitle,
   Content = "ĐANG KẾT HỢP DỮ LIỆU SIÊU CẤP...",
   Duration = 5,
})

-- 2. Chạy bản Rubu TV V5 (Đã được đổi tên thành Lộc VIP V1)
task.spawn(function()
    local RawRubu = game:HttpGet("https://raw.githubusercontent.com/Bubu2k/Rubutv/refs/heads/main/rubuhubv5.lua")
    -- Thay thế tên Rubu thành Lộc VIP V1 để đồng bộ thương hiệu
    local LocVipRubu = RawRubu:gsub("Rubu TV", LocVipTitle):gsub("RubuHub", LocVipTitle)
    loadstring(LocVipRubu)()
end)

-- 3. Chạy bản Luarmor (Bản này thường có Key, bạn hãy nhập Key của nó nếu hiện bảng nhé)
task.spawn(function()
    pcall(function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/20f318386e3fbf069ee3fa797cfc9f34.lua"))()
    end)
end)

-- 4. Tối ưu hóa hệ thống cho Lộc VIP
print("-----------------------------------------")
print(LocVipTitle .. " ĐÃ KÍCH HOẠT THÀNH CÔNG!")
print("SỰ KẾT HỢP GIỮA RUBU V5 VÀ LUARMOR")
print("-----------------------------------------")
