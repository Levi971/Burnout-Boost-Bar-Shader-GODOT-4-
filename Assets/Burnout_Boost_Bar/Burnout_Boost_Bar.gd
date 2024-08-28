@tool
extends ColorRect
@onready var Mat = material
var Last_Meter = 0
@export var Catch_Up_Meter_Speed = 5


@export var Boost_Meter = 0.2
	#set(value):
		#Boost_Meter = value
		#Mat.set("shader_parameter/value",value)

@export var SuperCharge = false:
	set(value):
		SuperCharge = value
		Mat.set("shader_parameter/SuperCHARGE",value)
		
@export var Using_Boost = false:
	set(value):
		Using_Boost = value
		Mat.set("shader_parameter/Used",value)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Last_Meter < Boost_Meter:
		Last_Meter = lerpf(Last_Meter,Boost_Meter,Catch_Up_Meter_Speed * delta)
		Mat.set("shader_parameter/value",Last_Meter)
	else:
		Last_Meter = lerpf(Last_Meter,Boost_Meter,(Catch_Up_Meter_Speed * 2) * delta)
		Mat.set("shader_parameter/value",Last_Meter)
	
	pass
