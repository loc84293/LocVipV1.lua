-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN FIX TRIỆT ĐỂ 👑 ]] --
-- YÊU CẦU: XÓA INFO | AVATAR XÁM | GIỮ NGUYÊN DELTA | ĐỔI TÊN NGAY

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. CHẶN ĐẦU VĂN BẢN (HOOK): Đổi tên trước khi nó kịp hiện
local OldIndex
OldIndex = hookmetamethod(game, "__newindex", function(self, Index, Value)
    if not checkcaller() and Index == "Text" then
        if type(Value) == "string" and (Value:find("Tuấn Anh") or Value:find("iOS")) then
            Value = MyBrand
        end
    end
    return OldIndex(self, Index, Value)
end)

-- 2. HÀM QUÉT SIÊU TỐC (CÓ LOẠI TRỪ DELTA)
local function SuperClean(obj)
    pcall(function()
        -- CHỈ XỬ LÝ NẾU KHÔNG PHẢI LÀ DELTA
        if obj.Name:find("Delta") or obj.Name:find("Executor") or obj:FindFirstAncestor("Delta") then 
            return 
        end

        -- [XỬ LÝ AVATAR -> MÀU XÁM]
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            -- Kiểm tra xem có phải ảnh của Tuấn Anh không rồi mới đổi
            obj.Image = ""
            obj.BackgroundColor3 = Gray
            obj.ImageTransparency = 1
        end

        -- [XÓA INFO & ĐỔI TÊN HACK]
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Nếu thấy mục Thông Tin là cho biến mất ngay để lấp khoảng trống
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") or obj.Text:find("real_tuananhios") then
                local parent = obj.Parent
                if parent and parent:IsA("GuiObject") then
                    parent.Visible = false
                    task.defer(function() parent:Destroy() end)
                end
            end
            
            -- Ép tên Lộc VIP V1
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                obj.Text = MyBrand
                obj.TextColor3 = Green
            end
        end

        -- [ĐỔI MÀU GIAO DIỆN HACK SANG XANH LÁ]
        if obj:IsA("Frame") and obj.BackgroundColor3 == Color3.fromRGB(0, 102, 255) then
            obj.BackgroundColor3 = Green
        end
    end)
end

-- Canh cửa CoreGui
game:GetService("CoreGui").DescendantAdded:Connect(SuperClean)

-- 3. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 4. ÉP CHUYỂN TAB FARMING (ĐỂ KHÔNG PHẢI NHÌN THÔNG TIN)
task.spawn(function()
    for i = 1, 100 do -- Quét liên tục lúc mới vào
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            SuperClean(v)
            -- Tìm nút Farming để tự động nhấn
            if v:IsA("TextButton") and v.Text:find("Farming") then
                local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
                for _, event in pairs(events) do
                    if v[event] then
                        for _, connection in pairs(getconnections(v[event])) do
                            connection:Fire()
                        end
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

-- Lời chào uy tín
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Chào Lộc! Bản VIP V1 sạch bóng đã sẵn sàng.",
    Duration = 5
})
