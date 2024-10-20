extends Node2D

var playerAnim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playerAnim = get_node("player")
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

# Ícones dos poderes
@export var icon_power1: TextureButton
@export var icon_power2: TextureButton
@export var icon_power3: TextureButton

# Labels para o tempo de recarga
@export var cooldown_label_power2: Label
@export var cooldown_label_power3: Label

# Variáveis de recarga (tempo em segundos)
@export var attack2_cooldown = 5.0
@export var attack3_cooldown = 8.0


# Controle de recarga dos poderes
var attack2_available = true
var attack3_available = true
var attack2_time_remaining = 0.0
var attack3_time_remaining = 0.0

func _process(delta):
	# Detecta as teclas pressionadas
	if Input.is_action_just_pressed("power1"):
		activate_power(1)
	elif Input.is_action_just_pressed("power2") and attack2_available:
		activate_power(2)
	elif Input.is_action_just_pressed("power3") and attack3_available:
		activate_power(3)
	
	# Atualiza o tempo de recarga nas labels
	update_cooldown_labels(delta)

func activate_power(power: int):
	match power:
		1:
			# Executa o ataque 1 (sem tempo de recarga)
			gerenciadorJogo.aplicar_dano_ao_inimigo(10) # Exemplo de dano
			update_icon_opacity(icon_power1, 0.5) # Reduz a opacidade do ícone
			await get_tree().create_timer(0.2).timeout # Aguardar um pequeno intervalo para feedback visual
			update_icon_opacity(icon_power1, 1.0) # Restaura a opacidade imediatamente
			playerAnim.animated_sprite.play("ataca1")
		2:
			# Executa o ataque 2
			gerenciadorJogo.aplicar_dano_ao_inimigo(20)
			update_icon_opacity(icon_power2, 0.5)
			attack2_available = false
			attack2_time_remaining = gerenciadorJogo.ataque2carregamento
			# Inicia recarga do ataque 2
			await get_tree().create_timer(gerenciadorJogo.ataque2carregamento).timeout
			reset_power(2)
		3:
			# Executa o ataque 3
			gerenciadorJogo.aplicar_dano_ao_inimigo(30)
			update_icon_opacity(icon_power3, 0.5)
			attack3_available = false
			attack3_time_remaining = attack3_cooldown
			# Inicia recarga do ataque 3
			await get_tree().create_timer(attack3_cooldown).timeout
			reset_power(3)


func reset_power(power: int):
	match power:
		2:
			attack2_available = true
			update_icon_opacity(icon_power2, 1.0) # Restaura a opacidade do ícone
			cooldown_label_power2.text = "" # Limpa o texto da label
		3:
			attack3_available = true
			update_icon_opacity(icon_power3, 1.0)
			cooldown_label_power3.text = "" # Limpa o texto da label

func update_icon_opacity(icon: TextureButton, opacity: float):
	var modulate_color = icon.modulate
	modulate_color.a = opacity
	icon.modulate = modulate_color

func update_cooldown_labels(delta):
	# Atualiza o tempo restante para o ataque 2
	if not attack2_available:
		attack2_time_remaining -= delta
		if attack2_time_remaining <= 0:
			attack2_time_remaining = 0
		cooldown_label_power2.text = str(round(attack2_time_remaining * 10) / 10.0) + "s"
	
	# Atualiza o tempo restante para o ataque 3
	if not attack3_available:
		attack3_time_remaining -= delta
		if attack3_time_remaining <= 0:
			attack3_time_remaining = 0
		cooldown_label_power3.text = str(round(attack3_time_remaining * 10) / 10.0) + "s"
