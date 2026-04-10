-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHUẨN CHỨC NĂNG 👑 ]] --
-- CHỈ XÓA TÊN CŨ | GIỮ NGUYÊN NÚT HACK | AVATAR XÁM

local MyName = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. HÀM XỬ LÝ THÔNG MINH: CHỈ ĐỔI TÊN, KHÔNG XÓA CHỨC NĂNG
local function SmartClean(obj)
    pcall(function()
        -- Bỏ qua Delta để giữ nguyên gốc Delta
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- CHIẾN THUẬT: Chỉ thay thế nếu thấy tên người cũ
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text:find("tuananhios") then
                obj.Text = MyName
                obj.TextColor3 = Green
            end
            
            -- Xóa mục "Thông Tin" để các nút Farming nhảy lên (không để khoảng trống)
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
            
            -- CÁC NÚT KHÁC (Farming, Teleport,...) KHÔNG CÓ TÊN CŨ THÌ ĐỂ YÊU NGUYÊN
        end

        -- Avatar biến thành ô xám sạch sẽ
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 2. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 3. QUÉT VÀ CẬP NHẬT GIAO DIỆN
game:GetService("CoreGui").DescendantAdded:Connect(SmartClean)

task.spawn(function()
    while task.wait(0.5) do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            SmartClean(v)
            -- Tự nhảy sang Farming để Lộc thấy nút bấm ngay
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, connection in pairs(getconnections(v.Activated)) do
                    connection:Fire()
                end
            end
        end
    end
end)
