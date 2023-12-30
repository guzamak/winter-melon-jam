extends Node2D

@onready var fade = $Fade
@onready var current_sence = $CurrentSence

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_sence_change.connect(on_sence_change)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_fade_trasitioned():
	current_sence.get_child(0).queue_free()
	var scene_two_instance = GameManager.gameSence.instantiate()
	current_sence.add_child(scene_two_instance)



func on_sence_change():
	fade.play_anim()
