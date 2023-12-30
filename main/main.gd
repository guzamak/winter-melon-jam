extends Node2D

@onready var game_win_ui = $CanvasLayer/gameWinUI
@onready var game_over_ui = $CanvasLayer/gameOverUI
@onready var main_menu = $"CanvasLayer/Main menu"
@onready var win_over_sound = $win_over_sound

var loss_sound = preload("res://asset/sound/synth (2).wav")
var win_sound = preload("res://asset/sound/powerUp (4).wav")
# Called when the node enters the scene tree for the first time.
func _ready():
	match GameManager.gameState:
		"main":
			main_menu.show()
			game_win_ui.hide()
			game_over_ui.hide()
		"loss":
			win_over_sound.stream = loss_sound
			win_over_sound.play()
			main_menu.hide()
			game_win_ui.hide()
			game_over_ui.show()
		"win":
			win_over_sound.stream = win_sound
			win_over_sound.play()
			main_menu.hide()
			game_win_ui.show()
			game_over_ui.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
