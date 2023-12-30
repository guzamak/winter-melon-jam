extends Node

signal on_score_change
signal on_hakari_shy
signal on_karane_shy
signal on_sence_change
signal on_win

var socre = 0
var gameSence = preload("res://play/play.tscn")
var gameState = "main"
var time = "00s"

func plusscore(plus):
	socre += plus 
	on_score_change.emit()
	
func resetscore():
	socre = 0
	on_score_change.emit()
	
func settime(newtime):
	time = newtime + "s"

func change_sence_to_main():
	gameState = "main"
	gameSence = preload("res://main/main.tscn")
	on_sence_change.emit()
func change_sence_to_play():	
	gameState= "play"
	gameSence = preload("res://play/play.tscn")
	on_sence_change.emit()
	
func change_sence_to_loss():
	gameState = "loss"
	gameSence = preload("res://main/main.tscn")
	on_sence_change.emit()

func change_sence_to_win():
	gameState= "win"
	gameSence = preload("res://main/main.tscn")
	on_sence_change.emit()


