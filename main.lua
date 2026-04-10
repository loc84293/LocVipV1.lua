-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHẶN ĐỨNG TÊN CŨ 👑 ]] --
-- CƠ CHẾ: CANH CỔNG (DESCENDANT ADDED) | XÓA INFO | AVATAR XÁM

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. Hàm xử lý thần tốc: Vừa ló mặt ra là đổi luôn
local function CleanUI(obj)
    pcall(function()
        -- Đổi tên và màu chữ ngay khi vừa xuất hiện
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text:find("tuananhios") then
                obj.Text = MyBrand
                obj.TextColor3 = Green
            end
            -- Xóa mục Thông Tin để tránh khoảng trống đen
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                task.defer(function() 
                    if obj.Parent then obj.Parent:Destroy() end 
                end)
            end
        end

        -- Biến Avatar thành ô màu xám sạch sẽ
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            obj.Image = ""
            obj.BackgroundColor3 = Gray
            obj.ImageTransparency = 1
        end

        -- Nhuộm xanh lá các nút bấm màu xanh dương
        if obj:IsA("Frame") and obj.BackgroundColor3 == Color3.fromRGB(0, 102, 255) then
            obj.BackgroundColor3 = Green
        end
        if obj:IsA("UIStroke") then
            obj.Color = Green
        end
    end)
end

-- 2. Ngồi canh sẵn ở cửa: Cứ có cái gì mới hiện ra trong CoreGui là xử lý ngay
game:GetService("CoreGui").DescendantAdded:Connect(CleanUI)

-- 3. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 4. Quét lại một lần nữa cho chắc chắn
task.spawn(function()
    for i = 1, 100 do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            CleanUI(v)
        end
        task.wait(0.1)
    end
end)

-- Thông báo chào mừng Lộc
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Đã nạp Lộc VIP V1 - Sạch bóng dấu vết cũ!",
    Duration = 5
})
