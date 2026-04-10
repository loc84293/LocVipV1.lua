-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN HOÀN THIỆN 👑 ]] --
local MyName = "👑 LỘC VIP V1"

-- 1. KHÓA TÊN (Chặn script gốc tự đổi lại tên cũ)
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            Value = MyName -- Luôn ép thành tên của Lộc
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. XOÁ INFO VÀ TỰ VÀO FARMING
local function FinalFix(obj)
    if obj:IsA("TextLabel") or obj:IsA("TextButton") then
        -- Nếu thấy chữ Thông Tin hoặc các link mạng xã hội thì xóa hẳn
        if obj.Text:find("Thông Tin") or obj.Text:find("Info") or obj.Text:find("facebook") or obj.Text:find("youtube") then
            if obj.Parent and obj.Parent:IsA("Frame") then
                obj.Parent:Destroy() -- Xóa sổ mục đó
            end
        end
        -- Đổi tên tiêu đề chính
        if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
            obj.Text = MyName
        end
        -- Tự nhấn vào mục Farming cho Lộc
        if obj.Text:find("Farming") then
            for _, con in pairs(getconnections(obj.Activated)) do con:Fire() end
        end
    end
end

-- 3. CHẠY HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- Quét và dọn dẹp liên tục mỗi giây
task.spawn(function()
    while task.wait(0.5) do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            FinalFix(v)
        end
    end
end)
