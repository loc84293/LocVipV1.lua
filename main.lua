-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHỐNG LỘ THÔNG TIN 👑 ]] --
-- CƠ CHẾ: VÀO THẲNG FARMING | XÓA INFO | GIỮ DELTA GỐC

local MyName = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. BẢNG LOADING GỌN (HIỆN GIỮA MÀN HÌNH 2 GIÂY CHO NGẦU)
local Screen = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 220, 0, 50)
Main.Position = UDim2.new(0.5, -110, 0.4, -25)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Color = Green
Stroke.Thickness = 2

local Title = Instance.new("TextLabel", Main)
Title.Text = MyName
Title.Size = UDim2.new(1, 0, 1, 0)
Title.TextColor3 = Green
Title.TextSize = 22
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- 2. HÀM DỌN DẸP VÀ CHUYỂN TAB CẤP TỐC
local function ForceFarming(obj)
    pcall(function()
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end
        
        -- Nếu thấy nút Farming thì BẤM NGAY LẬP TỨC
        if obj:IsA("TextButton") and (obj.Text:find("Farming") or obj.Text:find("Farm")) then
            for _, connection in pairs(getconnections(obj.Activated)) do
                connection:Fire()
            end
        end

        -- Xóa sổ cái bảng Thông Tin nếu nó cố tình hiện
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") or obj.Text:find("Facebook") then
                if obj.Parent and obj.Parent:IsA("Frame") then
                    obj.Parent.Visible = false
                    task.defer(function() obj.Parent:Destroy() end)
                end
            end

            -- Đổi tên tiêu đề thành Lộc VIP V1
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" -- Bôi trắng các chỗ khác
                end
            end
        end

        -- Avatar xám
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHẠY HACK VÀ ÉP CHUYỂN TAB
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    -- Quét cực nhanh trong 2 giây đầu để ép chuyển sang Farming
    local Start = tick()
    while tick() - Start < 2 do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            ForceFarming(v)
            -- Ẩn menu chính lúc đang load để bạn không thấy tên cũ
            if v:IsA("Frame") and v.Parent and v.Parent:IsA("ScreenGui") and v.Parent.Name:find("TuanAnh") then
                v.Visible = false
            end
        end
        task.wait() -- Quét liên tục từng mili giây
    end
    
    Screen:Destroy() -- Xóa bảng Loading Lộc VIP
    -- Hiện Menu đã được chuyển sang tab Farming
    for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v:IsA("Frame") and v.Parent and v.Parent:IsA("ScreenGui") and v.Parent.Name:find("TuanAnh") then
            v.Visible = true
        end
    end
end)

game:GetService("CoreGui").DescendantAdded:Connect(ForceFarming)
