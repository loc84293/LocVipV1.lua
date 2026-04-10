-- [[ 👑 LỘC VIP V1 PRO MAX 👑 ]] --
local LocVip_Name = "👑 LỘC VIP V1 PRO MAX"

-- Lấy mã nguồn gốc của Redz Hub
local OriginalRedz = game:HttpGet("https://raw.githubusercontent.com/luacoder-byte/luacoder/refs/heads/main/RedzHub.lua")

-- Thay thế tất cả tên "Redz Hub" thành tên của bạn trong toàn bộ code
local FinalCode = OriginalRedz:gsub("Redz Hub", LocVip_Name):gsub("redz hub", LocVip_Name)

-- Chạy bản Redz Hub đã đổi tên
loadstring(FinalCode)()

-- Thông báo xác nhận
print("---------------------------------")
print(LocVip_Name .. " ĐÃ KÍCH HOẠT!")
print("---------------------------------")
