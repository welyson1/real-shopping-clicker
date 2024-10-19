# Exemplo de script para uma cena de loja
extends Node2D

# Função chamada quando a cena é inicializada
func _ready():
	# Atualiza o valor do Label na inicialização
	update_labels()

# Função para atualizar o texto do Label com o valor do dinheiro
func update_labels():
	# Acessa o Label pelo nome do nó
	var dinheiro_label = $Control/BoxContainer/HBoxContainer/labelDinheiro
	var vida_label = $Control/BoxContainer/HBoxContainer/labelVida
	var poderCompra_label = $Control/BoxContainer/HBoxContainer/labelPoderCompra
	# Atualiza o texto do Label com o valor
	dinheiro_label.text = "Dinheiro: " + str(gerenciadorJogo.dinheiro)
	vida_label.text = "Vida: " + str(gerenciadorJogo.vida)
	poderCompra_label.text = "Poder de compra: " + str(gerenciadorJogo.poderDeCompra)
