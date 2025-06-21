class_name SteeringState
extends BaseState

@export
var max_speed : float = 2.0
@export
var max_acceleration : float = 1.0

var steering : SteeringBehavior

func enter() -> void:
	steering.agent = parent
	steering.target = parent.target
	steering.max_speed = max_speed

