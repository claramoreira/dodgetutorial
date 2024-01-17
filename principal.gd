extends Node

@export var Inimigo: PackedScene
var score

func _ready():
	randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	$pontuacaoTimer.stop()
	$inimigoTimer.stop()
	$HUD.exibir_game_over()

func novo_jogo():
	score = 0
	$Jogador.start($posicaoInicial.position)
	$inicioTimer.start()
	$HUD.exibir_mensagem("Prepare-se")
	$HUD.atualiza_score(score)

func _on_inicio_timer_timeout():
	$inimigoTimer.start()
	$pontuacaoTimer.start()

func _on_pontuacao_timer_timeout():
	score += 1
	$HUD.atualiza_score(score)

func _on_inimigo_timer_timeout():
	$caminhoInimigo/spawnInimigo.progress = randi()
	var inimigo = Inimigo.instantiate()
	add_child(inimigo)
	var direcao = $caminhoInimigo/spawnInimigo.rotation + PI/2
	inimigo.position = $caminhoInimigo/spawnInimigo.position
	direcao += randf_range(-PI/4, PI/4)
	inimigo.rotation = direcao
	inimigo.linear_velocity = Vector2(randf_range(inimigo.min_speed, inimigo.max_speed), 0)
	inimigo.linear_velocity = inimigo.linear_velocity.rotated(direcao)
