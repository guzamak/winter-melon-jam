extends Control

@onready var score = $Score
@onready var score_label = $ScoreLabel
@onready var karane_like = $Menu/Control/KaraneLike
@onready var hakari_like = $Menu/Control/HakariLike
@onready var time_use_label = $TimeUseLabel
@onready var timetext = $Time
@onready var hakari_btn = $HakariBtn
@onready var karane_btn = $KaraneBtn
@onready var obj_anim = $Obj/obj_anim
@onready var obj = $Obj
@onready var label = $Label
@onready var timer = $Timer

var gamestar = false
var time = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	LoveGifObj.on_obj_change.connect(on_obj_change)
	GameManager.on_score_change.connect(on_score_change)
	on_obj_change()
	GameManager.resetscore()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if gamestar:
		label.hide()
		time += delta
		var secs = fmod(time,60)
		var time_passed = "%02d" % [secs]
		timetext.text = time_passed
		GameManager.settime(time_passed)
	#win
	if GameManager.socre >= 30 :
		GameManager.on_win.emit()
	if GameManager.socre <= -10:
		GameManager.change_sence_to_loss()


func change_score_in_menu(obj_now):
	if obj_now["karane"] == -3:
		karane_like.text = "Karane 0"
	else:
		var repeatedString = ""
		for i in range(obj_now["karane"]):
			repeatedString += "i"
		karane_like.text = "Karane " + repeatedString
		
	if obj_now["hakari"] == -3:
		hakari_like.text = "Hakari 0"
	else:
		var repeatedString = ""
		for i in range(obj_now["hakari"]):
			repeatedString += "i"
		hakari_like.text = "Hakari " + repeatedString


func _on_karane_btn_clickbutton():
	gamestar = true
	obj_anim.play("give_to")
	GameManager.plusscore(LoveGifObj.obj_now["karane"])
	if LoveGifObj.obj_now["karane"] >= 0:
		GameManager.on_karane_shy.emit()
	


func _on_hakari_btn_clickbutton():
	gamestar = true
	obj_anim.play("give_to")
	GameManager.plusscore(LoveGifObj.obj_now["hakari"])
	if LoveGifObj.obj_now["hakari"] >= 0:
		GameManager.on_hakari_shy.emit()


func _on_animation_player_animation_started(anim_name):
	if anim_name == "give_to":
		timer.start()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "give_to":
		hakari_btn.show()
		karane_btn.show()
		hakari_btn.unhover() #fix bug
		karane_btn.unhover()
		LoveGifObj.random_obj()
	obj_anim.play("RESET")

func on_obj_change():
	var obj_now = LoveGifObj.obj_now
	obj.texture = obj_now["path"]
	change_score_in_menu(obj_now)
	
func on_score_change():
	score.text = str(GameManager.socre)



func _on_timer_timeout():
	hakari_btn.hide()
	karane_btn.hide()
