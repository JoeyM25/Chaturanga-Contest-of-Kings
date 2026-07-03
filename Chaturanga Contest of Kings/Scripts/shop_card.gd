extends Control

# The ShopItem resource representing this card. Assigning a resource updates the UI.
@export var item: ShopItem:
	set(new_item):
		item = new_item
		if is_node_ready():
			update_card_ui()

@onready var label: Label = $VBoxContainer/Label
@onready var icon: TextureRect = $VBoxContainer/Icon
@onready var price: Label = $VBoxContainer/Price
@onready var description_label: Label = $"VBoxContainer/????"
@onready var buy_button: Button = $VBoxContainer/BuyButton

func _ready() -> void:
	# Connect the buy button click event
	buy_button.pressed.connect(self.purchase_item)
	update_card_ui()

# Updates the text labels and sprite icon from the assigned resource
func update_card_ui() -> void:
	if item == null:
		return
	
	label.text = item.name
	icon.texture = item.icon
	price.text = "$" + str(item.value)
	description_label.text = item.description

# Checks player balance, deducts money, and records the item in the global GameState
func purchase_item() -> void:
	if item == null:
		return
	
	if GameState.cash >= item.value:
		GameState.spend_cash(item.value)
		GameState.owned_upgrades.append(item)
		
		# Find the shop manager in the tree and trigger a UI update to reflect the new cash balance
		var shop_scene = get_parent_shop()
		if shop_scene:
			shop_scene.update_display()
			
		# Remove the card from the shop shelf upon purchase
		queue_free()
	else:
		print("Not enough cash!")

# Traverses parents to find the root Shop screen to call update_display
func get_parent_shop() -> Control:
	var current = get_parent()
	while current != null:
		if current.has_method("update_display"):
			return current
		current = current.get_parent()
	return null
