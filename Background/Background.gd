extends ColorRect

onready var HUD = get_node("/root/Game/HUD")
var c = 0
var colors = [
	Color8(33,37,41)
	,Color8(52,58,64)
	,Color8(73,80,87)
	,Color8(52,58,64)
]

func _ready():
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()


func update_color():
	if HUD.color_background:
		pass
	else:
		pass

func _on_HUD_changed():
	update_color()

