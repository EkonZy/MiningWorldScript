-- Mining World Automator
-- Criado por: Claude

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criar interface principal
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MiningAutomatorGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Criar frame principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 350)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -175)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(150, 50, 255)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Título do painel
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
titleLabel.BorderSizePixel = 0
titleLabel.Text = "Mining World Automator v1.0"
titleLabel.TextColor3 = Color3.fromRGB(200, 100, 255)
titleLabel.TextSize = 18
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- Botão de fechar
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(200, 100, 255)
closeButton.TextSize = 18
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = mainFrame

-- Função para fechar o painel
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Criar seções (à esquerda)
local leftSection = Instance.new("Frame")
leftSection.Name = "LeftSection"
leftSection.Size = UDim2.new(0.5, -10, 1, -40)
leftSection.Position = UDim2.new(0, 5, 0, 35)
leftSection.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
leftSection.BorderSizePixel = 0
leftSection.Parent = mainFrame

-- Criar seções (à direita)
local rightSection = Instance.new("Frame")
rightSection.Name = "RightSection"
rightSection.Size = UDim2.new(0.5, -10, 1, -40)
rightSection.Position = UDim2.new(0.5, 5, 0, 35)
rightSection.BackgroundColor3 = Color3.fromRGB(30, 20, 50)
rightSection.BorderSizePixel = 0
rightSection.Parent = mainFrame

-- ===== SEÇÃO ESQUERDA =====

-- Seção de Configurações de Mineração
local miningSection = Instance.new("Frame")
miningSection.Name = "MiningSection"
miningSection.Size = UDim2.new(1, -10, 0.45, 0)
miningSection.Position = UDim2.new(0, 5, 0, 5)
miningSection.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
miningSection.BorderSizePixel = 1
miningSection.BorderColor3 = Color3.fromRGB(150, 50, 255)
miningSection.Parent = leftSection

-- Título da seção de mineração
local miningSectionTitle = Instance.new("TextLabel")
miningSectionTitle.Name = "SectionTitle"
miningSectionTitle.Size = UDim2.new(1, 0, 0, 25)
miningSectionTitle.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
miningSectionTitle.BorderSizePixel = 0
miningSectionTitle.Text = "Automação"
miningSectionTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
miningSectionTitle.TextSize = 16
miningSectionTitle.Font = Enum.Font.SourceSansBold
miningSectionTitle.Parent = miningSection

-- Toggle para ativar automação
local autoMineFrame = Instance.new("Frame")
autoMineFrame.Name = "AutoMineFrame"
autoMineFrame.Size = UDim2.new(1, -10, 0, 25)
autoMineFrame.Position = UDim2.new(0, 5, 0, 30)
autoMineFrame.BackgroundTransparency = 1
autoMineFrame.Parent = miningSection

local autoMineLabel = Instance.new("TextLabel")
autoMineLabel.Name = "AutoMineLabel"
autoMineLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoMineLabel.Position = UDim2.new(0, 0, 0, 0)
autoMineLabel.BackgroundTransparency = 1
autoMineLabel.Text = "Auto Minerar"
autoMineLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
autoMineLabel.TextSize = 14
autoMineLabel.TextXAlignment = Enum.TextXAlignment.Left
autoMineLabel.Font = Enum.Font.SourceSans
autoMineLabel.Parent = autoMineFrame

local autoMineToggle = Instance.new("TextButton")
autoMineToggle.Name = "Toggle"
autoMineToggle.Size = UDim2.new(0.25, 0, 1, 0)
autoMineToggle.Position = UDim2.new(0.75, 0, 0, 0)
autoMineToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
autoMineToggle.BorderColor3 = Color3.fromRGB(150, 50, 255)
autoMineToggle.Text = "OFF"
autoMineToggle.TextColor3 = Color3.fromRGB(200, 100, 255)
autoMineToggle.TextSize = 14
autoMineToggle.Font = Enum.Font.SourceSansBold
autoMineToggle.Parent = autoMineFrame

