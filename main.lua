-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN KHÓA TÊN VĨNH VIỄN 👑 ]] --
-- CHỈNH SỬA: KHÓA TÊN LỘC VIP V1 | AVATAR XÁM | GIỮ GỐC DELTA

local MyName = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. CHẶN VÀ KHÓA TÊN (SỬ DỤNG METAMETHOD CAO CẤP)
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS") or Value:find("tuananhios")) then
            Value = MyName -- Ép giá trị luôn là Lộc VIP V1
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. HÀM XỬ LÝ GIAO DIỆN SIÊU TỐC
local function FinalClean(obj)
    pcall(function()
        -- KHÔNG ĐỤNG VÀO DELTA (GIỮ NGUYÊN GỐC DELTA NHƯ LỘC MUỐN)
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        -- ÉP TÊN HIỆN THỊ
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text:find("tuananhios") or obj.Text == "" then
                obj.Text = MyName
                obj.TextColor3 = Green
            end
            
            -- XÓA MỤC THÔNG TIN (INFO) ĐỂ LẤP KHOẢNG TRỐNG
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
        end

        -- AVATAR BIẾN THÀNH MÀU XÁM (KHÔNG ĐỔI ICON DELTA)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = "" 
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
                obj.Visible = true
            end
        end

        -- ĐỔI MÀU NỀN SANG XANH LÁ
        if obj:IsA("Frame") and obj.BackgroundColor3 == Color3.fromRGB(0, 102, 255) then
            obj.BackgroundColor3 = Green
        end
    end)
end

-- 3. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 4. VÒNG LẶP CANH GÁC (PHÒNG TRƯỜNG HỢP NÓ ĐỔI LẠI)
game:GetService("CoreGui").DescendantAdded:Connect(FinalClean)

task.spawn(function()
    while task.wait(0.1) do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            FinalClean(v)
            -- Tự động nhấn Farming để thoát tab Info
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, connection in pairs(getconnections(v.Activated)) do
                    connection:Fire()
                end
            end
        end
    end
end)
