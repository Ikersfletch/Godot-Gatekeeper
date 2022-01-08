tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("Gatekeeper","Node",preload("gatekeeper_node.gd"),preload("icon.svg"))

func _exit_tree():
	remove_custom_type("Gatekeeper")