-- Toggle para ativar teletransporte
local autoTeleportFrame = Instance.new("Frame")
autoTeleportFrame.Name = "AutoTeleportFrame"
autoTeleportFrame.Size = UDim2.new(1, -10, 0, 25)
autoTeleportFrame.Position = UDim2.new(0, 5, 0, 60)
autoTeleportFrame.BackgroundTransparency = 1
autoTeleportFrame.Parent = miningSection

local autoTeleportLabel = Instance.new("TextLabel")
autoTeleportLabel.Name = "AutoTeleportLabel"
autoTeleportLabel.Size = UDim2.new(0.7, 0, 1, 0)
autoTeleportLabel.Position = UDim2.new(0, 0, 0, 0)
autoTeleportLabel.BackgroundTransparency = 1
autoTeleportLabel.Text = "Auto Teleporte"
autoTeleportLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
autoTeleportLabel.TextSize = 14
autoTeleportLabel.TextXAlignment = Enum.TextXAlignment.Left
autoTeleportLabel.Font = Enum.Font.SourceSans
autoTeleportLabel.Parent = autoTeleportFrame

local autoTeleportToggle = Instance.new("TextButton")
autoTeleportToggle.Name = "Toggle"
autoTeleportToggle.Size = UDim2.new(0.25, 0, 1, 0)
autoTeleportToggle.Position = UDim2.new(0.75, 0, 0, 0)
autoTeleportToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
autoTeleportToggle.BorderColor3 = Color3.fromRGB(150, 50, 255)
autoTeleportToggle.Text = "OFF"
autoTeleportToggle.TextColor3 = Color3.fromRGB(200, 100, 255)
autoTeleportToggle.TextSize = 14
autoTeleportToggle.Font = Enum.Font.SourceSansBold
autoTeleportToggle.Parent = autoTeleportFrame

-- Slider para delay
local delayFrame = Instance.new("Frame")
delayFrame.Name = "DelayFrame"
delayFrame.Size = UDim2.new(1, -10, 0, 50)
delayFrame.Position = UDim2.new(0, 5, 0, 90)
delayFrame.BackgroundTransparency = 1
delayFrame.Parent = miningSection

local delayLabel = Instance.new("TextLabel")
delayLabel.Name = "DelayLabel"
delayLabel.Size = UDim2.new(1, 0, 0, 20)
delayLabel.BackgroundTransparency = 1
delayLabel.Text = "Delay: 0.5s"
delayLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
delayLabel.TextSize = 14
delayLabel.TextXAlignment = Enum.TextXAlignment.Left
delayLabel.Font = Enum.Font.SourceSans
delayLabel.Parent = delayFrame

local delaySlider = Instance.new("Frame")
delaySlider.Name = "DelaySlider"
delaySlider.Size = UDim2.new(1, 0, 0, 20)
delaySlider.Position = UDim2.new(0, 0, 0, 25)
delaySlider.BackgroundColor3 = Color3.fromRGB(60, 40, 90)
delaySlider.BorderColor3 = Color3.fromRGB(150, 50, 255)
delaySlider.Parent = delayFrame

local delayKnob = Instance.new("TextButton")
delayKnob.Name = "DelayKnob"
delayKnob.Size = UDim2.new(0.05, 0, 1, 0)
delayKnob.Position = UDim2.new(0.5, 0, 0, 0)
delayKnob.BackgroundColor3 = Color3.fromRGB(200, 100, 255)
delayKnob.BorderColor3 = Color3.fromRGB(150, 50, 255)
delayKnob.Text = ""
delayKnob.Parent = delaySlider

-- Seção de Estatísticas
local statsSection = Instance.new("Frame")
statsSection.Name = "StatsSection"
statsSection.Size = UDim2.new(1, -10, 0.45, 0)
statsSection.Position = UDim2.new(0, 5, 0.5, 5)
statsSection.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
statsSection.BorderSizePixel = 1
statsSection.BorderColor3 = Color3.fromRGB(150, 50, 255)
statsSection.Parent = leftSection

