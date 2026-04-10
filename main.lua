-- [[ 👑 LỘC VIP V1 - SUPREME BYPASS (NO KEY) 👑 ]] --
-- ĐÃ LOẠI BỎ HOÀN TOÀN BẢNG NHẬP KEY

local MyBrand = "👑 LỘC VIP V1"

-- 1. Tải mã nguồn gốc
local RawSource = game:HttpGet("https://raw.githubusercontent.com/mixihubvip/mixihubvip/refs/heads/main/MixiHub")

-- 2. Đổi tên thương hiệu ngay lập tức
local FinalScript = RawSource:gsub("Mixi Hub", MyBrand):gsub("MixiHub", MyBrand)

-- 3. Kỹ thuật "Cắt bỏ" đoạn Check Key
-- Mình sẽ ép các hàm kiểm tra luôn trả về kết quả đã nhập đúng Key
if getgenv then
    getgenv().KeyInput = "LocVipV1"
    getgenv().CheckKey = function() return true end
    getgenv().Verified = true
end

-- Chặn các thông báo bắt lấy Key (Notification)
local oldNotify
oldNotify = hookmetamethod(game, "__index", function(self, key)
    if key == "Notify" or key == "Notification" then
        return function() return nil end
    end
    return oldNotify(self, key)
end)

-- 4. Thực thi bản gốc đã "phẫu thuật"
task.spawn(function()
    pcall(function()
        loadstring(FinalScript)()
    end)
end)

-- 5. Lệnh cưỡng ép: Tự động xóa các bảng UI có tên "Key" hoặc "Verify" trong 3 giây đầu
task.wait(2)
pcall(function()
    for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
        if v:IsA("ScreenGui") and (v.Name:find("Key") or v.Name:find("Verify")) then
            v:Destroy()
        end
    end
end)

warn(MyBrand .. " ĐÃ PHÁ KHÓA THÀNH CÔNG!")
