-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN CHẶN ĐỨNG TÊN CŨ 100% 👑 ]] --
-- FIX: HIỆN LÀ LỘC VIP | KHÔNG HIỆN Tên Tuấn Anh | GIỮ DELTA

local MyName = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. CHẶN THÔNG BÁO GỐC (KHÔNG CHO HIỆN TUẤN ANH IOS LÚC MỚI VÀO)
local OldNotify
OldNotify = hookfunction(game.StarterGui.SetCore, function(self, Name, Data)
    if Name == "SendNotification" and Data and Data.Title then
        if Data.Title:find("Tuấn Anh") or Data.Title:find("iOS") then
            Data.Title = MyName
            Data.Text = "Chào mừng bạn đã quay trở lại!"
        end
    end
    return OldNotify(self, Name, Data)
end)

-- 2. KHÓA TÊN TRONG HỆ THỐNG
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            Value = MyName
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 3. HÀM DỌN DẸP GIAO DIỆN (GIỮ NGUYÊN DELTA)
local function UltraClean(obj)
    pcall(function()
        -- Không đụng vào Delta của Lộc
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        -- Thay tên ở mọi ngóc ngách
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text == "" then
                obj.Text = MyName
                obj.TextColor3 = Green
            end
            -- Xóa Info để lấp khoảng trống
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
        end

        -- Avatar xám sạch sẽ
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 4. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 5. QUÉT LIÊN TỤC ĐỂ ĐÈ TÊN
game:GetService("CoreGui").DescendantAdded:Connect(UltraClean)
task.spawn(function()
    while task.wait() do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            UltraClean(v)
        end
    end
end)
