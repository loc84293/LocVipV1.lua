-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN BẢO VỆ UY TÍN 👑 ]] --
-- CƠ CHẾ: ẨN MENU KHI LOAD | XÓA INFO | CHỈ HIỆN LỘC VIP | GIỮ DELTA

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. PHỤC KÍCH BỘ NHỚ: Chặn đứng tên cũ từ trong lõi
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            if self.Name:lower():find("title") or self.Parent.Name:lower():find("header") then
                Value = MyName
            else
                Value = "" -- Bôi trắng toàn bộ chỗ khác như Lộc muốn
            end
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. HÀM DỌN DẸP SIÊU CẤP
local function ProtectLộc(obj)
    pcall(function()
        -- Tuyệt đối giữ nguyên Delta gốc cho Lộc
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xử lý Info/Thông Tin (Xóa hẳn khung để Farming nhảy lên đầu)
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                if obj.Parent then
                    obj.Parent.Visible = false
                    task.defer(function() obj.Parent:Destroy() end)
                end
            end
            
            -- Dọn dẹp tên cũ còn sót
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" 
                end
            end
        end

        -- Biến Avatar thành màu xám sạch sẽ
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHIÊU CUỐI: ẨN TOÀN BỘ CORE GUI TRONG 2 GIÂY ĐỂ DỌN DẸP
task.spawn(function()
    local CG = game:GetService("CoreGui")
    CG.Enabled = false -- Tắt sạch giao diện để không ai thấy tên cũ
    
    -- Chạy bản gốc trong lúc đang ẩn
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    -- Quét dọn liên tục trong bóng tối
    for i = 1, 100 do
        for _, v in pairs(CG:GetDescendants()) do
            ProtectLộc(v)
            -- Nhấn sẵn vào Farming
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, con in pairs(getconnections(v.Activated)) do con:Fire() end
            end
        end
        task.wait(0.02)
    end
    
    CG.Enabled = true -- Sau khi sạch rồi mới hiện lên cho Lộc khoe bạn
end)

-- Canh gác các phần tử mới
game:GetService("CoreGui").DescendantAdded:Connect(ProtectLộc)
