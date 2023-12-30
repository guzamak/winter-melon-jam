extends Node

signal on_obj_change

var obj = {
	"obj1":{
		"hakari":2,
		"karane":-5,
		"path": preload("res://asset/obj/obj2.png")
	},
	"obj2":{
		"hakari":-5,
		"karane":2,
		"path": preload("res://asset/obj/obj1.png")
	},
	"obj3":{
		"hakari":2,
		"karane":2,
		"path": preload("res://asset/obj/obj3.png")
	},
}
var obj_now = {}

func _ready():
	random_obj()
	
func random_obj():
	var obj_keys = obj.keys()
	var random_key = obj_keys[randi() % obj_keys.size()]
	var random_obj = obj[random_key]
	obj_now = random_obj
	on_obj_change.emit()
