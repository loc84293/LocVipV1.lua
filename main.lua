-- [[ 👑 LỘC VIP V1 - BẢN PHỤC KÍCH TRIỆT ĐỂ 👑 ]] --
-- MỤC TIÊU: XÓA INFO | CHỈ 1 TÊN CHÍNH | AVATAR XÁM | GIỮ DELTA

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. CHIẾN THUẬT PHỤC KÍCH: Chặn mọi dòng chữ cũ ngay khi nó vừa được tạo ra
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            -- Chỉ giữ tên Lộc ở tiêu đề chính, các chỗ khác cho biến mất (xóa trắng)
            if self.Name:lower():find("title") or self.Name:lower():find("header") or self.Parent.Name:lower():find("header") then
                Value = MyName
            else
                Value = "" 
            end
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. HÀM DỌN DẸP "SẠCH BÓNG"
local function DeepClean(obj)
    pcall(function()
        -- Bảo vệ Delta: Không đụng vào bất cứ thứ gì của Delta
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- XÓA BẢNG THÔNG TIN NGAY LẬP TỨC
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
            
            -- Quét nốt những chữ tên cũ còn sót
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" -- Bôi trắng các chỗ khác như Lộc muốn
                end
            end
        end

        -- BIẾN AVATAR HACK THÀNH MÀU XÁM (GIỮ NGUYÊN ICON DELTA)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 4. VÒNG LẶP CANH GÁC SIÊU TỐC (MỖI 0.01 GIÂY)
game:GetService("CoreGui").DescendantAdded:Connect(DeepClean)

task.spawn(function()
    while task.wait() do 
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            DeepClean(v)
            -- Tự động nhấn vào Farming để thoát khỏi tab Thông Tin nếu nó lỡ hiện
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, connection in pairs(getconnections(v.Activated)) do
                    connection:Fire()
                end
            end
        end
    end
end)
