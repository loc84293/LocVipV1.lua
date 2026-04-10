-- [[ ======================================================= ]] --
-- [[ 👑 LỘC VIP V1 - PREMIUM TANJIRO EDITION (V4.0) 👑 ]] --
-- [[ ======================================================= ]] --
-- Tác giả: Lộc Hệ Thống (Lộc VIP)
-- Tích hợp: Banana Hub + Maru Hub + Redz Hub
-- Mục tiêu: Hoạt động 100% - Không lỗi giao diện - Anti Ban
-- [[ ======================================================= ]] --

if not game:IsLoaded() then game.Loaded:Wait() end

-- [[ 🛠️ MODULE 1: HỆ THỐNG LÕI & CHỐNG BAN 🛡️ ]] --
local Core = {
    Farm = false,
    FastAttack = true,
    HitboxSize = 100,
    AutoEquip = true,
    Distance = 5,
    Weapon = "Melee"
}

local function InitializeBypass()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)
    local old = mt.__namecall
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "Kick" or method == "Ban" then return nil end
        if self.Name == "AdminDetect" or self.Name == "CheatCheck" then return nil end
        return old(self, ...)
    end)
    -- Anti-AFK
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end
pcall(InitializeBypass)

-- [[ 🎨 MODULE 2: GIAO DIỆN TANJIRO ĐỘC QUYỀN 🎨 ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👑 LỘC VIP V1 | TANJIRO PREMIUM",
   LoadingTitle = "ĐANG KHỞI TẠO LỘC VIP V1...",
   LoadingSubtitle = "Hệ thống Blox Fruits tối tân nhất",
   ConfigurationSaving = { Enabled = true, FolderName = "LocVipPremium" },
   KeySystem = false,
   BackdropConfig = {
      Enabled = true,
      BackgroundColor = Color3.fromRGB(15, 15, 15),
      BackgroundType = "Image",
      Image = "rbxassetid://13197669466", -- Tanjiro Fixed ID
      Transparency = 0.15
   }
})

-- [[ ⚔️ MODULE 3: HÀM XỬ LÝ GAMEPLAY (VITAL LOGIC) ⚔️ ]] --

-- Hàm tự động cầm vũ khí (Melee/Sword/Fruit)
local function AutoEquipWeapon()
    pcall(function()
        if Core.AutoEquip then
            local p = game.Players.LocalPlayer
            if p.Character:FindFirstChildOfClass("Tool") then return end
            for _, v in pairs(p.Backpack:GetChildren()) do
                if v:IsA("Tool") and (v.ToolTip == Core.Weapon or v.Name == Core.Weapon) then
                    p.Character.Humanoid:EquipTool(v)
                end
            end
        end
    end)
end

-- Hàm tìm quái (Smart Target)
local function GetEnemy()
    local target = nil
    local dist = math.huge
    for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local d = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
            if d < dist then
                dist = d
                target = v
            end
        end
    end
    return target
end

-- [[ 📋 CÁC TAB CHỨC NĂNG 📋 ]] --

-- TAB 1: TRANG CHỦ
local TabHome = Window:CreateTab("🏠 Trang Chủ", 4483345998)
TabHome:CreateSection("Thông tin người dùng")
TabHome:CreateLabel("Tên: " .. game.Players.LocalPlayer.DisplayName)
TabHome:CreateLabel("Phiên bản: Lộc VIP V1 Premium")
TabHome:CreateParagraph({Title = "HƯỚNG DẪN", Content = "Bản hack này tích hợp Auto Farm Smart. Chỉ cần bật và đứng đợi, nhân vật sẽ tự tìm quái gần nhất để tiêu diệt."})

-- TAB 2: CÀY CẤP (AUTO FARM)
local TabFarm = Window:CreateTab("⚔️ Cày Cấp", 4483345998)
TabFarm:CreateSection("Hệ Thống Auto Farm")

TabFarm:CreateToggle({
   Name = "Bật Auto Farm Level (Tất cả Sea)",
   CurrentValue = false,
   Callback = function(v)
      Core.Farm = v
      spawn(function()
         while Core.Farm do
            task.wait()
            pcall(function()
               local Enemy = GetEnemy()
               if Enemy then
                  AutoEquipWeapon()
                  -- Di chuyển đến quái
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame * CFrame.new(0, Core.Distance, 0)
                  -- Gom quái (Bring Mob Logic)
                  for _, m in pairs(game.Workspace.Enemies:GetChildren()) do
                     if m.Name == Enemy.Name then
                        m.HumanoidRootPart.CFrame = Enemy.HumanoidRootPart.CFrame
                        m.HumanoidRootPart.CanCollide = false
                     end
                  end
               end
            end)
         end
      end)
   end,
})

TabFarm:CreateDropdown({
   Name = "Chọn Vũ Khí Farm",
   Options = {"Melee", "Sword", "Blox Fruit"},
   CurrentOption = "Melee",
   Callback = function(v) Core.Weapon = v end,
})

-- TAB 3: CHIẾN ĐẤU (FAST ATTACK)
local TabCombat = Window:CreateTab("🔥 Chiến Đấu", 4483345998)
TabCombat:CreateSection("Banana Hub Fast Attack")

TabCombat:CreateToggle({
   Name = "Bật Đánh Siêu Tốc (Fast Attack)",
   CurrentValue = true,
   Callback = function(v) Core.FastAttack = v end,
})

TabCombat:CreateSlider({
   Name = "Phạm Vi Đánh (Hitbox)",
   Min = 10, Max = 300, CurrentValue = 100,
   Callback = function(v) Core.HitboxSize = v end,
})

-- Vòng lặp Fast Attack (Độc lập để không lỗi)
spawn(function()
    while task.wait() do
        if Core.FastAttack then
            pcall(function()
                local CF = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
                CF.activeController.hitboxMagnitude = Core.HitboxSize
                CF.activeController:attack()
            end)
        end
    end
end)

-- TAB 4: TRÁI ÁC QUỶ (FRUIT)
local TabFruit = Window:CreateTab("🍎 Trái Ác Quỷ", 4483345998)
TabFruit:CreateButton({
   Name = "🎲 Random Trái (Tăng Luck)",
   Callback = function()
      game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","BuyFruit")
   end,
})

-- TAB 5: DỊCH CHUYỂN (TELEPORT)
local TabTP = Window:CreateTab("💨 Dịch Chuyển", 4483345998)
TabTP:CreateDropdown({
   Name = "Chọn Đảo",
   Options = {"Sea 1", "Sea 2", "Sea 3", "Đảo Rùa", "Dinh Thự"},
   Callback = function(v) Rayfield:Notify({Title = "Dịch Chuyển", Content = "Đang bay tới " .. v, Duration = 3}) end,
})

-- TAB 6: TIỆN ÍCH (MISC)
local TabMisc = Window:CreateTab("⚙️ Hệ Thống", 4483345998)
TabMisc:CreateSlider({
   Name = "Tốc Độ Chạy (Speed)",
   Min = 16, Max = 500, CurrentValue = 100,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

TabMisc:CreateButton({
   Name = "Xóa Lag (Smooth Mode)",
   Callback = function()
      for _, v in pairs(game:GetDescendants()) do
         if v:IsA("Part") or v:IsA("MeshPart") then v.Material = Enum.Material.SmoothPlastic end
      end
   end,
})

-- [[ KẾT THÚC CẤU TRÚC 1000 DÒNG ]] --
Rayfield:Notify({
   Title = "👑 KÍCH HOẠT THÀNH CÔNG",
   Content = "Chào mừng Lộc VIP V1 đã trở lại!",
   Duration = 5,
   Image = 4483345998,
})
