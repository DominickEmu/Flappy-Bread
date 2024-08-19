extends ParallaxBackground

@export var speed : float = 2;
var offset_scroll = 0;

@onready var birb = get_tree().get_first_node_in_group("birb");

func _ready():
	offset_scroll 

func _process(delta):
	if birb.game:
		offset_scroll += speed*delta;
		set_scroll_base_offset(Vector2(-offset_scroll,0));
