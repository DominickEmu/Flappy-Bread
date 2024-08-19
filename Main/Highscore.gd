extends Node2D

var highscore = 0;
const SAVE_FILE_PATH = "user://savedata.save"

@onready var points_gui = $Points;
@onready var gameover = $GameOverGUI/Highscore
@onready var birb = $Bird;

func _ready():
	load_highscore();

func _process(_delta):
	if birb.dead:
		if points_gui.points > highscore:
			highscore = points_gui.points;
			save_highscore();
		
		gameover.text = str(highscore);
		set_process(false);

func save_highscore():
	var save_data = FileAccess.open(SAVE_FILE_PATH, FileAccess.WRITE);
	save_data.store_var(highscore);
	save_data.close();

func load_highscore():
	if FileAccess.file_exists(SAVE_FILE_PATH):
		var save_data = FileAccess.open(SAVE_FILE_PATH, FileAccess.READ);
		highscore = save_data.get_var();
		save_data.close();
