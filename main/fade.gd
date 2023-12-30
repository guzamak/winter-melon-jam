extends CanvasLayer

@onready var animation_player = $ColorRect/AnimationPlayer

signal trasitioned

func _ready():
	pass

func play_anim():
	animation_player.play("fade_black")


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_black":
		emit_signal("trasitioned")
		animation_player.play("fade_normal")
	if anim_name == "fade_normal":
		self.hide()

func _on_animation_player_animation_started(anim_name):
		self.show()

