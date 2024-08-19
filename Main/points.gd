extends Label

var points : int;

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_text();

func inc_points():
	points += 1;
	text = str(points);

func reset_text():
	points = 0;
	text = str(points);
