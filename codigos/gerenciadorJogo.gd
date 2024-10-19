extends Node

# Variáveis do Jogador
var vida: int = 100
var personagemEscolhido: int = 1  # 1, 2 ou 3
var poderDeCompra: int = 0
var dinheiro: int = 100
var ataque1dano: int = 10
var ataque2dano: int = 20
var ataque2carregamento: float = 5.0
var ataque3dano: int = 30
var ataque3carregamento: float = 10.0

# Variáveis do Inimigo
var inimigo_vida: int = 100
var inimigo_dano: int = 5

# Variáveis da Loja (upgrades por grupo, baseados no poderDeCompra)
var aumentoVida: int = 20
var aumentoA1dano: int = 5
var aumentoA2dano: int = 10
var diminuicaoA2carregamento: float = 1.0
var aumentoA3dano: int = 15
var diminuicaoA3carregamento: float = 2.0

# Grupos de itens desbloqueados por poderDeCompra (500, 1000, 1500, etc.)
var gruposDesbloqueados = {500: false, 1000: false, 1500: false}

# Função para aplicar dano ao inimigo e atualizar poderDeCompra
func aplicar_dano_ao_inimigo(dano: int) -> void:
	inimigo_vida -= dano
	if inimigo_vida <= 0:
		inimigo_derrotado()
	poderDeCompra += dano
	desbloquear_grupos_itens()

# Função que aumenta a vida do jogador
func aumentar_vida(valor: int) -> void:
	vida += valor

# Função que desbloqueia grupos de itens baseado no poderDeCompra
func desbloquear_grupos_itens() -> void:
	for limite in gruposDesbloqueados.keys():
		if poderDeCompra >= limite:
			gruposDesbloqueados[limite] = true

# Função para verificar se o jogador pode comprar algo na loja
func pode_comprar(valor: int) -> bool:
	return dinheiro >= valor

# Função para comprar algo e aplicar o upgrade
func comprar_upgrade(tipo: String) -> void:
	match tipo:
		"aumentoVida":
			if pode_comprar(100):  # Exemplo de custo
				dinheiro -= 100
				aumentar_vida(aumentoVida)
		"aumentoA1dano":
			if pode_comprar(200):
				dinheiro -= 200
				ataque1dano += aumentoA1dano
		"aumentoA1dano":
			if pode_comprar(200):
				dinheiro -= 200
				ataque1dano += aumentoA1dano
		# Continue com as demais compras de upgrades...

# Função chamada quando o inimigo é derrotado
func inimigo_derrotado() -> void:
	inimigo_vida += poderDeCompra * 0.1  # Aumenta a vida do inimigo
	inimigo_dano += poderDeCompra * 0.05  # Aumenta o dano do inimigo
