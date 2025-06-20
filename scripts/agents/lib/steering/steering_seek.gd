class_name SteeringSeek
extends SteeringBehavior

@export
var max_acceleration : float


func get_steering() -> SteeringOutput:
	var out = SteeringOutput.new()

	out.linear = agent.global_position.direction_to(target.global_position) * max_acceleration
	out.angular = 0.

	return out