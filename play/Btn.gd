extends Sprite2D

@export var character :String
@export_file("*.wav") var soundfile : String 
@onready var margin_container = $Control2/MarginContainer
@onready var label = $Control2/MarginContainer/Label
@onready var button = $Control/Button
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

var btn_use = preload("res://asset/btn/btn-use.png")
var btn = preload("res://asset/btn/btn.png")
signal clickbutton


func _ready():
	var sound = load(soundfile)
	label.text = character
	audio_stream_player_2d.stream = sound

func hover():
	modulate = Color(0.9, 0.9, 0.9, 1.0)


func unhover():
	modulate = Color(1.0, 1.0, 1.0, 1.0)


func _on_button_button_down():
	texture = btn_use
	audio_stream_player_2d.play()
	margin_container.add_theme_constant_override("margin_top", 10)
	clickbutton.emit()
	


func _on_button_button_up():
	margin_container.add_theme_constant_override("margin_top", 0)
	texture = btn

