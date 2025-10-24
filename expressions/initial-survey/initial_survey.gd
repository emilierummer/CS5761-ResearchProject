extends Node3D

signal choice_made

@onready var Robot: RobotType = $ExpressionLooper/Robot

var fileName: String
var file: FileAccess
# Full path on MacOS: "Library/Application Support/Godot/app_userdata/HRI-Robot-Model"

func _ready():
    # Set up csv file
    var fileNum = 1
    while FileAccess.file_exists("user://initial_survey_" + str(fileNum) + ".csv"):
        fileNum += 1
    fileName = "user://initial_survey_" + str(fileNum) + ".csv"
    print("Survey response in: " + OS.get_user_data_dir() + "/initial_survey_" + str(fileNum) + ".csv")
    
    file = FileAccess.open(fileName, FileAccess.WRITE)
    file.store_line("Eyes,Brows,Mouth,Extras,Emotion")
    file.flush()

func write_response(expression: RobotExpression, emotion: String):
    file.store_line("%s,%s,%s,%s,%s" % [expression.eyes, expression.brows, expression.mouth, expression.extras, emotion])
    file.flush()


func _on_joy_button_pressed():
    write_response(Robot.expression, "joy")
    choice_made.emit()

func _on_surprise_button_pressed():
    write_response(Robot.expression, "surprise")
    choice_made.emit()

func _on_sadness_button_pressed():
    write_response(Robot.expression, "sadness")
    choice_made.emit()

func _on_anger_button_pressed():
    write_response(Robot.expression, "anger")
    choice_made.emit()

func _on_fear_button_pressed():
    write_response(Robot.expression, "fear")
    choice_made.emit()

func _on_love_button_pressed():
    write_response(Robot.expression, "love")
    choice_made.emit()

func _on_unknown_button_pressed():
    write_response(Robot.expression, "")
    choice_made.emit()