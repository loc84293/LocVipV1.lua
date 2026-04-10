--- [[ 👑 LỘC VIP V1 👑 ]] --
-- XÓA AVATAR + ÉP ĐỔI TÊN TRIỆT ĐỂ

local MyBrand = "👑 LỘC VIP V1"

-- 1. Chạy bản gốc
loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()

-- 2. Hệ thống xử lý Giao diện (Xóa Avatar & Đổi tên)
task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            -- Quét toàn bộ CoreGui để xử lý
            for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                
                -- [ CHIẾN THUẬT 1: XÓA AVATAR/LOGO ]
                -- Tìm các hình ảnh liên quan đến Logo hoặc Avatar cũ để xóa/ẩn
                if v:IsA("ImageLabel") then
                    if v.Image:find("rbxassetid") or v.Name:lower():find("logo") or v.Name:lower():find("avatar") then
                        v.Visible = false -- Ẩn đi cho sạch
                    end
                end

                -- [ CHIẾN THUẬT 2: ĐỔI TÊN ]
                if v:IsA("TextLabel") or v:IsA("TextButton") then
                    if v.Text:find("Tuấn Anh") or v.Text:find("AnhTuấn") or v.Text:find("Tuan Anh") then
                        v.Text = v.Text:gsub("Tuấn Anh iOS", MyBrand)
                                       :gsub("AnhTuấnDzai Hub", MyBrand)
                                       :gsub("Tuấn Anh", MyBrand)
                                       :gsub("AnhTuấn", MyBrand)
                    end
                end
            end
        end)
    end
end)

warn(MyBrand .. " ĐÃ XÓA LOGO VÀ ĐỔI TÊN THÀNH CÔNG!")
