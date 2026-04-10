-- [[ 👑 LỘC VIP V1 PRO 👑 ]] --
-- Giữ nguyên 100% bản gốc từ link GitHub của bạn
-- Chỉ thay đổi tên hiển thị để trở thành thương hiệu của Lộc

local LocVipName = "👑 LỘC VIP V1 PRO"

-- Load bản gốc nhưng can thiệp vào phần hiển thị
local RawCode = game:HttpGet("https://raw.githubusercontent.com/aloaloalo322/sssdas/refs/heads/main/cc")

-- Thay thế tất cả các tên cũ thành tên của Lộc trước khi chạy
local FinalCode = RawCode:gsub("Banana Hub", LocVipName):gsub("BananaHub", LocVipName)

-- Thực thi bản gốc đã đổi tên
loadstring(FinalCode)()

-- Thông báo cho Lộc
print(LocVipName .. " đã kích hoạt thành công!")
