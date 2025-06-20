class_name BaseState
extends Node

var parent : Agent

func enter() -> void:
    pass

func exit() -> void:
    pass

func process_physics(_delta: float) -> BaseState:
    return null

func process_frame(_delta: float) -> BaseState:
    return null
