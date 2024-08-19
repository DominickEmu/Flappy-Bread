extends CharacterBody2D

@onready var points_gui = get_tree().get_first_node_in_group("points_gui");
@onready var cam = get_tree().get_first_node_in_group("camera");
@onready var title_instruct = get_tree().get_first_node_in_group("instruct");
@onready var gameover_gui = get_tree().get_first_node_in_group("gameover");

# this could probably be optimized with enums but meh
var game : bool = false;
var dead : bool = false;
var jforce = 300;
var grav : int = 1100;

var rot = Vector2(500,0);

@onready var flap_sfx = $flapSfx;
@onready var hit_sfx = $hitSfx;
@onready var thud_sfx = $thudSfx;

func _physics_process(delta):
	if game: 
		# apply newton's funny bullshit
		velocity.y += grav*delta;
		
		# birdy flaps prop to jforce
		if Input.is_action_just_pressed("flap") and not dead:
			velocity.y = -jforce;
			flap_sfx.play();
		
		move_and_slide();
		
		rot.y = velocity.y;
		rotation = rot.angle();
	
	elif not game and dead:
		if Input.is_action_just_pressed("restart"):
			get_tree().reload_current_scene();
	
	elif not game and not dead:
		velocity.y = 0;
		
		# starts game
		if Input.is_action_just_pressed("flap"):
			game = true;
			title_instruct.visible = false;

func pipe_collide():
	if not dead:
		velocity.y = -jforce;
		dead = true;
		cam.shake(0.25,2.5);
		hit_sfx.play();

func ground_collide():
	game = false;
	dead = true;
	thud_sfx.play();
	
	gameover_gui.visible = true;
