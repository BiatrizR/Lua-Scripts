--deve-se criar uma variável Global, ex.: _  
--criar função com o parametro pré definido hit
function pegarchave(hit)
	local humanoid = hit.Parent:FindFirstChild("Humanoid")



	if humanoid then
		_G.chaves = _G.chaves + 1
		script.Parent:Destroy()
		print("Pegou!", _G.chaves)

	end
end

--conectar sua fuçãp com a função Touched que reconhece o objeto tocado
script.Parent.Touched:Connect(pegarchave)
