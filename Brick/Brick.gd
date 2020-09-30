extends KinematicBody2D

onready var HUD = get_node("/root/Game/HUD")
onready var target_y = position.y
var row = 0
var col = 0

export var appear_speed = 2
export var fall_speed = 1

onready var textures = [
	load("res://Assets/confetti.png")
	,load("res://Assets/bubble.png")
]

var colors = [
	Color8(224,49,49)		
	,Color8(253,126,20)		
	,Color8(255,224,102)	
	,Color8(148,216,45)		
	,Color8(34,139,230)		
	,Color8(190,75,219)		
	,Color8(132,94,247)		
]

func _ready():
	randomize()
	HUD.connect("changed",self,"_on_HUD_changed")
	update_color()


func update_color():
	if HUD.color_blocks:
		if row >= 0 and row < colors.size():
			$Color.color = colors[row]
	else:
		$Color.color = Color(1,1,1,1)



func emit_particle(pos):
	if HUD.particle_blocks:
		$Particles2D.texture = textures[randi() % textures.size()]
		$Particles2D.emitting = true
		$Particles2D.global_position = pos
	
	
func _on_HUD_changed():
	update_color()


func die():
	queue_free()


	collision_layer = 0
	collision_mask = 0
