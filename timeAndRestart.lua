local Players = game:GetService("Players")
--Aqui estamos salvando a função em uma variável chamada player




--última etapa  - 1. criar uma function para zerar a vida do jogador quando morrer
local function onCharacterAdded(character, player)
	-- 3.1 colocar o atributo como verdadeiro ao identificar o player
	player:SetAttribute("IsAlive", true)
	
	
--colocar os blocos matemático visiveis novamente no jogo quando recomeçar
	_G.blocoMath1.Transparency = 0
	_G.blocoMath1.CanCollide = true
	
	_G.blocoMath2.Transparency = 0
	_G.blocoMath2.CanCollide = true
	
	_G.blocoMath3.Transparency = 0
	_G.blocoMath3.CanCollide = true
	
	_G.blocoMathFinal.Transparency = 0
	_G.blocoMathFinal.CanCollide = true
	

	local humanoid = character:WaitForChild("Humanoid")
	--Quando um jogador morre, seu Humanoid dispara automaticamente um evento Died, esse evento que conectaremos para zerar os pontos
	humanoid.Died:Connect(function()
		local points = player.leaderstats.Points
		
		
		--definir isAlive como false quando conectar a function Died
		player:SetAttribute("IsAlive", false)
		
		points.Value = 0
		--sumir com tela do calculo se morrer e com a ponte
		_G.calculateOne.Visible = false
		
	
	end)

end




--2.criar uma function chamada e passar um parametro
local function onPlayerAdded(player)
	--aqui estammos criando uma function com o nome de onPlayerAdded que terá um parametro (player). Esse parametro representa qualquer jogador.	

	local leaderstats = Instance.new("Folder")
	--[[aqui criamos um objeto chamado Folder e colocamos o resultado na variável leaderstats
		novos objetos podem ser criados a partir da de uma função chamada Instance.new]]--


	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	--aqui mudamos as propiedades nome e parent do objeto, agora temos o texto no nome e o parametro como parent


	local points = Instance.new("IntValue")
	points.Name = "Points"
	points.Value = 0
	points.Parent = leaderstats
	--aqui nesse trecho do código estamos adicionando um novo objeto usando Instance.new, adicionando na variável points e modificando suas propriedades que tudo será exibido na leadestats



	--ultima etapa -3. criar um atributo no player chamado IsAlive
	player:SetAttribute("IsAlive", false)

	--última etapa - 2. Conectar a function com o evernto par detectar o personagem
	player.CharacterAdded:Connect(function(character)
		onCharacterAdded(character, player)
	end)

	
	
end



Players.PlayerAdded:Connect(onPlayerAdded)
--na linha de cima estamos conectando nossa function com um evento chamado PlayerAdded. Esse evento indentifica a entrada do jogador no jogo.


--criar functin para matar o player
function killPlayer(character, player)

	--uma variavel que irá armazenar o pai da peça que tocar a lavae usaremos o parametro como referência



	--Connect a função FindFirstChild que tem como parametro "Humanoid "na variável partPlayer, armazene o resultado em uma nova variável chamada humanoid
	local humanoid = character:WaitForChild("Humanoid")


	--crie uma função apenar para verificar a variavel humanoid, ou seja, Se encontrar uma parte do jogador faça...
	if humanoid then

		humanoid.Health = 0

	end

	--[[Em Lua, qualquer valor diferente de false ou nil (um valor vazio) é avaliado como true em uma instrução condicional.
	portanto, nesse caso, você pode usar humanoid diretamente como condição]]--

end



while true do 
	
	wait(1)
	
	local playerList = Players:GetPlayers()
	-- usaremos a function GetPlayers que reconhecerá cada jogador no jogo (observação: é uma function que percorre a matriz/array de jogadores), salvando em playList

	for currentPlayer = 1, #playerList do

		 player = playerList[currentPlayer]

		--Ultima etapa - 4. condição para só pontuar se player estiver vivo
		if player:GetAttribute("IsAlive") then
			
			
		
			local points = player.leaderstats.Points
			points.Value = points.Value + 1
			--aqui estamos adicionando +1 para cada jogador da matriz, ou seja, cada jogador que acessar o jogo
			
			
			

		end

		
			
		
	end
	--while - aqui criamos um loop while, os pontos serão contados a cada segundo de vida do jogador, portanto um repita a cada segundo é correto
	--for - o nosso loop for começando em 1 e percorrendo os índices de acordo com o que os jogadores forem entrando no jogo. Obs.: # é utilizado para obter o comprimento de um array

end

