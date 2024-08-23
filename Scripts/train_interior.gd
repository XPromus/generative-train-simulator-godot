extends Node3D

var gasLever : Node3D
var brakeLever : Node3D

var gasAmount : float = 0
var brakeAmount : float = 0

@export var inputChange : float = 0.6

const maxGasRotation : float = 30
const minGasRotation : float = -30

const maxBrakeRotation : float = 40
const minBrakeRotation : float = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	gasLever = get_node("Pivot/Gas")
	brakeLever = get_node("Pivot/Brake")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	brakeAmount = clamp(brakeAmount, 0, 1)
	gasAmount = clamp(gasAmount, 0, 1)
	
	var gasRotation = ((maxGasRotation + abs(minGasRotation)) * gasAmount) - maxGasRotation
	var brakeRotation = ((maxBrakeRotation + abs(minBrakeRotation)) * brakeAmount) - minBrakeRotation
	
	gasLever.rotation_degrees = Vector3(gasRotation, 0, 0)
	brakeLever.rotation_degrees = Vector3(0, brakeRotation, 0)
		
	if (Input.is_key_pressed(KEY_W)):
		if (brakeAmount == 0):
			gasAmount += inputChange * delta
			pass
		elif (gasAmount == 0):
			brakeAmount -= inputChange * delta
			pass
		pass
	elif (Input.is_key_pressed(KEY_S)):
		if (gasAmount == 0):
			brakeAmount += inputChange * delta
			pass
		elif (brakeAmount == 0):
			gasAmount -= inputChange * delta
			pass
		pass
	
	if (Input.is_key_pressed(KEY_SPACE)):
		gasAmount = 0
		brakeAmount = 0
		pass
	
	pass
