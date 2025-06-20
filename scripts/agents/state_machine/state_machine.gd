class_name StateMachine
extends Node


var state : BaseState


func init(parent: Node, starting_state: BaseState) -> void:
    for child in get_children():
        child.parent = parent

    set_state(starting_state)


func set_state(new_state: BaseState) -> void:
    if state:
        state.exit()

    state = new_state
    state.enter()


func process_physics(delta: float) -> void:
    var new_state: BaseState = state.process_physics(delta)
    if new_state:
        set_state(new_state)


func process_frame(delta: float) -> void:
    var new_state: BaseState = state.process_frame(delta)
    if new_state:
        set_state(new_state)
