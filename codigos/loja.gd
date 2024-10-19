# Exemplo de script para uma cena de loja
extends Node2D

# Função chamada quando a cena é inicializada
func _ready():
	# Atualiza o valor do Label na inicialização
	update_money_label()

# Função para atualizar o texto do Label com o valor do dinheiro
func update_money_label():
	# Acessa o Label pelo nome do nó
	var money_label = $Control/labelDinheiro
	# Atualiza o texto do Label com o valor da variável de dinheiro
	money_label.text = "Dinheiro: " + str(gerenciadorJogo.dinheiro)
