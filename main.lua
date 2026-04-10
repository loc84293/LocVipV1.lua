-- [[ 👑 LỘC VIP V1 👑 ]] --
-- PHIÊN BẢN ÉP ĐỔI TÊN GIAO DIỆN (FORCE RENAME)

local MyBrand = "👑 LỘC VIP V1"

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Kỹ thuật "Truy quét và Đổi tên" (Loop Rename)
-- Code này sẽ chạy ngầm để tìm bất cứ chữ nào là "Tuấn Anh" và đổi thành tên của bạn
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            -- Quét trong hệ thống giao diện của Roblox
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("AnhTuấn") or v.Text:find("Tuan Anh") then
                        v.Text = v.Text:gsub("Tuấn Anh iOS", MyBrand)
                                       :gsub("AnhTuấnDzai Hub", MyBrand)
                                       :gsub("Tuấn Anh", MyBrand)
                                       :gsub("AnhTuấn", MyBrand)
                    end
                end
            end
            -- Đổi luôn tiêu đề Window nếu nó dùng thư viện UI phổ biến
            if game.CoreGui:FindFirstChild("ScreenGui") then
                for _, x in pairs(game.CoreGui.ScreenGui:GetDescendants()) do
                    if x.Name == "Title" or x.Name == "NameHub" then
                        x.Text = MyBrand
                    end
                end
            end
        end)
    end
end)

print(MyBrand .. " ĐÃ GHI ĐÈ GIAO DIỆN THÀNH CÔNG!")
