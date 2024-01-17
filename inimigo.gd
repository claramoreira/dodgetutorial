extends RigidBody2D

@export var min_speed = 150
@export var max_speed = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	var tipos_inimigo = $AnimatedSprite2D.get_sprite_frames().get_animation_names()
	$AnimatedSprite2D.animation = tipos_inimigo[randi() % tipos_inimigo.size()]
	$AnimatedSprite2D.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
