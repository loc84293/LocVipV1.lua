-- [[ 👑 LỘC VIP V1 👑 ]] --
-- MÀU XANH LÁ | KHÔNG IOS | XÓA AVATAR

local MyBrand = "👑 LỘC VIP V1"
local GreenColor = Color3.fromRGB(0, 255, 127) -- Màu xanh lá cực đẹp

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Lời chào cảm ơn khi vừa mở
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Icon = "rbxassetid://15115201314",
    Duration = 8
})

-- 3. Hệ thống xử lý giao diện (Màu sắc, Tên, Avatar)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- ĐỔI TÊN (BỎ CHỮ IOS)
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") or v.Text:find("AnhTuấn") then
                        v.Text = MyBrand
                        v.TextColor3 = GreenColor -- Đổi màu chữ sang xanh lá
                    end
                end

                -- XÓA AVATAR / LOGO
                if v:IsA("ImageLabel") then
                    if v.Name:lower():find("logo") or v.Name:lower():find("avatar") or v.Image:find("rbxassetid") then
                        v.Visible = false
                    end
                end

                -- ĐỔI MÀU GIAO DIỆN SANG XANH LÁ
                if v:IsA("Frame") and (v.BackgroundColor3 ~= Color3.fromRGB(255, 255, 255)) then
                    if v.Name:lower():find("top") or v.Name:lower():find("header") or v.Name:lower():find("title") then
                        v.BackgroundColor3 = GreenColor
                    end
                end
                
                -- Đổi màu các đường viền (Stroke)
                if v:IsA("UIStroke") then
                    v.Color = GreenColor
                end
            end
        end)
    end
end)

warn("-----------------------------------------")
warn("CAM ON BAN DA SU DUNG LOC VIP V1!")
warn("-----------------------------------------")
