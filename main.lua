-- [[ 👑 LỘC VIP V1 PRO MAX 👑 ]] --
local MyName = "👑 LỘC VIP V1 PRO MAX"

-- Lấy code gốc từ link Trẩu V9 của bạn
local RawBuffalo = game:HttpGet("https://raw.githubusercontent.com/trungdao2k4/buffalo/refs/heads/main/traurobloxv9.lua")

-- Thay đổi tên hiển thị trong toàn bộ mã nguồn
local LocVipCode = RawBuffalo:gsub("Trẩu V9", MyName):gsub("TRẨU V9", MyName):gsub("Buffalo Hub", MyName)

-- Thực thi bản Trẩu V9 dưới tên Lộc VIP
loadstring(LocVipCode)()

-- Thông báo nhỏ dưới Console
print("-----------------------------------------")
print(MyName .. " ĐÃ KÍCH HOẠT THÀNH CÔNG!")
print("-----------------------------------------")
