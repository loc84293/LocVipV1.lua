-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN DIỆT TẬN GỐC 👑 ]] --
-- CHỈ HIỆN LỘC VIP | XÓA INFO | XÓA LOADING CŨ | GIỮ DELTA

local MyName = "👑 LỘC VIP V1"
local Gray = Color3.fromRGB(45, 45, 45)

-- 1. TẠO LOADING RIÊNG SIÊU NHỎ GỌN (CHE TÊN CŨ)
local Screen = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", Screen)
Main.Size = UDim2.new(1, 0, 1, 0) -- Phủ toàn màn hình để che sạch Loading cũ
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BackgroundTransparency = 0.1 -- Hơi trong suốt cho đẹp
Main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Title = Instance.new("TextLabel", Main)
Title.Text = MyName
Title.Size = UDim2.new(1, 0, 1, 0)
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextSize = 40
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- 2. HÀM QUÉT DỌN "THẦN TỐC"
local function WipeOld(obj)
    pcall(function()
        -- Không đụng vào Delta của Lộc
        if obj.Name:find("Delta") or obj.Name:find("Executor") then return end

        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            -- Xóa mục Thông Tin / Info / Loading cũ
            if obj.Text:find("Tuấn Anh") or obj.Text:find("iOS") or obj.Text:find("tuananhios") or obj.Text:find("Loading") then
                if obj.Name:lower():find("title") or obj.Parent.Name:lower():find("header") then
                    obj.Text = MyName
                else
                    obj.Text = "" -- Bôi trắng sạch sẽ các chỗ khác
                end
            end
            
            -- Xóa sổ cái bảng Thông Tin vĩnh viễn
            if obj.Text:find("Thông Tin") or obj.Text:find("Info") then
                obj.Parent.Visible = false
                task.defer(function() obj.Parent:Destroy() end)
            end
        end

        -- Avatar xám
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if not obj.Name:lower():find("delta") then
                obj.Image = ""
                obj.BackgroundColor3 = Gray
                obj.ImageTransparency = 1
            end
        end
    end)
end

-- 3. CHẠY HACK TRONG BÓNG TỐI
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
    
    -- Quét liên tục từng mili giây để xóa dấu vết
    local Start = tick()
    while tick() - Start < 3.5 do
        for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
            WipeOld(v)
            -- Ép sang Farming ngay để không hiện Info
            if v:IsA("TextButton") and v.Text:find("Farming") then
                for _, con in pairs(getconnections(v.Activated)) do con:Fire() end
            end
        end
        task.wait()
    end
    
    -- Xong xuôi thì xóa màn hình che và vào chơi
    Screen:Destroy()
end)

game:GetService("CoreGui").DescendantAdded:Connect(WipeOld)
