extends Sprite2D

const BOARD_SIZE = 8
const CELL_WIDTH = 18

const BLACK_KING = preload("res://Assets/black_king.png")
const BLACK_KNIGHT = preload("res://Assets/black_knight.png")
const BLACK_PAWN = preload("res://Assets/black_pawn.png")
const BLACK_QUEEN = preload("res://Assets/black_queen.png")
const BLACK_ROOK = preload("res://Assets/black_rook.png")
const BLACK_BISHOP = preload("res://Assets/black_bishop.png")

const WHITE_BISHOP = preload("res://Assets/white_bishop.png")
const WHITE_KNIGHT = preload("res://Assets/white_knight.png")
const WHITE_PAWN = preload("res://Assets/white_pawn.png")
const WHITE_QUEEN = preload("res://Assets/white_queen.png")
const WHITE_ROOK = preload("res://Assets/white_rook.png")
const WHITE_KING = preload("res://Assets/white_king.png")

const TURN_WHITE = preload("res://Assets/turn-white.png")
const TURN_BLACK = preload("res://Assets/turn-black.png")

@onready var pieces: Node2D = $Pieces
@onready var dots: Node2D = $Dots
@onready var turn: Sprite2D = $Turn

# Negative numbers = black
# Positive = white
# 0 = Empty space
# 1 = pawn, 2 = knight, 3 = bishop, 4 = rook, 5 = queen, 6 = king

var board : Array
var white : bool
var state : bool
var moves = []
var selected_piece : Vector2

func _ready() -> void:
	board.append([4, 2, 3, 5, 6, 3, 2, 4])
	board.append([1, 1, 1, 1, 1, 1, 1, 1])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([0, 0, 0, 0, 0, 0, 0, 0])
	board.append([-1, -1, -1, -1, -1, -1, -1, -1])
	board.append([-4, -2, -3, -5, -6, -3, -2, -4])
	
	display_board()
	
func display_board()
