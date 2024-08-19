extends Area2D

@onready var birb = get_tree().get_first_node_in_group("birb");

func _on_body_entered(body):
	if body == birb:
		birb.ground_collide();
	
