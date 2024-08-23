extends Node3D

@export var movementSpeed : float = 0.005
@export var path : Path3D
@export var pathFollow : PathFollow3D
@export var pathFollowTracer : PathFollow3D

var train: Node3D
var trainInformation

var bogeySpacing : float

func _ready():
	train = get_node("TrainInterior")
	pass

func _process(delta):
	pathFollow.progress_ratio += delta * movementSpeed * train.gasAmount
	pathFollowTracer.progress_ratio += delta * movementSpeed * train.gasAmount
	train.look_at_from_position(train.global_position, pathFollowTracer.global_position)
	train.global_position = pathFollow.global_position
	pass
