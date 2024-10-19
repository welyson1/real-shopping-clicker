extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_money_label()


func _on_btn_loja_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/loja.tscn")


func _on_btn_jogo_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")

func _on_texture_button_pressed() -> void:
	gerenciadorJogo.aplicar_dano_ao_jogador(10)
	pass

func update_money_label():
	# Acessa o Label pelo nome do nó
	var money_label = $Control/labelVida
	# Atualiza o texto do Label com o valor da variável de dinheiro
	money_label.text = "Vida: " + str(gerenciadorJogo.vida)
