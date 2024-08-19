extends Node2D

@onready var spawn_timer = $spawnTimer;
@onready var pipe = preload("res://Pipes/pipes.tscn");
@onready var birb = get_tree().get_first_node_in_group("birb");
@onready var ground = get_tree().get_first_node_in_group("ground");

@onready var spacing_len = get_viewport_rect().size.x/2; 

func _ready():
	spawn_timer.wait_time = spacing_len/ground.speed;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if birb.game and spawn_timer.is_stopped():
		spawn_timer.start();
	elif not birb.game:
		spawn_timer.stop();

func _spawn_pipe():
	var pipe_inst = pipe.instantiate();
	pipe_inst.global_position = Vector2(get_viewport_rect().size.x, randf_range(-260,-30));
	add_child(pipe_inst);
	print("added piped")
