extends Camera2D

var shake_amount : float = 0;
var def_offset : Vector2 = offset;
var xPos : int; var yPos : int;

@onready var timer : Timer = $Timer;

func _ready():
	set_process(true);
	randomize();

func _process(_delta):
	offset = Vector2(randf_range(-1,1)*shake_amount, randf_range(-1,1)*shake_amount);

func shake(time: float, amount: float):
	timer.wait_time = time;
	shake_amount = amount;
	set_process(true);
	timer.start();

func _on_timer_timeout() -> void:
	set_process(false);
	var tween : Tween = create_tween();
	tween.tween_property(self, "offset", Vector2(0, 0), 0.1).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN);
	tween.play();
