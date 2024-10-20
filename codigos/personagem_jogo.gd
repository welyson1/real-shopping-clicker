extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
var speed = 300
var input = Vector2.ZERO

func _ready():
	# Carrega os recursos .tres (Sprite)
	var sprite_textureJoice = load("res://assets/assets/animations/anim_j.tres")
	var sprite_textureLucas = load("res://assets/assets/animations/anim_l.tres")
	var sprite_textureWelyson = load("res://assets/assets/animations/anim_w.tres")
	
	# Verifica qual personagem foi escolhido e define o sprite apropriado
	match gerenciadorJogo.personagemEscolhido:
		2:
			animated_sprite.frames = sprite_textureJoice
		3:
			animated_sprite.frames = sprite_textureLucas
		1:
			animated_sprite.frames = sprite_textureWelyson
		_:
			print("Personagem não encontrado!")
