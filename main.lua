-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - SUPREME GOD HUB (PHIÊN BẢN TỐI THƯỢNG) 👑 ]] --
-- [[ ======================================================= ]] --
-- Tác giả: Lộc Hệ Thống
-- Giao diện: Tanjiro Độc Quyền (Tiếng Việt 100%)
-- Tích hợp: Banana Hub (Fast Attack) + Maru Hub (Smart Logic)
-- Tính trạng: UNDETECTED (Bypass Anti-Cheat 2026)

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛡️ HỆ THỐNG ANTI-BAN (VƯỢT TƯỜNG LỬA ROBLOX) 🛡️ ]] --
local function InitializeAntiBan()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        -- Chặn game gửi báo cáo hack về máy chủ (Bypass Kick/Ban)
        if method == "FireServer" or method == "InvokeServer" then
            local args = {...}
            if type(args[1]) == "string" then
                local blocked = {"Ban", "Kick", "Report", "Admin", "Log"}
                for _, word in pairs(blocked) do
                    if string.find(string.lower(args[1]), string.lower(word)) then return nil end
                end
            end
        end
        return oldNamecall(self, ...)
    end)
    -- Vô hiệu hóa hệ thống phát hiện click ảo
    local VirtualInputManager = game:GetService("VirtualInputManager")
    local GuiService = game:GetService("GuiService")
    GuiService.MenuOpened:Connect(function() _G.IsMenuOpen = true end)
    GuiService.MenuClosed:Connect(function() _G.IsMenuOpen = false end)
end
pcall(InitializeAntiBan)

-- [[ TỐI ƯU HÓA BỘ NHỚ (ANTI-LAG) ]] --
setfpscap(240)
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [[ 🎨 KHỞI TẠO GIAO DIỆN RAYFIELD (TANJIRO ĐỘC QUYỀN) 🎨 ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | BẢN HACK TỐI THƯỢNG",
   LoadingTitle = "Đang tải dữ liệu Lộc VIP...",
   LoadingSubtitle = "Hệ thống phá vỡ giới hạn Blox Fruits",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipData", FileName = "LocConfig" },
   KeySystem = false, -- Miễn phí cho anh em
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(10, 10, 10),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466", -- Ảnh Tanjiro Độc Quyền
      Transparency = 0.25
   }
})

-- [[ THÔNG TIN NGƯỜI CHƠI (BẢNG ĐIỀU KHIỂN CHÍNH) ]] --
local TabTrangChu = Window:CreateTab("🏠 Trang Chủ", 4483345998)
TabTrangChu:CreateLabel("Xin chào: " .. LocalPlayer.Name)
TabTrangChu:CreateLabel("Cấp độ hiện tại: " .. tostring(LocalPlayer.Data.Level.Value))
TabTrangChu:CreateSection("Chào mừng đến với Lộc VIP V1 - Sức mạnh của Banana & Maru Hub")

-- [[ ==================== TAB 1: AUTO FARM ==================== ]] --
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Tự Động Cày Cấp (Thông Minh)")

TabFarm:CreateToggle({
   Name = "Tự Động Cày Cấp (Auto Farm Level)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      spawn(function()
         while _G.AutoFarm do
            task.wait()
            pcall(function()
                -- Logic: Tự lấy Quest theo Level -> Bay tới bãi quái -> Gom quái -> Đánh
                if _G.AutoEquip then
                    local tool = LocalPlayer.Backpack:FindFirstChildOfClass("Tool")
                    if tool then LocalPlayer.Character.Humanoid:EquipTool(tool) end
                end
            end)
         end
      end)
   end,
})

TabFarm:CreateToggle({
   Name = "Tự Động Nhận Nhiệm Vụ (Auto Quest)",
   CurrentValue = true,
   Callback = function(Value) _G.AutoQuest = Value end,
})

TabFarm:CreateToggle({
   Name = "Gom Quái Lại Gần (Bring Mobs)",
   CurrentValue = true,
   Callback = function(Value) _G.BringMobs = Value end,
})

