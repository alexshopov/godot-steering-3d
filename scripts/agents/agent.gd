class_name Agent
extends CharacterBody3D

@export
var starting_state : BaseState
@export
var target : Node3D

@onready
var animation_player: AnimationPlayer = $AnimationPlayer
@onready
var state_machine: StateMachine = $StateMachine


func _ready() -> void:
    state_machine.init(self, starting_state)


func _physics_process(delta: float) -> void:
    state_machine.process_physics(delta)


func _process(delta: float) -> void:
    state_machine.process_frame(delta)


func play_animation(animation: StringName) -> void:
    animation_player.play(animation)

