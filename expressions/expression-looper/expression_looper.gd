# Note: for now we aren't showing extras combinations to reduce the total number of expressions 
# since they are tied to specific emotions already
extends Node3D

const MAX_EXPRESSIONS: int = 50

# Model
@onready var Robot: RobotType = $Robot

# Labels
@onready var EyesLabel: Label = %EyesLabel
@onready var BrowsLabel: Label = %BrowsLabel
@onready var MouthLabel: Label = %MouthLabel
@onready var ExtrasLabel: Label = %ExtrasLabel
@onready var TotalLabel: Label = %TotalLabel

# Track the expressions
var expressions: Array[RobotExpression] = []
var expressionIndex: int = 0
var totalExpressions: int = 0

func _ready():
    # Get all possible cues from the robot's sprites
    var eyeCues = Robot.EyesSprite.sprite_frames.get_animation_names()
    var browCues = Robot.BrowsSprite.sprite_frames.get_animation_names()
    var mouthCues = Robot.MouthSprite.sprite_frames.get_animation_names()
    # var extrasCues = Robot.ExtrasSprite.sprite_frames.get_animation_names()
    
    # The default expression is always first, so we don't add it to avoid repetition
    eyeCues.erase("default")
    browCues.erase("default")
    mouthCues.erase("default")
    # extrasCues.erase("none")

    # Generate all combinations of expressions
    for eye in eyeCues:
        for brow in browCues:
            for mouth in mouthCues:
                # for extras in extrasCues:
                    var expr = RobotExpression.new()
                    expr.eyes = eye
                    expr.brows = brow
                    expr.mouth = mouth
                    # expr.extras = extras
                    expressions.append(expr)
    
    # Randomize the order of expressions
    expressions.shuffle()
    # Re-add the default expression at the start
    expressions.insert(0, RobotExpression.new())
    # Limit to MAX_EXPRESSIONS
    expressions = expressions.slice(0, MAX_EXPRESSIONS)
    totalExpressions = expressions.size()

    # Update the model and labels
    update_labels()

func update_labels():
    EyesLabel.text = "Eyes: %s" % [Robot.expression.eyes]
    BrowsLabel.text = "Brows: %s" % [Robot.expression.brows]
    MouthLabel.text = "Mouth: %s" % [Robot.expression.mouth]
    # ExtrasLabel.text = "Extras: %s" % [Robot.expression.extras]
    TotalLabel.text = "Total: %d/%d" % [expressionIndex, totalExpressions]

func update_robot():
    Robot.expression = expressions[expressionIndex]

func _on_NextButton_pressed():
    expressionIndex = min(expressionIndex + 1, totalExpressions - 1)
    update_labels()
    update_robot()

func _on_PrevButton_pressed():
    expressionIndex = max(expressionIndex - 1, 0)
    update_labels()
    update_robot()