-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN SẠCH BÓNG TÊN CŨ 👑 ]] --
-- CHỈ GIỮ 1 TÊN CHÍNH | XÓA HẾT TÊN CŨ | GIỮ DELTA GỐC

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. CHẶN TRƯỚC (HOOK): Không cho bất kỳ chữ "Tuấn Anh" nào được tạo ra
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            -- Nếu là dòng tiêu đề trên cùng thì đổi thành Lộc VIP V1
            -- Nếu là dòng nhỏ lẻ khác thì cho biến mất (xóa trắng)
            if self.Name:lower():find("title") or self.Name:lower():find("header") or self.Parent.Name:lower():find("header") then
                Value = MyName
            else
                Value = "" 
            end
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. HÀM DỌN DẸP THẦN TỐC
local function SilentClean(obj)
    pcall(function()
        -- Tuyệt đối không đụng vào Delta để giữ nguyên icon Delta cho Lộc
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xóa mục Thông Tin ngay lập tức để không bị hiện lúc mới load
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
            
            -- Chỗ nào còn sót tên cũ thì "bôi xóa" sạch sẽ
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" 
                end
            end
        end

        -- Biến Avatar thành ô xám sạch sẽ (không đổi icon Delta)
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

-- 4. QUÉT LIÊN TỤC ĐỂ ĐẢM BẢO KHÔNG HIỆN TÊN CŨ
game:GetService("CoreGui").DescendantAdded:Connect(SilentClean)

task.spawn(function()
    while task.wait() do -- Quét cực nhanh để xóa tên cũ ngay khi nó vừa ló ra
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            SilentClean(v)
            -- Tự động nhảy sang tab Farming để menu luôn khít và đẹp
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, connection in pairs(getconnections(v.Activated)) do
                    connection:Fire()
                end
            end
        end
    end
end)