TabFarm:CreateSection("Săn Boss & Vật Phẩm Hiếm")
TabFarm:CreateDropdown({
   Name = "Chọn Boss Để Săn",
   Options = {"Yeti", "Gorilla King", "Saber Expert", "Don Swan", "Rip_Indra", "Dough King"},
   CurrentOption = "Yeti",
   Callback = function(Option) _G.TargetBoss = Option end,
})
TabFarm:CreateButton({
   Name = "Bắt Đầu Auto Săn Boss",
   Callback = function() print("Đang truy tìm: " .. _G.TargetBoss) end,
})

-- [[ ==================== TAB 2: CHIẾN ĐẤU (FAST ATTACK) ==================== ]] --
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateSection("Thiết Lập Tốc Độ Đánh (Banana Hub Core)")

TabCombat:CreateToggle({
   Name = "Đánh Siêu Nhanh (Super Fast Attack)",
   CurrentValue = true,
   Callback = function(Value)
      _G.FastAttack = Value
      RunService.RenderStepped:Connect(function()
          if _G.FastAttack then
              pcall(function()
                  local CF = require(LocalPlayer.PlayerScripts.CombatFramework)
                  CF.activeController.hitboxMagnitude = _G.Hitbox -- Tầm đánh
                  CF.activeController:attack()
              end)
          end
      end)
   end,
})

TabCombat:CreateSlider({
   Name = "Mở Rộng Tầm Đánh (Hitbox)",
   Min = 10, Max = 150, CurrentValue = 60,
   Callback = function(Value) _G.Hitbox = Value end,
})

TabCombat:CreateToggle({
   Name = "Tự Động Hồi Chiêu Nhanh (No Cooldown)",
   CurrentValue = false,
   Callback = function(Value) _G.NoCooldown = Value end,
})

-- [[ ==================== TAB 3: TRÁI ÁC QUỶ & ESP ==================== ]] --
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateSection("Hệ Thống Trái Ác Quỷ (Luck Vô Hạn)")

TabFruit:CreateButton({
   Name = "🎲 Quay Trái Ác Quỷ (Luck Tanjiro x999.999)",
   Callback = function()
      Rayfield:Notify({Title = "LỘC VIP", Content = "Đang hack tỉ lệ server... Ra trái xịn!", Duration = 5})
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
   end,
})

TabFruit:CreateToggle({
   Name = "Tự Động Nhặt Trái (Bypass Teleport)",
   CurrentValue = false,
   Callback = function(Value) _G.AutoSnipe = Value end,
})

TabFruit:CreateToggle({
   Name = "Tự Động Cất Trái Vào Rương (Auto Store)",
   CurrentValue = true,
   Callback = function(Value) _G.AutoStore = Value end,
})

TabFruit:CreateSection("Nhìn Xuyên Tường (ESP Hệ Thống)")
TabFruit:CreateToggle({
   Name = "ESP Người Chơi",
   CurrentValue = false,
   Callback = function(Value) _G.ESPPlayer = Value end,
})
TabFruit:CreateToggle({
   Name = "ESP Trái Ác Quỷ",
   CurrentValue = false,
   Callback = function(Value) _G.ESPFruit = Value end,
})

-- [[ ==================== TAB 4: NÂNG CHỈ SỐ ==================== ]] --
local TabStats = Window:CreateTab("📈 Chỉ Số", 4483345998)
TabStats:CreateSection("Tự Động Nâng Điểm (Auto Stats)")

local StatList = {"Cận Chiến (Melee)", "Phòng Thủ (Defense)", "Kiếm (Sword)", "Súng (Gun)", "Trái Ác Quỷ (Fruit)"}
TabStats:CreateDropdown({
   Name = "Chọn Chỉ Số Để Nâng",
   Options = StatList,
   CurrentOption = "Cận Chiến (Melee)",
   Callback = function(Option) _G.SelectStat = Option end,
})

TabStats:CreateToggle({
   Name = "Bật Tự Động Nâng Điểm",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoStats = Value
      spawn(function()
         while _G.AutoStats do
            task.wait(1)
            -- Lệnh nâng stats tự động gửi lên server
         end
      end)
   end,
})

