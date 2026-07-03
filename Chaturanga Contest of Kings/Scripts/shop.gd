extends Control

# Preload the card template scene for shop items
const SHOP_CARD_SCENE = preload("res://Scenes/shop_card.tscn")

# Arrays to configure available items for each section in the Inspector
@export var available_pieces: Array[ShopItem] = []
@export var available_fate_cards: Array[ShopItem] = []
@export var available_tombs: Array[ShopItem] = []
@export var available_cell_modifiers: Array[ShopItem] = []

@onready var label: Label = $Cash
@onready var pieces_container: HBoxContainer = $GridContainer/Pieces
@onready var fate_cards_container: HBoxContainer = $"GridContainer/Fate Cards"
@onready var tombs_container: HBoxContainer = $GridContainer/Tombs
@onready var cell_modifiers_container: HBoxContainer = $"GridContainer/Cell Modifiers"

func _ready() -> void:
	update_display()
	populate_shop()

# Updates the cash display label
func update_display() -> void:
	label.text = "Cash $" + str(GameState.cash)

# Populates all shop shelves with items configured in the editor
func populate_shop() -> void:
	clear_container(pieces_container)
	clear_container(fate_cards_container)
	clear_container(tombs_container)
	clear_container(cell_modifiers_container)
	
	# Instantiate and set up cards for each category
	for item in available_pieces:
		instantiate_card(item, pieces_container)
		
	for item in available_fate_cards:
		instantiate_card(item, fate_cards_container)
		
	for item in available_tombs:
		instantiate_card(item, tombs_container)
		
	for item in available_cell_modifiers:
		instantiate_card(item, cell_modifiers_container)

# Clears existing cards from a container shelf
func clear_container(container: HBoxContainer) -> void:
	for child in container.get_children():
		child.queue_free()

# Helper to create a shop card and assign its ShopItem resource
func instantiate_card(item_resource: ShopItem, container: HBoxContainer) -> void:
	var card = SHOP_CARD_SCENE.instantiate()
	container.add_child(card)
	card.item = item_resource

func _on_next_btn_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_reroll_btn_pressed() -> void:
	# Add custom reroll cost check and logic here later if desired!
	pass
