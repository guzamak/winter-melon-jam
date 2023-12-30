extends Node2D

@onready var hakari_anim = $Hakari/Hakari_anim
@onready var karane_anim = $Karane/Karane_anim
@onready var audio_stream_player = $AudioStreamPlayer
@onready var timer = $Timer

var shy_sound = preload("res://asset/sound/powerUp (3).wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	audio_stream_player.stream = shy_sound
	GameManager.function_called = false
	GameManager.on_karane_shy.connect(on_karane_shy)
	GameManager.on_hakari_shy.connect(on_hakari_shy)
	GameManager.on_win.connect(on_win)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_karane_shy():
	karane_anim.play("shy")
	audio_stream_player.play()
	
func on_hakari_shy():
	hakari_anim.play("shy")
	audio_stream_player.play()


func _on_karane_anim_animation_finished(anim_name):
	karane_anim.play("karane_blink")


func _on_hakari_anim_animation_finished(anim_name):
	hakari_anim.play("hakari_blink")

func on_win():
	if !GameManager.function_called:
		karane_anim.play("shy_shy")
		hakari_anim.play("shy_shy")
		timer.start()
		GameManager.function_called = true


func _on_timer_timeout():
	GameManager.change_sence_to_win()