-- Título da seção de estatísticas
local statsSectionTitle = Instance.new("TextLabel")
statsSectionTitle.Name = "SectionTitle"
statsSectionTitle.Size = UDim2.new(1, 0, 0, 25)
statsSectionTitle.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
statsSectionTitle.BorderSizePixel = 0
statsSectionTitle.Text = "Estatísticas"
statsSectionTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
statsSectionTitle.TextSize = 16
statsSectionTitle.Font = Enum.Font.SourceSansBold
statsSectionTitle.Parent = statsSection

-- Estatísticas de mineração
local nodesMinedLabel = Instance.new("TextLabel")
nodesMinedLabel.Name = "NodesMinedLabel"
nodesMinedLabel.Size = UDim2.new(1, -10, 0, 25)
nodesMinedLabel.Position = UDim2.new(0, 5, 0, 30)
nodesMinedLabel.BackgroundTransparency = 1
nodesMinedLabel.Text = "Nodes Minerados: 0"
nodesMinedLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
nodesMinedLabel.TextSize = 14
nodesMinedLabel.TextXAlignment = Enum.TextXAlignment.Left
nodesMinedLabel.Font = Enum.Font.SourceSans
nodesMinedLabel.Parent = statsSection

local timeRunningLabel = Instance.new("TextLabel")
timeRunningLabel.Name = "TimeRunningLabel"
timeRunningLabel.Size = UDim2.new(1, -10, 0, 25)
timeRunningLabel.Position = UDim2.new(0, 5, 0, 60)
timeRunningLabel.BackgroundTransparency = 1
timeRunningLabel.Text = "Tempo Ativo: 00:00:00"
timeRunningLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
timeRunningLabel.TextSize = 14
timeRunningLabel.TextXAlignment = Enum.TextXAlignment.Left
timeRunningLabel.Font = Enum.Font.SourceSans
timeRunningLabel.Parent = statsSection

local moneyEarnedLabel = Instance.new("TextLabel")
moneyEarnedLabel.Name = "MoneyEarnedLabel"
moneyEarnedLabel.Size = UDim2.new(1, -10, 0, 25)
moneyEarnedLabel.Position = UDim2.new(0, 5, 0, 90)
moneyEarnedLabel.BackgroundTransparency = 1
moneyEarnedLabel.Text = "Dinheiro Ganho: $0"
moneyEarnedLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
moneyEarnedLabel.TextSize = 14
moneyEarnedLabel.TextXAlignment = Enum.TextXAlignment.Left
moneyEarnedLabel.Font = Enum.Font.SourceSans
moneyEarnedLabel.Parent = statsSection

-- ===== SEÇÃO DIREITA =====

-- Seção de Configuração de Nodes
local nodesSection = Instance.new("Frame")
nodesSection.Name = "NodesSection"
nodesSection.Size = UDim2.new(1, -10, 0.45, 0)
nodesSection.Position = UDim2.new(0, 5, 0, 5)
nodesSection.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
nodesSection.BorderSizePixel = 1
nodesSection.BorderColor3 = Color3.fromRGB(150, 50, 255)
nodesSection.Parent = rightSection

-- Título da seção de nodes
local nodesSectionTitle = Instance.new("TextLabel")
nodesSectionTitle.Name = "SectionTitle"
nodesSectionTitle.Size = UDim2.new(1, 0, 0, 25)
nodesSectionTitle.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
nodesSectionTitle.BorderSizePixel = 0
nodesSectionTitle.Text = "Tipos de Nodes"
nodesSectionTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
nodesSectionTitle.TextSize = 16
nodesSectionTitle.Font = Enum.Font.SourceSansBold
nodesSectionTitle.Parent = nodesSection

-- Opções de nodes
local ironNodeFrame = Instance.new("Frame")
ironNodeFrame.Name = "IronNodeFrame"
ironNodeFrame.Size = UDim2.new(1, -10, 0, 25)
ironNodeFrame.Position = UDim2.new(0, 5, 0, 30)
ironNodeFrame.BackgroundTransparency = 1
ironNodeFrame.Parent = nodesSection

