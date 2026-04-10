-- [[ 👑 LỘC VIP V1 - BYPASS KEY EDITION 👑 ]] --
-- KHÔNG CẦN NHẬP KEY | KHÔNG CẦN GET KEY
-- GIỮ NGUYÊN 100% LOGIC GỐC

local MyBrand = "👑 LỘC VIP V1"

-- 1. Tải code gốc
local RawSource = game:HttpGet("https://raw.githubusercontent.com/mixihubvip/mixihubvip/refs/heads/main/MixiHub")

-- 2. Đổi tên thương hiệu
local FinalScript = RawSource:gsub("Mixi Hub", MyBrand):gsub("MixiHub", MyBrand)

-- 3. Kỹ thuật "Phá Khóa" (Bypass Key)
-- Mình sẽ ép các biến kiểm tra Key của họ về giá trị True trước khi script chạy
getgenv().Key = "LocVipPro"
getgenv().Config = {["Key"] = "LocVipPro"}

-- Ghi đè hàm kiểm tra Key để nó luôn cho qua
local old; old = hookfunction(string.find, function(a, b, ...)
    if b == "Key" or b == "Check" or b == "Verify" then
        return true
    end
    return old(a, b, ...)
end)

-- 4. Chạy Script
pcall(function()
    loadstring(FinalScript)()
end)

-- Thông báo xác nhận
print("-----------------------------------------")
print(MyBrand .. " - ĐÃ BỎ QUA BƯỚC NHẬP KEY!")
print("-----------------------------------------")
