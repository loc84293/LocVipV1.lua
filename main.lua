-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CỨU NGUY KHẨN CẤP 👑 ]] --
-- KHÓA CHẾT Tên Cũ | XÓA SỔ Info | VÀO THẲNG Farm

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. KHÓA CỨNG BỘ NHỚ: Không cho phép chữ "Tuấn Anh" tồn tại
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS") or Value:find("tuananh")) then
            if self.Name:lower():find("title") or self.Parent.Name:lower():find("header") then
                Value = MyName
            else
                Value = "" -- Xóa trắng tuyệt đối
            end
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. TRUY QUÉT VÀ TIÊU DIỆT INFO
local function EmergencyClean(obj)
    pcall(function()
        if obj.Name:find("Delta") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xóa sổ tab Thông Tin và toàn bộ nội dung bên trong
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") or obj.Text:find("Facebook") or obj.Text:find("Copy") then
                obj.Visible = false
                if obj.Parent and obj.Parent:IsA("Frame") then
                    obj.Parent.Visible = false
                    task.defer(function() obj.Parent:Destroy() end)
                end
            end
            
            -- Sửa tên tiêu đề chính
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                obj.Text = (obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header")) and MyName or ""
            end
        end

        -- Biến ảnh đại diện cũ thành màu xám (giữ icon Delta)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHẠY HACK VÀ ÉP CHUYỂN TAB TRONG 1 GIÂY
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    local Start = tick()
    while tick() - Start < 3 do -- Quét cực nhanh trong 3 giây đầu
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            EmergencyClean(v)
            -- Ép nhảy sang Farming ngay lập tức
            if v:IsA("TextButton") and (v.Text:find("Farming") or v.Text:find("Farm")) then
                for _, con in pairs(getconnections(v.Activated)) do con:Fire() end
            end
        end
        task.wait()
    end
end)

game:GetService("CoreGui").DescendantAdded:Connect(EmergencyClean)