local ironNodeLabel = Instance.new("TextLabel")
ironNodeLabel.Name = "IronNodeLabel"
ironNodeLabel.Size = UDim2.new(0.7, 0, 1, 0)
ironNodeLabel.Position = UDim2.new(0, 0, 0, 0)
ironNodeLabel.BackgroundTransparency = 1
ironNodeLabel.Text = "Iron Node"
ironNodeLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
ironNodeLabel.TextSize = 14
ironNodeLabel.TextXAlignment = Enum.TextXAlignment.Left
ironNodeLabel.Font = Enum.Font.SourceSans
ironNodeLabel.Parent = ironNodeFrame

local ironNodeToggle = Instance.new("TextButton")
ironNodeToggle.Name = "Toggle"
ironNodeToggle.Size = UDim2.new(0.25, 0, 1, 0)
ironNodeToggle.Position = UDim2.new(0.75, 0, 0, 0)
ironNodeToggle.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
ironNodeToggle.BorderColor3 = Color3.fromRGB(150, 50, 255)
ironNodeToggle.Text = "ON"
ironNodeToggle.TextColor3 = Color3.fromRGB(200, 100, 255)
ironNodeToggle.TextSize = 14
ironNodeToggle.Font = Enum.Font.SourceSansBold
ironNodeToggle.Parent = ironNodeFrame

-- Adicione mais opções de nodes conforme necessário...

-- Seção de Botões de Ação
local actionsSection = Instance.new("Frame")
actionsSection.Name = "ActionsSection"
actionsSection.Size = UDim2.new(1, -10, 0.45, 0)
actionsSection.Position = UDim2.new(0, 5, 0.5, 5)
actionsSection.BackgroundColor3 = Color3.fromRGB(40, 30, 70)
actionsSection.BorderSizePixel = 1
actionsSection.BorderColor3 = Color3.fromRGB(150, 50, 255)
actionsSection.Parent = rightSection

-- Título da seção de ações
local actionsSectionTitle = Instance.new("TextLabel")
actionsSectionTitle.Name = "SectionTitle"
actionsSectionTitle.Size = UDim2.new(1, 0, 0, 25)
actionsSectionTitle.BackgroundColor3 = Color3.fromRGB(50, 40, 80)
actionsSectionTitle.BorderSizePixel = 0
actionsSectionTitle.Text = "Ações"
actionsSectionTitle.TextColor3 = Color3.fromRGB(200, 100, 255)
actionsSectionTitle.TextSize = 16
actionsSectionTitle.Font = Enum.Font.SourceSansBold
actionsSectionTitle.Parent = actionsSection

-- Botão para teleportar para o vendedor
local teleportToSellButton = Instance.new("TextButton")
teleportToSellButton.Name = "TeleportToSellButton"
teleportToSellButton.Size = UDim2.new(1, -10, 0, 30)
teleportToSellButton.Position = UDim2.new(0, 5, 0, 30)
teleportToSellButton.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
teleportToSellButton.BorderColor3 = Color3.fromRGB(150, 50, 255)
teleportToSellButton.Text = "Teletransportar para Vendedor"
teleportToSellButton.TextColor3 = Color3.fromRGB(200, 100, 255)
teleportToSellButton.TextSize = 14
teleportToSellButton.Font = Enum.Font.SourceSansBold
teleportToSellButton.Parent = actionsSection

-- Botão para vender tudo
local sellAllButton = Instance.new("TextButton")
sellAllButton.Name = "SellAllButton"
sellAllButton.Size = UDim2.new(1, -10, 0, 30)
sellAllButton.Position = UDim2.new(0, 5, 0, 65)
sellAllButton.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
sellAllButton.BorderColor3 = Color3.fromRGB(150, 50, 255)
sellAllButton.Text = "Vender Tudo"
sellAllButton.TextColor3 = Color3.fromRGB(200, 100, 255)
sellAllButton.TextSize = 14
sellAllButton.Font = Enum.Font.SourceSansBold
sellAllButton.Parent = actionsSection

