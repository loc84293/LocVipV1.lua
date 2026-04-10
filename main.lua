-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN PHONG TỎA TUYỆT ĐỐI 👑 ]] --
-- CƠ CHẾ: PHỦ ĐEN 5 GIÂY | DIỆT TẬN GỐC TÊN CŨ | VÀO THẲNG FARM

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. TẠO MÀN HÌNH PHONG TỎA (PHỦ KÍN 5 GIÂY)
local Screen = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(1, 0, 1, 0) -- Phủ toàn màn hình
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Màu đen huyền bí
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local LoadingText = Instance.new("TextLabel", Main)
LoadingText.Text = MyName .. " ĐANG LOADING..."
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.TextColor3 = Color3.fromRGB(0, 255, 0) -- Màu xanh lá cực ngầu
LoadingText.TextSize = 35
LoadingText.Font = Enum.Font.GothamBold
LoadingText.BackgroundTransparency = 1

-- 2. HÀM QUÉT DỌN "TÀNG HÌNH"
local function InvisibleClean(obj)
    pcall(function()
        if obj.Name:find("Delta") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xóa sạch mọi dấu vết tên cũ và link mạng xã hội
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text:find("Facebook") or obj.Text:find("tuananh") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" -- Tẩy trắng hoàn toàn
                end
            end
            
            -- Xóa sổ mục Thông Tin / Info ngay lập tức
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                if obj.Parent then
                    obj.Parent.Visible = false
                    task.defer(function() obj.Parent:Destroy() end)
                end
            end
        end

        -- Avatar xám (giữ Delta)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHẠY HACK VÀ DỌN DẸP TRONG 5 GIÂY "BÓNG TỐI"
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    local Start = tick()
    while tick() - Start < 5 do -- Đợi đúng 5 giây như Lộc yêu cầu
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            InvisibleClean(v)
            -- Ép menu nhảy sang tab Farming sẵn
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, con in pairs(getconnections(v.Activated)) do con:Fire() end
            end
        end
        task.wait()
    end
    
    -- Sau 5 giây, xóa màn hình che để hiện Menu sạch sẽ của Lộc
    Screen:Destroy()
end)

game:GetService("CoreGui").DescendantAdded:Connect(InvisibleClean)
