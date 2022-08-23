--criar uma variavel local que terá como valor a plataforma que irá desaparecer-- 
--local pois só será utilizada para essa plataforma

local plataform = script.Parent
--script se refere ao script em que você está escrevendo e o Parent do script é onde ele está localizado.

--criar uma function chamada desaparecer, pois é a ação que ela executtará
local function disappear()
	
	-- as propiedades dos objetos podem ser acessados usando o . ponto/dot
	plataform.CanCollide = false
	plataform.Transparency = 1
	
end

--chame a function para testar, comentar depois e fazer a function para reaparecer
--disappear()

-- fazer uma funtion paraa a plataforma reaparecer

local function appear()
	plataform.CanCollide = true
	plataform.Transparency = 0
	
end




--fazer loop de repetição para a plataforma sumir e reaparecer de acordo com um tempo usando as funções já criadas
while true do
	-- código para aguardar alguns minutos entre as chamadas das funtions
	
	wait(3)
	disappear()
	wait(3)
	appear()
	
end
-- while true é um loope de repetição infinita, por isso a condição precisa ser verdadeira
--ATENÇÃO É OBRIGATÓRIO O USO DO WAIT PARA O LOOP INFINITO, caso o contrário o jogo trava, pois nunca será possível sair do loop para executar outros códigos.