-- Botão para resetar estatísticas
local resetStatsButton = Instance.new("TextButton")
resetStatsButton.Name = "ResetStatsButton"
resetStatsButton.Size = UDim2.new(1, -10, 0, 30)
resetStatsButton.Position = UDim2.new(0, 5, 0, 100)
resetStatsButton.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
resetStatsButton.BorderColor3 = Color3.fromRGB(150, 50, 255)
resetStatsButton.Text = "Resetar Estatísticas"
resetStatsButton.TextColor3 = Color3.fromRGB(200, 100, 255)
resetStatsButton.TextSize = 14
resetStatsButton.Font = Enum.Font.SourceSansBold
resetStatsButton.Parent = actionsSection

-- Adicione a funcionalidade aqui para os botões e toggles
-- (Implementação básica para mostrar como os toggles funcionam)

-- Variáveis para controlar o estado
local autoMineEnabled = false
local autoTeleportEnabled = false
local selectedNodeTypes = {
    ["Iron Node"] = true
}
local miningDelay = 0.5

-- Função para atualizar o visual dos toggles
local function updateToggle(button, enabled)
    if enabled then
        button.Text = "ON"
        button.BackgroundColor3 = Color3.fromRGB(100, 70, 150)
    else
        button.Text = "OFF"
        button.BackgroundColor3 = Color3.fromRGB(80, 50, 100)
    end
end

-- Toggle para automação de mineração
autoMineToggle.MouseButton1Click:Connect(function()
    autoMineEnabled = not autoMineEnabled
    updateToggle(autoMineToggle, autoMineEnabled)
    
    -- Lógica para iniciar/parar a automação de mineração
    if autoMineEnabled then
        -- Iniciar a automação de mineração
        print("Automação de mineração ativada")
    else
        -- Parar a automação de mineração
        print("Automação de mineração desativada")
    end
end)

-- Toggle para automação de teletransporte
autoTeleportToggle.MouseButton1Click:Connect(function()
    autoTeleportEnabled = not autoTeleportEnabled
    updateToggle(autoTeleportToggle, autoTeleportEnabled)
    
    -- Lógica para iniciar/parar a automação de teletransporte
    if autoTeleportEnabled then
        -- Iniciar a automação de teletransporte
        print("Automação de teletransporte ativada")
    else
        -- Parar a automação de teletransporte
        print("Automação de teletransporte desativada")
    end
end)

-- Toggle para seleção de Iron Node
ironNodeToggle.MouseButton1Click:Connect(function()
    selectedNodeTypes["Iron Node"] = not selectedNodeTypes["Iron Node"]
    updateToggle(ironNodeToggle, selectedNodeTypes["Iron Node"])
end)

-- Funcionalidade do slider de delay
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
        
        -- Calcular o delay (0.1 a 3 segundos)
        miningDelay = 0.1 + relativeX * 2.9
        delayLabel.Text = "Delay: " .. string.format("%.1f", miningDelay) .. "s"
    end
end)

-- Botão para teleportar para o vendedor
teleportToSellButton.MouseButton1Click:Connect(function()
    -- Lógica para teleportar para o vendedor
    print("Teleportando para o vendedor...")
    -- Implemente a lógica aqui
end)

-- Botão para vender tudo
sellAllButton.MouseButton1Click:Connect(function()
    -- Lógica para vender tudo
    print("Vendendo tudo...")
    -- Implemente a lógica aqui
end)

-- Botão para resetar estatísticas
resetStatsButton.MouseButton1Click:Connect(function()
    -- Resetar estatísticas
    nodesMinedLabel.Text = "Nodes Minerados: 0"
    timeRunningLabel.Text = "Tempo Ativo: 00:00:00"
    moneyEarnedLabel.Text = "Dinheiro Ganho: $0"
    print("Estatísticas resetadas")
end)

-- Atalho de teclado para mostrar/ocultar a interface
local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        screenGui.Enabled = not screenGui.Enabled
    end
end)

-- Mensagem de inicialização
print("Mining World Automator carregado! Pressione Right Shift para mostrar/ocultar a interface.")

-- Função principal que será implementada aqui para a automação
-- Vai conter a lógica para encontrar nós, teleportar e minerar
