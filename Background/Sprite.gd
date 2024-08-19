extends Sprite2D

@onready var day_sprite = $day;

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize();
	
	var randint = floor(randf_range(0,3));
	if randint > 1:
		day_sprite.visible = false;
