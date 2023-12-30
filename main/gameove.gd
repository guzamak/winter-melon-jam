extends Control

@export var headertxt  : String
@export_multiline var labeltxt : String
@onready var header = $Header
@onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	header.text = headertxt
	label.text = str(labeltxt)
	if GameManager.gameState == "win":
		label.text += GameManager.time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_btn_clickbutton():
	GameManager.change_sence_to_play()


func _on_main_btn_clickbutton():
	GameManager.change_sence_to_main()
