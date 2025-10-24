@tool
class_name RobotExpression extends Resource


@export_group("Arms")
@export_range(-120, 190, 1) var leftArmRotation = 0 :
	set(new):
		leftArmRotation = new
		emit_changed()
@export_range(-120, 190, 1) var rightArmRotation = 0 :
	set(new): 
		rightArmRotation = new
		emit_changed()

@export_group("Head")
@export_range(-40, 50, 1) var headXRotation = 0 :
	set(new): 
		headXRotation = new
		emit_changed()
@export_range(-85, 85, 1) var headYRotation = 0 :
	set(new): 
		headYRotation = new
		emit_changed()
@export_range(-50, 50, 1) var headZRotation = 0 :
	set(new): 
		headZRotation = new
		emit_changed()


@export_group("Face")
@export_enum(
	"default",
	"angled-top", 
	"closed-down", 
	"closed-flat", 
	"closed-up", 
	"exclamation-marks", 
	"hearts", 
	"open-big-pupils", 
	"open-small-pupils", 
	"squinting", 
	"squished-by-cheeks", 
	"wide-big-pupils", 
	"wide-small-pupils"
) var eyes: String = "default" :
	set(new): 
		eyes = new
		emit_changed()

@export_enum(
	"default",
	"big-smile-closed",
	"big-smile-open",
	"small-smile",
	"frown-closed",
	"frown-open",
	"grimace",
	"grin",
	"circle",
	"oval",
	"cry-closed",
	"cry-open"
) var mouth: String = "default" : 
	set(new): 
		mouth = new
		emit_changed()

@export_enum(
	"default",
	"arched",
	"down",
	"flat",
	"slanted",
	"furrowed"
) var brows: String = "default" : 
	set(new): 
		brows = new
		emit_changed()

@export_enum(
	"none",
	"tears",
	"exclamation-mark",
	"forehead-vein"
) var extras: String = "none" : 
	set(new): 
		extras = new
		emit_changed()