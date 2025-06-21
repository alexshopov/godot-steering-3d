class_name GrazerSeekState
extends SteeringState

@export
var grazer_idle_state : BaseState


func _ready() -> void:
	steering = SteeringSeek.new()


func enter() -> void:
	super()
	steering.max_acceleration = max_acceleration

	parent.play_animation(&"move")


func exit() -> void:
	parent.animation_player.stop()


func process_physics(delta: float) -> BaseState:
	var steering_out := steering.get_steering()
	if not steering_out:
		return grazer_idle_state

	parent.velocity += steering_out.linear * delta
	if parent.velocity.length() > steering.max_speed:
		parent.velocity = parent.velocity.normalized() * steering.max_speed

	var align := parent.target.global_position
	align.y = 0.2
	parent.look_at(align, Vector3.UP)

	parent.move_and_slide()
	return null
