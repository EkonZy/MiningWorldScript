-- Mining World Automator - Loader
-- Criado por: Claude

-- Carregar os módulos
local MiningAutomatorGUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/EkonZy/MiningWorldScript/main/MiningAutomatorGUI.lua"))()
local MiningAutomator = loadstring(game:HttpGet("https://raw.githubusercontent.com/EkonZy/MiningWorldScript/main/MiningAutomatorFunctions.lua"))()

-- Variáveis locais
local player = game.Players.LocalPlayer
local screenGui = nil

-- Função para conectar a GUI com as funções
local function ConnectGUItoFunctions()
    -- Encontrar a GUI
    screenGui = player.PlayerGui:FindFirstChild("MiningAutomatorGUI")
    if not screenGui then
        warn("Mining Automator GUI não encontrada!")
        return
    end
    
    local mainFrame = screenGui:FindFirstChild("MainFrame")
    if not mainFrame then return end
    
    -- Conectar o toggle de mineração
    local leftSection = mainFrame:FindFirstChild("LeftSection")
    if leftSection then
        local miningSection = leftSection:FindFirstChild("MiningSection")
        if miningSection then
            local autoMineFrame = miningSection:FindFirstChild("AutoMineFrame")
            if autoMineFrame then
                local autoMineToggle = autoMineFrame:FindFirstChild("Toggle")
                if autoMineToggle then
                    autoMineToggle.MouseButton1Click:Connect(function()
                        MiningAutomator.Config.AutoMine = not MiningAutomator.Config.AutoMine
                        
                        if MiningAutomator.Config.AutoMine then
                            autoMineToggle.Text = "ON"
                            autoMineToggle.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
                            
                            -- Iniciar a automação
                            MiningAutomator:StartAutomation()
                        else
                            autoMineToggle.Text = "OFF"
                            autoMineToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
                            
                            -- Parar a automação
                            MiningAutomator:StopAutomation()
                        end
                    end)
                end
            end
            
            local autoTeleportFrame = miningSection:FindFirstChild("AutoTeleportFrame")
            if autoTeleportFrame then
                local autoTeleportToggle = autoTeleportFrame:FindFirstChild("Toggle")
                if autoTeleportToggle then
                    autoTeleportToggle.MouseButton1Click:Connect(function()
                        MiningAutomator.Config.AutoTeleport = not MiningAutomator.Config.AutoTeleport
                        
                        if MiningAutomator.Config.AutoTeleport then
                            autoTeleportToggle.Text = "ON"
                            autoTeleportToggle.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
                        else
                            autoTeleportToggle.Text = "OFF"
                            autoTeleportToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
                        end
                    end)
                end
            end
            
            -- Conectar o slider de delay
            local delayFrame = miningSection:FindFirstChild("DelayFrame")
            if delayFrame then
                local delaySlider = delayFrame:FindFirstChild("DelaySlider")
                local delayKnob = delaySlider and delaySlider:FindFirstChild("DelayKnob")
                local delayLabel = delayFrame:FindFirstChild("DelayLabel")
                
                if delayKnob and delayLabel then
                    local isDragging = false
                    
                    delayKnob.MouseButton1Down:Connect(function()
                        isDragging = true
                    end)
                    
                    game:GetService("UserInputService").InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            isDragging = false
                        end
                    end)
                    
                    game:GetService("UserInputService").InputChanged:Connect(function(input)
                        if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            local mousePosition = game:GetService("UserInputService"):GetMouseLocation()
                            local sliderPosition = delaySlider.AbsolutePosition
                            local sliderSize = delaySlider.AbsoluteSize
                            
                            local relativeX = math.clamp((mousePosition.X - sliderPosition.X) / sliderSize.X, 0, 1)
                            delayKnob.Position = UDim2.new(relativeX, 0, 0, 0)
                            
                            -- Atualizar o delay
                            MiningAutomator.Config.MiningDelay = 0.1 + relativeX * 2.9
                            delayLabel.Text = "Delay: " .. string.format("%.1f", MiningAutomator.Config.MiningDelay) .. "s"
                        end
                    end)
                end
            end
        end
    end
    
    -- Conectar as opções de nodes
    local rightSection = mainFrame:FindFirstChild("RightSection")
    if rightSection then
        local nodesSection = rightSection:FindFirstChild("NodesSection")
        if nodesSection then
            local ironNodeFrame = nodesSection:FindFirstChild("IronNodeFrame")
            if ironNodeFrame then
                local ironNodeToggle = ironNodeFrame:FindFirstChild("Toggle")
                if ironNodeToggle then
                    ironNodeToggle.MouseButton1Click:Connect(function()
                        -- Como agora usamos "All" para todos os tipos, vamos manter a visibilidade apenas
                        local toggleState = ironNodeToggle.Text == "ON"
                        if toggleState then
                            ironNodeToggle.Text = "OFF"
                            ironNodeToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
                        else
                            ironNodeToggle.Text = "ON"
                            ironNodeToggle.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
                        end
                    end)
                end
            end
        end
        
        -- Conectar os botões de ação
        local actionsSection = rightSection:FindFirstChild("ActionsSection")
        if actionsSection then
            local teleportToSellButton = actionsSection:FindFirstChild("TeleportToSellButton")
            if teleportToSellButton then
                teleportToSellButton.MouseButton1Click:Connect(function()
                    MiningAutomator:TeleportToSeller()
                end)
            end
            
            local sellAllButton = actionsSection:FindFirstChild("SellAllButton")
            if sellAllButton then
                sellAllButton.MouseButton1Click:Connect(function()
                    MiningAutomator:SellAll()
                end)
            end
            
            local resetStatsButton = actionsSection:FindFirstChild("ResetStatsButton")
            if resetStatsButton then
                resetStatsButton.MouseButton1Click:Connect(function()
                    MiningAutomator:ResetStats()
                end)
            end
        end
    end
    
    -- Iniciar atualizador de estatísticas
    spawn(function()
        while wait(1) do
            if screenGui and screenGui.Parent then
                MiningAutomator:UpdateStats(screenGui)
            else
                break
            end
        end
    end)
end

-- Inicializar
local function Initialize()
    -- Carregar a GUI
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EkonZy/MiningWorldScript/main/MiningAutomatorGUI.lua"))()
    
    -- Aguardar a GUI ser carregada
    wait(1)
    
    -- Conectar a GUI com as funções
    ConnectGUItoFunctions()
    
    -- Mensagem de boas-vindas
    print("Mining World Automator v1.0 carregado com sucesso!")
    print("Pressione Right Shift para mostrar/ocultar a interface.")
end

-- Inicializar quando o jogador estiver pronto
if game:IsLoaded() then
    Initialize()
else
    game.Loaded:Wait()
    Initialize()
end 
