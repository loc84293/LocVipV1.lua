-- [[ 👑 LỘC VIP V1 👑 ]] --

local LocVip_Brand = "👑 LỘC VIP V1"

-- [ 🚀 TẢI VÀ XỬ LÝ MÃ NGUỒN ] --
local Success, RawCode = pcall(function()
    return game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua")
end)

if Success then
    -- Thay thế tất cả các biến thể của tên cũ sang Lộc VIP V1
    local FinalCode = RawCode:gsub("AnhTuấnDzai Hub", LocVip_Brand)
                             :gsub("Tuấn Anh iOS", LocVip_Brand)
                             :gsub("AnhTuanDzai", LocVip_Brand)
                             :gsub("TuanAnhHub", LocVip_Brand)
    
    -- Thực thi script đã đổi tên
    loadstring(FinalCode)()
else
    -- Nếu link lỗi, chạy bản dự phòng gốc
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS-Main.Lua"))()
end

-- [ 📢 THÔNG BÁO ] --
print("-----------------------------------------")
print(LocVip_Brand .. " ĐÃ KÍCH HOẠT THÀNH CÔNG!")
print("-----------------------------------------")
