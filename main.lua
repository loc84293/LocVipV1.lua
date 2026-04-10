-- [[ 👑 LỘC VIP V1 - BẢN TỐI GIẢN 👑 ]] --
-- CHỈ ĐỔI TÊN ĐẦU | XÓA TÊN CŨ CHỖ KHÁC | GIỮ NGUYÊN DELTA

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. HÀM XỬ LÝ "TẨY XÓA" THÔNG MINH
local function MinimalClean(obj)
    pcall(function()
        -- Không đụng vào Delta của Lộc
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- KIỂM TRA NẾU LÀ TÊN Ở ĐẦU MENU (Tiêu đề chính)
            -- Thường là cái Label to nhất hoặc nằm ở Header
            if obj.Parent.Name:lower():find("header") or obj.Parent.Name:lower():find("title") then
                if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                    obj.Text = MyName
                end
            else
                -- CÁC CHỖ KHÁC: Nếu thấy tên cũ thì bôi trắng (xóa chữ)
                if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") then
                    obj.Text = "" 
                end
            end
            
            -- XÓA MỤC THÔNG TIN (INFO) ĐỂ KHÔNG HIỆN LÚC ĐẦU
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                if obj.Parent then
                    obj.Parent.Visible = false
                    task.defer(function() obj.Parent:Destroy() end)
                end
            end
        end

        -- AVATAR BIẾN THÀNH MÀU XÁM (Đúng ý Lộc)
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 2. CHẠY BẢN HACK GỐC
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 3. QUÉT VÀ DỌN DẸP
game:GetService("CoreGui").DescendantAdded:Connect(MinimalClean)

task.spawn(function()
    while task.wait(0.5) do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            MinimalClean(v)
            -- Tự động nhảy sang tab Farming để Menu nhìn sạch ngay từ đầu
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, connection in pairs(getconnections(v.Activated)) do
                    connection:Fire()
                end
            end
        end
    end
end)
