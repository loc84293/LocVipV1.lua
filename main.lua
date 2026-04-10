-- [[ 👑 LỘC VIP V1 - PHIÊN BẢN GỌN GÀNG 👑 ]] --
-- ĐÃ XÓA MỤC THÔNG TIN | XÓA AVATAR | ĐỔI MÀU XANH LÁ

local MyBrand = "👑 LỘC VIP V1"
local Green = Color3.fromRGB(0, 255, 0)

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống xử lý triệt để
task.spawn(function()
    while task.wait(0.3) do
        pcall(function()
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [XÓA MỤC THÔNG TIN / INFO]
                -- Tìm các nút bấm hoặc Tab có chữ "Thông tin", "Info", "Credit" để xóa
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    local txt = v.Text:lower()
                    if txt:find("thông tin") or txt:find("info") or txt:find("credit") or txt:find("tác giả") then
                        -- Xóa cái nút đó và cả cái khung chứa nó nếu có thể
                        if v.Parent:IsA("Frame") or v.Parent:IsA("GuiObject") then
                            v.Parent.Visible = false 
                            -- Hoặc v.Parent:Destroy() nếu muốn xóa hẳn
                        end
                        v:Destroy()
                    end
                end

                -- [XÓA AVATAR]
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    v:Destroy()
                end

                -- [ĐỔI TÊN & MÀU SANG XANH LÁ]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("iOS") then
                        v.Text = MyBrand
                    end
                    v.TextColor3 = Green
                end

                -- Nhuộm xanh các thanh tiêu đề và viền
                if v:IsA("Frame") and (v.Name:lower():find("top") or v.Name:lower():find("bar")) then
                    v.BackgroundColor3 = Green
                end
                if v:IsA("UIStroke") then
                    v.Color = Green
                end
            end
        end)
    end
end)

-- Lời chào khi bắt đầu
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = MyBrand,
    Text = "Cảm ơn bạn đã sử dụng Lộc VIP V1",
    Duration = 5
})
