extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_loja_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/loja.tscn")


func _on_btn_jogo_pressed() -> void:
	get_tree().change_scene_to_file("res://cenas/jogo.tscn")

func _on_texture_button_pressed() -> void:
	gerenciadorJogo.aplicar_dano_ao_jogador(10)
	pass


func _on_btn_escolher_welyson_pressed() -> void:
	gerenciadorJogo.personagemEscolhido = 1
	print("Personagem selecionado 1")


func _on_btn_escolher_joice_pressed() -> void:
	gerenciadorJogo.personagemEscolhido = 2
	print("Personagem selecionado 2")


func _on_btn_escolher_lucas_pressed() -> void:
	gerenciadorJogo.personagemEscolhido = 3
	print("Personagem selecionado 3")
