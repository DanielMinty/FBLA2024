extends Control


func _draw() -> void:
	# Getting window size
	var window_size: Vector2i = get_window().size
	var window_size_x = window_size.x
	var window_size_y = window_size.y
	
	# Defining colors, green for up, red for down
	var green: Color = Color.LAWN_GREEN
	var red: Color = Color.RED
	
	# Stock variables
	var stock_price_last_20_days: Array[float] = Globals.stock_price_last_20_days
	const initial_stock_price = Globals.initial_stock_price
	
	# Drawing borders of stock window
	var top_x: int = 40
	var top_y: int = 100
	var bottom_x: int = window_size_x - top_x * 2
	var bottom_y: int = window_size_y - top_y * 2 + 50
	var top_right: Vector2 = Vector2(top_x, top_y)
	var bottom_left: Vector2 = Vector2(bottom_x, bottom_y)
	var graph_outline: Rect2 = Rect2(top_right, bottom_left)
	draw_rect(graph_outline, Color(1, 1, 1, 1), false, 10)
	
	# drawing stock lines
	var middle_y = top_y + graph_outline.size.y / 2
	var current_stock_position: Vector2 = Vector2(top_x, middle_y) 
	var current_stock_price: float = Globals.stock_price
	
	var lines: PackedVector2Array = PackedVector2Array()
	var colors: PackedColorArray = PackedColorArray()
	# to make sure line doesn't go out of screen
	var max_change_y: float = graph_outline.end.y / 35

	var previous_stock_price: float 
	for i in stock_price_last_20_days:
		previous_stock_price = current_stock_price
		current_stock_price -= i
		
		var percent_change: float = current_stock_price / previous_stock_price
		var previous_stock_position: Vector2 = current_stock_position
		
		var stock_change_y: float = current_stock_position.y - current_stock_position.y * percent_change
		var y: float = current_stock_position.y
		current_stock_position.y = clampf(y + stock_change_y, y - max_change_y, y + max_change_y)
		current_stock_position.x += (bottom_x - top_x) / 19

		lines.append_array(PackedVector2Array([Vector2(previous_stock_position), Vector2(current_stock_position)]))
		
		var current_stock_line_color: Color
		if current_stock_position.y >= previous_stock_position.y:
			current_stock_line_color = red
		else:
			current_stock_line_color = green
		colors.append(current_stock_line_color)
		colors.append(current_stock_line_color)
	draw_polyline_colors(lines, colors, 10)
	
	$"Stock Price".text += "Starting price: $%s\n" % snapped(Globals.stock_price, 0.01)
	Globals.stock_price = current_stock_price
	$"Stock Price".text += "Current Share Price: $%s\n" % str(snapped(current_stock_price, 0.01))
	$"Stock Price".text += "Total Percent Change: %s" % str(snapped((current_stock_price - initial_stock_price) / initial_stock_price, 0.01)) + "%"



