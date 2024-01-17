extends CanvasLayer

signal start_game

func exibir_mensagem(text):
	$messageLabel.text = text
	$messageLabel.show()
	$messageTimer.start()

func exibir_game_over():
	exibir_mensagem("Fim de jogo!")
	
	await($messageTimer.timeout)
	$messageLabel.text = "Desvie e sobreviva aos monstros!"
	$messageLabel.show()
	
	await(get_tree().create_timer(1).timeout)
	$startButton.show()

func atualiza_score(score):
	$scoreLabel.text = str(score)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_button_pressed():
	$startButton.hide()
	emit_signal("start_game")

func _on_message_timer_timeout():
	$messageLabel.hide()