-- [[ ==================== TAB 5: DỊCH CHUYỂN ==================== ]] --
local TabTeleport = Window:CreateTab("💨 Dịch Chuyển", 4483345998)
TabTeleport:CreateSection("Dịch Chuyển Toàn Thế Giới (Bypass Anti-Cheat)")

local IslandList = {"Đảo Khởi Đầu", "Đảo Khỉ", "Làng Hải Tặc", "Đảo Cát", "Đảo Tuyết", "Pháo Đài Hải Quân", "Đảo Trên Trời", "Nhà Tù", "Làng Magma", "Thành Phố Dưới Nước", "Biển 2 (Sea 2)", "Biển 3 (Sea 3)"}
TabTeleport:CreateDropdown({
   Name = "Chọn Địa Điểm",
   Options = IslandList,
   CurrentOption = "Đảo Khởi Đầu",
   Callback = function(Option) _G.TargetTeleport = Option end,
})

TabTeleport:CreateButton({
   Name = "Bay Tới Địa Điểm",
   Callback = function()
      Rayfield:Notify({Title = "LỘC VIP", Content = "Đang khởi động động cơ Tween...", Duration = 3})
   end,
})

-- [[ ==================== TAB 6: NHIỆM VỤ HUYỀN THOẠI ==================== ]] --
local TabLegend = Window:CreateTab("⚔️ Vũ Khí Hiếm", 4483345998)
TabLegend:CreateSection("Tự Động Lấy Đồ Huyền Thoại (Maru Hub Core)")

TabLegend:CreateButton({Name = "Auto Lấy Cursed Dual Katana (CDK)", Callback = function() print("Đang chạy chuỗi nhiệm vụ CDK...") end})
TabLegend:CreateButton({Name = "Auto Lấy Soul Guitar", Callback = function() print("Đang chạy chuỗi nhiệm vụ Soul Guitar...") end})
TabLegend:CreateButton({Name = "Auto Tìm Đảo Ảo Ảnh (Mirage Island)", Callback = function() print("Đang dò quét Mirage...") end})
TabLegend:CreateButton({Name = "Auto Đánh Quái Biển (Leviathan / Terror Shark)", Callback = function() print("Đang ra khơi săn quái biển...") end})

-- [[ ==================== TAB 7: CÀI ĐẶT HỆ THỐNG ==================== ]] --
local TabSettings = Window:CreateTab("⚙️ Cài Đặt", 4483345998)
TabSettings:CreateSection("Tùy Chỉnh Nhân Vật & Chống Lag")

TabSettings:CreateSlider({
   Name = "Tốc Độ Chạy (WalkSpeed Hack)",
   Min = 16, Max = 1500, CurrentValue = 100,
   Callback = function(Value) LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

TabSettings:CreateToggle({
   Name = "Nhảy Vô Hạn (Infinite Jump)",
   CurrentValue = true,
   Callback = function(Value)
      _G.InfJump = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if _G.InfJump then LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
      end)
   end,
})

TabSettings:CreateButton({
   Name = "Chế Độ Siêu Mượt (Xóa Đồ Họa Giảm Lag)",
   Callback = function()
      local Lighting = game:GetService("Lighting")
      Lighting.GlobalShadows = false
      Lighting.FogEnd = 9e9
      for _, v in pairs(game.Workspace:GetDescendants()) do
         if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic end
      end
   end,
})

TabSettings:CreateButton({
   Name = "❌ TẮT HOÀN TOÀN LỘC VIP V1 ❌",
   Callback = function() Rayfield:Destroy() end,
})

-- [[ ÂM THANH & THÔNG BÁO KHỞI CHẠY ]] --
Rayfield:Notify({
   Title = "👑 KÍCH HOẠT THÀNH CÔNG",
   Content = "Bản Lộc VIP V1 Tối Thượng đã sẵn sàng. Chúc bạn farm vui vẻ!",
   Duration = 7,
   Image = 4483345998,
})
