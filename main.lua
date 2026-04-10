-- [[ 👑 LỘC VIP V1 👑 ]] --
-- Đã tối ưu hóa để không bị văng game (No Crash)

local BrandName = "👑 LỘC VIP V1"

-- [ 🛡️ HỆ THỐNG FIX LỖI ] --
if not game:IsLoaded() then game.Loaded:Wait() end
pcall(function()
    if game.CoreGui:FindFirstChild("Rayfield") then
        game.CoreGui.Rayfield:Destroy() -- Xóa menu cũ nếu bị kẹt
    end
end)

-- [ 🚀 TẢI SCRIPT VỚI TÊN MỚI ] --
local Success, Error = pcall(function()
    local Raw = game:HttpGet("https://raw.githubusercontent.com/Bubu2k/Rubutv/refs/heads/main/rubuhubv5.lua")
    
    -- Thay thế tất cả tên Rubu thành Lộc VIP V1
    local FinalCode = Raw:gsub("Rubu TV", BrandName):gsub("RubuHub", BrandName):gsub("Rubu", BrandName)
    
    loadstring(FinalCode)()
end)

-- [ 📢 KIỂM TRA TRẠNG THÁI ] --
if Success then
    warn(BrandName .. " ĐÃ KÍCH HOẠT THÀNH CÔNG!")
else
    warn("LỖI KHI CHẠY SCRIPT: " .. tostring(Error))
end
