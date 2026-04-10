-- [[ 👑 LỘC VIP V1 👑 ]] --
local MyBrand = "👑 LỘC VIP V1"

-- Lấy mã nguồn gốc từ link bạn cung cấp
local RawSource = game:HttpGet("https://raw.githubusercontent.com/mixihubvip/mixihubvip/refs/heads/main/MixiHub")

-- Xử lý thay tên: Xóa sạch mọi dấu vết của tên cũ và thay bằng Lộc VIP V1
local FinalScript = RawSource:gsub("Mixi Hub", MyBrand):gsub("MixiHub", MyBrand):gsub("MIXI HUB", MyBrand)

-- Thực thi bản gốc dưới tên của Lộc
loadstring(FinalScript)()

-- Thông báo xác nhận hệ thống
warn(MyBrand .. " ĐÃ KÍCH HOẠT THÀNH CÔNG!")
