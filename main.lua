-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN KHẲNG ĐỊNH ĐẲNG CẤP 👑 ]] --
-- CƠ CHẾ: LOADING GỌN GÀNG | XÓA INFO | GIỮ DELTA GỐC

local MyName = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. TẠO BẢNG LOADING GỌN (CHỈ HIỆN TÊN)
local Screen = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(0, 280, 0, 100) -- Thu nhỏ lại cho gọn
Main.Position = UDim2.new(0.5, -140, 0.5, -50)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
Instance.new("UIStroke", Main).Color = Green

local Title = Instance.new("TextLabel", Main)
Title.Text = MyName -- Đã bỏ chữ "Xin chào" theo ý Lộc
Title.Size = UDim2.new(1, 0, 1, 0)
Title.TextColor3 = Green
Title.TextSize = 28
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- 2. PHỤC KÍCH BỘ NHỚ ĐỂ THAY TÊN (HOOK)
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            if self.Name:lower():find("title") or self.Parent.Name:lower():find("header") then
                Value = MyName
            else
                Value = "" -- Bôi trắng các phần nhỏ lẻ
            end
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 3. HÀM DỌN DẸP SẠCH SẼ
local function FinalClean(obj)
    pcall(function()
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xóa sổ mục Thông Tin/Info
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                if obj.Parent then obj.Parent.Visible = false task.defer(function() obj.Parent:Destroy() end) end
            end
            -- Ép tên Lộc VIP V1 vào tiêu đề
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" 
                end
            end
        end
        -- Avatar xám (giữ nguyên Delta)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 4. CHẠY VÀ XỬ LÝ TRONG BÓNG TỐI
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    local startTime = tick()
    while tick() - startTime < 2.5 do -- Loading trong 2.5 giây cho nhanh
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            FinalClean(v)
            -- Ẩn menu gốc trong lúc đang dọn dẹp
            if v:IsA("Frame") and v.Parent and v.Parent:IsA("ScreenGui") and v.Parent.Name:find("TuanAnh") then
                v.Visible = false
            end
            -- Tự động nhấn Farming
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, con in pairs(getconnections(v.Activated)) do con:Fire() end
            end
        end
        task.wait(0.05)
    end
    
    Screen:Destroy() -- Xóa bảng loading
    -- Hiện Menu đã sạch bóng tên cũ
    for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
        if v:IsA("Frame") and v.Parent and v.Parent:IsA("ScreenGui") and v.Parent.Name:find("TuanAnh") then
            v.Visible = true
        end
    end
end)

game:GetService("CoreGui").DescendantAdded:Connect(FinalClean)
