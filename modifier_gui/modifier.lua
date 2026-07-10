local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "遊戲修改器",
   LoadingTitle = "正在載入...",
   LoadingSubtitle = "by Kai090898",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RayfieldConfig",
      FileName = "Config"
   },
   KeySystem = false
})

-- 創建分類
local ModifierTab = Window:CreateTab("更改器", 0)

-- 預設數值
local PlayerValues = {
   JumpPower = 50,
   WalkSpeed = 16,
   Gravity = 196.2
}

-- 跳躍力輸入框
ModifierTab:CreateInput({
   Name = "跳躍力",
   PlaceholderText = "輸入跳躍力數值",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local jumpValue = tonumber(Text)
      if jumpValue then
         PlayerValues.JumpPower = jumpValue
         local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
         if humanoid then
            humanoid.JumpPower = jumpValue
         end
         Rayfield:Notify({
            Title = "跳躍力已更改",
            Content = "跳躍力已設置為: " .. jumpValue,
            Duration = 2,
            Image = 4483362458
         })
      else
         Rayfield:Notify({
            Title = "錯誤",
            Content = "請輸入有效的數字",
            Duration = 2,
            Image = 4483362458
         })
      end
   end
})

-- 速度輸入框
ModifierTab:CreateInput({
   Name = "速度",
   PlaceholderText = "輸入移動速度數值",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local speedValue = tonumber(Text)
      if speedValue then
         PlayerValues.WalkSpeed = speedValue
         local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
         if humanoid then
            humanoid.WalkSpeed = speedValue
         end
         Rayfield:Notify({
            Title = "速度已更改",
            Content = "移動速度已設置為: " .. speedValue,
            Duration = 2,
            Image = 4483362458
         })
      else
         Rayfield:Notify({
            Title = "錯誤",
            Content = "請輸入有效的數字",
            Duration = 2,
            Image = 4483362458
         })
      end
   end
})

-- 重力輸入框
ModifierTab:CreateInput({
   Name = "重力",
   PlaceholderText = "輸入重力數值",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local gravityValue = tonumber(Text)
      if gravityValue then
         PlayerValues.Gravity = gravityValue
         workspace.Gravity = gravityValue
         Rayfield:Notify({
            Title = "重力已更改",
            Content = "重力已設置為: " .. gravityValue,
            Duration = 2,
            Image = 4483362458
         })
      else
         Rayfield:Notify({
            Title = "錯誤",
            Content = "請輸入有效的數字",
            Duration = 2,
            Image = 4483362458
         })
      end
   end
})

-- 重置按鈕
ModifierTab:CreateButton({
   Name = "重置所有數值",
   Callback = function()
      PlayerValues.JumpPower = 50
      PlayerValues.WalkSpeed = 16
      PlayerValues.Gravity = 196.2
      
      local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
      if humanoid then
         humanoid.JumpPower = 50
         humanoid.WalkSpeed = 16
      end
      workspace.Gravity = 196.2
      
      Rayfield:Notify({
         Title = "已重置",
         Content = "所有數值已恢復為預設值",
         Duration = 2,
         Image = 4483362458
      })
   end
})

Rayfield:LoadConfiguration()
