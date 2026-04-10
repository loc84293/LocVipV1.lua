-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN KHÔNG KEY 👑 ]] --
-- Đã loại bỏ hệ thống Get Key | Giữ nguyên 100% tính năng gốc

local MyBrand = "👑 LỘC VIP V1"

-- 1. Lấy mã nguồn gốc
local RawSource = game:HttpGet("https://raw.githubusercontent.com/mixihubvip/mixihubvip/refs/heads/main/MixiHub")

-- 2. Thay đổi tên thương hiệu
local FinalScript = RawSource:gsub("Mixi Hub", MyBrand):gsub("MixiHub", MyBrand):gsub("MIXI HUB", MyBrand)

-- 3. Kỹ thuật Bypass Key (Bỏ qua đoạn kiểm tra Key của bản gốc)
-- Chúng ta sẽ ghi đè các hàm kiểm tra Key để nó luôn trả về kết quả "Đúng"
_G.KeyInput = "LocVipV1_NoKey" -- Tạo key giả
_G.VerifyKey = true 
_G.CheckedKey = true

-- Chặn các hàm GetKey hoặc Check Key (Nếu script có dùng hàm này)
local function BypassKey()
    if getgenv then
        getgenv().Key = "LocVipV1"
        getgenv().CheckKey = function() return true end
    end
end
pcall(BypassKey)

-- 4. Thực thi Script
loadstring(FinalScript)()

-- Thông báo cho Lộc
warn(MyBrand .. " ĐÃ KÍCH HOẠT (KHÔNG CẦN KEY)!")
