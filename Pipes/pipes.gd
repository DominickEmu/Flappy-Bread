extends Node2D

@onready var ground = get_tree().get_first_node_in_group("ground");
@onready var birb = get_tree().get_first_node_in_group("birb");
@onready var points_gui = get_tree().get_first_node_in_group("points_gui");

@onready var sprite = $BottomPipe;
@onready var point_sfx = $PointSound;

var velocity : Vector2;

func _ready():
	velocity = Vector2(-ground.speed,0);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if birb.game:
		global_position += velocity*delta;
		
		if global_position.x < -sprite.texture.get_width():
			queue_free();

func _on_collision_body_entered(body):
	if body == birb:
		birb.pipe_collide();

func _on_score_body_entered(body):
	if body == birb and not birb.dead:
		points_gui.inc_points();
		point_sfx.play();
