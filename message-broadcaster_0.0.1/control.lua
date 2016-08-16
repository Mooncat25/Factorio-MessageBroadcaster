-- Defines. Mostly GUI element names.
local gui_names = {}
gui_names.settings_container = "message-broadcaster.settings_container"

gui_names.settings_subcontainer_right = "message-broadcaster.settings_subcontainer_right"

gui_names.settings_frame = "message-broadcaster.settings_frame"

gui_names.settings_current_frame = "message-broadcaster.settings_current_frame"
gui_names.settings_current_table = "message-broadcaster.settings_current_table"
gui_names.settings_current_message_label = "message-broadcaster.settings_current_message_label"
gui_names.settings_current_color_container = "message-broadcaster.settings_current_color_container"
gui_names.settings_current_color_label = "message-broadcaster.settings_current_color_label"
gui_names.settings_current_color_value_label = "message-broadcaster.settings_current_color_value_label"
gui_names.settings_current_target_force_label = "message-broadcaster.settings_current_target_force_label"
gui_names.settings_current_target_distance_label = "message-broadcaster.settings_current_target_distance_label"
gui_names.settings_current_method_label = "message-broadcaster.settings_current_method_label"

gui_names.settings_message_label_container = "message-broadcaster.settings_message_label_container"
gui_names.settings_message_label = "message-broadcaster.settings_message_label"
gui_names.settings_message_hint_button = "message-broadcaster.settings_message_hint_button"
gui_names.settings_message_textfield = "message-broadcaster.settings_message_textfield"
gui_names.settings_message_color_container = "message-broadcaster.settings_message_color_container"
gui_names.settings_message_color_label = "message-broadcaster.settings_message_color_label"
gui_names.settings_message_color_value_label = "message-broadcaster.settings_message_color_value_label"
gui_names.settings_message_pick_color_button = "message-broadcaster.settings_message_pick_color_button"

gui_names.settings_target_and_method_container = "message-broadcaster.settings_target_and_method_container"
gui_names.settings_target_container = "message-broadcaster.settings_target_container"

gui_names.settings_target_force_label = "message-broadcaster.settings_target_force_label"
gui_names.settings_target_force_table = "message-broadcaster.settings_target_force_table"
gui_names.settings_target_same_force_checkbox = "message-broadcaster.settings_target_same_force_checkbox"
gui_names.settings_target_all_forces_checkbox = "message-broadcaster.settings_target_all_forces_checkbox"

gui_names.settings_target_distance_label = "message-broadcaster.settings_target_distance_label"
gui_names.settings_target_distance_table = "message-broadcaster.settings_target_distance_table"
gui_names.settings_target_players_nearby_checkbox = "message-broadcaster.settings_target_players_nearby_checkbox"
gui_names.settings_target_same_surface_checkbox = "message-broadcaster.settings_target_same_surface_checkbox"
gui_names.settings_target_all_players_checkbox = "message-broadcaster.settings_target_all_players_checkbox"

gui_names.settings_method_container = "message-broadcaster.settings_method_container"
gui_names.settings_method_table = "message-broadcaster.settings_method_table"
gui_names.settings_method_console_checkbox = "message-broadcaster.settings_method_console_checkbox"
gui_names.settings_method_flying_text_checkbox = "message-broadcaster.settings_method_flying_text_checkbox"
gui_names.settings_method_popup_checkbox = "message-broadcaster.settings_method_popup_checkbox"

gui_names.settings_apply_and_reload_container = "message-broadcaster.settings_apply_and_reload_container"
gui_names.settings_apply_button = "message-broadcaster.settings_apply_button"
gui_names.settings_apply_and_reload_left_space = "message-broadcaster.settings_apply_and_reload_left_space"
gui_names.settings_reload_button = "message-broadcaster.settings_reload_button"

gui_names.message_hint_container = "message-broadcaster_message-hint-container"
gui_names.message_hint_frame = "message-broadcaster_message-hint-frame"
gui_names.message_hint_table = "message-broadcaster_message-hint-table"
gui_names.message_hint_labels_prefix = "message-broadcaster_message-hint-label-"
gui_names.color_picker_container = "message-broadcaster_color-picker"

gui_names.received_message_popup_frame = "message-broadcaster_received-message-popup-frame"
gui_names.received_message_popup_table = "message-broadcaster_received-message-popup-table"
gui_names.received_message_popup_inner_frame_prefix = "message-broadcaster_received-message-popup-inner-frame-"
gui_names.received_message_popup_label = "message-broadcaster_received-message-popup-label"
gui_names.received_message_popup_button_container = "message-broadcaster_received-message-popup-button-container"
gui_names.received_message_popup_button_space = "message-broadcaster_received-message-popup-button-space"
gui_names.received_message_popup_button = "message-broadcaster_received-message-popup-button"

-- Captions.
local gui_captions = {}

gui_captions.target_forces = {}
table.insert(gui_captions.target_forces, {"gui.message-broadcaster_same-force"})
table.insert(gui_captions.target_forces, {"gui.message-broadcaster_all-force"})

gui_captions.target_distances = {}
table.insert(gui_captions.target_distances, {"gui.message-broadcaster_players-nearby"})
table.insert(gui_captions.target_distances, {"gui.message-broadcaster_players-on-same-surface"})
table.insert(gui_captions.target_distances, {"gui.message-broadcaster_all-players"})

gui_captions.methods = {}
table.insert(gui_captions.methods, {"gui.message-broadcaster_console"})
table.insert(gui_captions.methods, {"gui.message-broadcaster_flying-text"})
table.insert(gui_captions.methods, {"gui.message-broadcaster_popup"})

-- Our custom entity's name.
-- TODO: change it.
local entity_name = "small-lamp"
-- How many tiles does "Nearby" means in the target settings.
-- TODO: change it if needed.
local nearby_tiles = 1000
-- Maximum number of popup messages a player can stack.
local max_popup_message = 5

-- Converts the given color, e.g. {r = 1, g = 1, b = 1}, into printable string, e.g. (255, 255, 255).
function get_string_for_color(color)
	local color_r, color_g, color_b
	if color.r then
		color_r = color.r * 255
	else
		color_r = 0
	end
	if color.g then
		color_g = color.g * 255
	else
		color_g = 0
	end
	if color.b then
		color_b = color.b * 255
	else
		color_b = 0
	end
	return "(" .. color_r .. ", " .. color_g .. ", " .. color_b .. ")"
end

-- Converts the given color string, e.g. (255, 255, 255), into color, e,g, {r = 1, g = 1, b = 1}
function get_color_from_string(str)
	local r, g, b = string.match(str, "(%d+), (%d+), (%d+)")
	r = tonumber(r) / 255
	g = tonumber(g) / 255
	b = tonumber(b) / 255
	return {r = r, g = g, b = b}
end



-- Initialization.
script.on_init(function(event)
	-- Initialize metatable for saving data in global.
	if not global.message_broadcaster then global.message_broadcaster = {} end
	if not global.message_broadcaster.players then global.message_broadcaster.players = {} end
	if not global.message_broadcaster.broadcaster_datas then global.message_broadcaster.broadcaster_datas = {} end
end)

-- Ticking. Mainly for opening or closing the custom GUI.
script.on_event(defines.events.on_tick,	function(event)
	for index, player in pairs(game.players) do
		if player.opened ~= nil and player.opened.valid then
			if player.opened.name == entity_name then
				-- The player is opening the GUI of a small lamp.
				if not global.message_broadcaster.players[index] then
					-- Our custom GUI has not been opened yet, open it now.
					open_message_broadcaster_gui_for_player(player, player.opened)
				end
			else
				-- The player is not opening the GUI of a small lamp.
				if global.message_broadcaster.players[index] then
					-- But our custom GUI is being opened. Close it now.
					close_message_broadcaster_gui_for_player(player)
				end
			end
		else
			-- Not opening anything. Close the custom GUI if it has been opened.
			close_message_broadcaster_gui_for_player(player)
		end
	end
	
	-- Remove invalid data.
	for index, data in ipairs(global.message_broadcaster.broadcaster_datas) do
		if not data.entity.valid then
			table.remove(global.message_broadcaster.broadcaster_datas, index)
		end
	end
end)

-- GUI click.
script.on_event(defines.events.on_gui_click, function(event)
	local element = event.element
	local player = game.players[event.player_index]
	local settings_container = player.gui.left[gui_names.settings_container]
	
	-- Show message hint button.
	if element.name == gui_names.settings_message_hint_button then
		-- If no hint box exists, add one. Also destroy the color picker if it exists.
		if settings_container[gui_names.color_picker_container] then
			settings_container[gui_names.color_picker_container].destroy()
		end
		if settings_container[gui_names.message_hint_container] then
			settings_container[gui_names.message_hint_container].destroy()
		else
			show_message_hint(settings_container)
		end
		return
	end
	
	-- Pick color button.
	if element.name == gui_names.settings_message_pick_color_button then
		-- If no color picker exists, add one. Also destroy the hint box if it exists.
		if settings_container[gui_names.message_hint_container] then
			settings_container[gui_names.message_hint_container].destroy()
		end
		if settings_container[gui_names.color_picker_container] then
			settings_container[gui_names.color_picker_container].destroy()
		else
			local message_color_container = element.parent
			local message_color_value_label = message_color_container[gui_names.settings_message_color_value_label]
			local color = get_color_from_string(message_color_value_label.caption)
			remote.call("color-picker", "add_instance",
			{
				parent = settings_container,
				container_name = gui_names.color_picker_container,
				title_caption = {"gui.message-broadcaster_set_message_color"},
				color = color
			})
		end
		return
	end
	
	-- Reload button.
	if element.name == gui_names.settings_reload_button then
		reload_message_broadcaster_gui_for_player(player)
		return
	end
	
	-- Apply button.
	if element.name == gui_names.settings_apply_button then
		local target_entity = global.message_broadcaster.players[event.player_index]
		-- Load the new settings from the GUI.
		local new_message, new_color, new_target_force, new_target_distance, new_method
		
		local subcontainer_right = settings_container[gui_names.settings_subcontainer_right]
		local frame = subcontainer_right[gui_names.settings_frame]
		
		-- Message.
		new_message = frame[gui_names.settings_message_textfield].text
		
		-- Message color.
		local message_color_container = frame[gui_names.settings_message_color_container]
		local color_value_label = message_color_container[gui_names.settings_message_color_value_label]
		new_color = get_color_from_string(color_value_label.caption)
		
		-- Target and method container.
		local target_and_method_container = subcontainer_right[gui_names.settings_target_and_method_container]
		
		-- Target container.
		local target_container = target_and_method_container[gui_names.settings_target_container]
		
		-- Target - Force
		local force_table = target_container[gui_names.settings_target_force_table]
		if force_table[gui_names.settings_target_same_force_checkbox].state then
			new_target_force = 1
		else
			new_target_force = 2
		end
		
		-- Target - Distance
		local distance_table = target_container[gui_names.settings_target_distance_table]
		if distance_table[gui_names.settings_target_players_nearby_checkbox].state then
			new_target_distance = 1
		elseif distance_table[gui_names.settings_target_same_surface_checkbox].state then
			new_target_distance = 2
		else
			new_target_distance = 3
		end
		
		-- Method.
		local method_container = target_and_method_container[gui_names.settings_method_container]
		local method_table = method_container[gui_names.settings_method_table]
		if method_table[gui_names.settings_method_console_checkbox].state then
			new_method = 1
		elseif method_table[gui_names.settings_method_flying_text_checkbox].state then
			new_method = 2
		else
			new_method = 3
		end
		
		-- Apply!
		save_settings_to_entity(target_entity, new_message, new_color, new_target_force, new_target_distance, new_method)
				
		-- Also update the UIs for players who are opening the same entity.
		for index, entity in pairs(global.message_broadcaster.players) do
			if global.message_broadcaster.players[index] == target_entity then
				update_current_message_settings_for_player(game.players[index])
			end
		end
		
		
		-- TODO: remove the following part. It is for testing only.
		-- Broadcast the message for testing.
		broadcast_message_from_entity(target_entity)
		return
	end
	
	-- OK button on the message popup.
	if element.name == gui_names.received_message_popup_button then
		-- button -> button_container -> inner_frame
		local inner_frame = element.parent.parent
		-- inner_frame -> message_table -> popup frame
		local message_table = inner_frame.parent
		local popup_frame = message_table.parent
		
		-- Dismiss the message by destroying the inner frame.
		inner_frame.destroy()
		-- If no more message is in the message table, destroy the whole popup.
		if #message_table.children_names <= 0 then
			popup_frame.destroy()
		end
		
		return
	end
end)

-- Checked state changed.
script.on_event(defines.events.on_gui_checked_state_changed, function(event)
	local element = event.element
	
	-- Target - Force
	-- Same force.
	if element.name == gui_names.settings_target_same_force_checkbox then
		if element.state then
			-- It becomes true now, turn "all forces" to false.
			local force_table = element.parent
			force_table[gui_names.settings_target_all_forces_checkbox].state = false
		else
			-- It becomes false now. But it should act like a radio button. It shouldn't be set from true to false. So, set it back to true.
			element.state = true
		end
		return
	end
	-- All forces.
	if element.name == gui_names.settings_target_all_forces_checkbox then
		if element.state then
			local force_table = element.parent
			force_table[gui_names.settings_target_same_force_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	
	-- Target - Distance
	-- Players nearby.
	if element.name == gui_names.settings_target_players_nearby_checkbox then
		if element.state then
			local distance_table = element.parent
			distance_table[gui_names.settings_target_same_surface_checkbox].state = false
			distance_table[gui_names.settings_target_all_players_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	-- Players on the same surface.
	if element.name == gui_names.settings_target_same_surface_checkbox then
		if element.state then
			local distance_table = element.parent
			distance_table[gui_names.settings_target_players_nearby_checkbox].state = false
			distance_table[gui_names.settings_target_all_players_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	-- All players.
	if element.name == gui_names.settings_target_all_players_checkbox then
		if element.state then
			local distance_table = element.parent
			distance_table[gui_names.settings_target_players_nearby_checkbox].state = false
			distance_table[gui_names.settings_target_same_surface_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	
	-- Methods.
	-- Console.
	if element.name == gui_names.settings_method_console_checkbox then
		if element.state then
			local method_table = element.parent
			method_table[gui_names.settings_method_flying_text_checkbox].state = false
			method_table[gui_names.settings_method_popup_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	-- Flying text.
	if element.name == gui_names.settings_method_flying_text_checkbox then
		if element.state then
			local method_table = element.parent
			method_table[gui_names.settings_method_console_checkbox].state = false
			method_table[gui_names.settings_method_popup_checkbox].state = false
		else
			element.state = true
		end
		return
	end
	-- Popup.
	if element.name == gui_names.settings_method_popup_checkbox then
		if element.state then
			local method_table = element.parent
			method_table[gui_names.settings_method_console_checkbox].state = false
			method_table[gui_names.settings_method_flying_text_checkbox].state = false
		else
			element.state = true
		end
		return
	end
end)

-- Register the built entity if it is our custom entity.
function on_built_entity(event)
	local entity = event.created_entity
	
	if entity.name == entity_name then
		-- TODO: change the data structure if needed.
		table.insert(global.message_broadcaster.broadcaster_datas,
		{
			entity = entity,
			message = "",
			color = {r = 1, g = 1, b = 1},
			target_force = 1,		-- 1: Same force only, 2: All force
			target_distance = 3,	-- 1: Nearby, 2: Same surface, 3: All players
			method = 1				-- 1: Console, 2: Flying text, 3: Popup
		})
	end
end
script.on_event(defines.events.on_built_entity, on_built_entity)
script.on_event(defines.events.on_robot_built_entity, on_built_entity)

-- Color picker color updated.
script.on_event(remote.call("color-picker", "on_color_updated"), function(event)
	if event.container.name == gui_names.color_picker_container then
		-- Update color.
		local settings_container = event.container.parent
		if settings_container and settings_container.name == gui_names.settings_container then
			local subcontainer_right = settings_container[gui_names.settings_subcontainer_right]
			if subcontainer_right then
				local frame = subcontainer_right[gui_names.settings_frame]
				if frame then
					local message_color_container = frame[gui_names.settings_message_color_container]
					if message_color_container then
						local message_color_value_label = message_color_container[gui_names.settings_message_color_value_label]
						if message_color_value_label then
							local r, g, b = event.color.r * 255, event.color.g * 255, event.color.b * 255
							message_color_value_label.caption = "(" .. r .. ", " .. g .. ", " .. b .. ")"
							message_color_value_label.style.font_color = event.color
						end
					end
				end
			end
		end
	end
end)

-- Shows the message hint box under the given container.
function show_message_hint(main_container)
	-- TODO: change the hints if needed. Localize them.
	local hints =
	{
		"$A = first signal name",
		"$B = second signal name",
		"$C = comparitor (<, =, >)",
		"$T = play time",
		"$D = in-game day time",
		"$E = evolution factor",
		"$P = pollution near this entity",
		"$L = location of this entity",
		"$S = game speed",
		"$R = current research progress",
	}
	
	main_container.add({type = "flow", name = gui_names.message_hint_container, direction = "vertical"})
	local message_hint_container = main_container[gui_names.message_hint_container]
	
	message_hint_container.add({type = "frame", name = gui_names.message_hint_frame, direction = "vertical", caption = {"gui.message-broadcaster_hints-title"}})
	local frame = message_hint_container[gui_names.message_hint_frame]
	
	frame.add({type = "table", name = gui_names.message_hint_table, colspan = 1})
	local hint_table = frame[gui_names.message_hint_table]
	
	for index, hint in pairs(hints) do
		hint_table.add({type = "label", name = gui_names.message_hint_labels_prefix .. index, caption = hint})
	end
end

-- Returns the current message settings from the given entity.
function load_current_settings_from_entity(entity)
	-- TODO: change the following lines if needed.
	for _, data in ipairs(global.message_broadcaster.broadcaster_datas) do
		if data.entity == entity then
			local current_message = data.message
			local current_color = data.color
			local current_target_force = data.target_force
			local current_target_distance = data.target_distance
			local current_method = data.method
			return current_message, current_color, current_target_force, current_target_distance, current_method
		end
	end
	-- Data not found.
	return nil, nil, nil, nil, nil
end

-- Saves the given settings to the entity.
function save_settings_to_entity(entity, message, color, target_force, target_distance, method)
	-- TODO: change the following lines if needed.
	for _, data in ipairs(global.message_broadcaster.broadcaster_datas) do
		if data.entity == entity then
			data.message = message
			data.color = color
			data.target_force = target_force
			data.target_distance = target_distance
			data.method = method
		end
	end
end

-- Opens our custom GUI for the given player targeting the given entity.
function open_message_broadcaster_gui_for_player(player, target_entity)
	-- Record the player so we know a custom GUI is being opened for him.
	global.message_broadcaster.players[player.index] = target_entity
	
	-- Load data from the entity.
	local current_message, current_color, current_target_force, current_target_distance, current_method = load_current_settings_from_entity(target_entity)
	
	-- Convert the color to 0 - 255 and separate the channels for display.
	local current_color_text = get_string_for_color(current_color)
	
	-- Width of the main frame.
	local main_frame_width = 500
	-- Width of the apply and reload buttons.
	local apply_and_reload_button_width = 100
	
	local left = player.gui.left
	left.add({type = "table", name = gui_names.settings_container, colspan = 2})
	local container = left[gui_names.settings_container]
	container.style.top_padding = 8
	container.style.left_padding = 8
	container.style.horizontal_spacing = 0 -- Only table can set cell spacing.
	
	container.add({type = "table", name = gui_names.settings_subcontainer_right, colspan = 1})
	local subcontainer_right = container[gui_names.settings_subcontainer_right]
	subcontainer_right.style.vertical_spacing = 0
	
	-- Add the main frame.
	subcontainer_right.add({type = "frame", name = gui_names.settings_frame, direction = "vertical", caption = {"gui.message-broadcaster_title"}})
	local frame = subcontainer_right[gui_names.settings_frame]
	frame.style.minimal_width = main_frame_width
	frame.style.maximal_width = frame.style.minimal_width
	
	-- Current frame.
	frame.add({type = "frame", name = gui_names.settings_current_frame, direction = "vertical"})
	local current_frame = frame[gui_names.settings_current_frame]
	current_frame.style.minimal_width = main_frame_width - 9 * 3
	current_frame.style.maximal_width = current_frame.style.minimal_width
	current_frame.add({type = "table", name = gui_names.settings_current_table, colspan = 1}) -- This table is needed to vertical align the labels.
	local current_table = current_frame[gui_names.settings_current_table]
	-- Current message.
	current_table.add({type = "label", name = gui_names.settings_current_message_label, caption = {"gui.message-broadcaster_current-message", current_message}})
	-- Current color.
	current_table.add({type = "flow", name = gui_names.settings_current_color_container, direction = "horizontal"})
	local current_color_container = current_table[gui_names.settings_current_color_container]
	current_color_container.add({type = "label", name = gui_names.settings_current_color_label, caption = {"gui.message-broadcaster_current-color"}})
	current_color_container.add({type = "label", name = gui_names.settings_current_color_value_label, caption = current_color_text})
	local current_color_value_label = current_color_container[gui_names.settings_current_color_value_label]
	current_color_value_label.style.font_color = current_color
	-- Current target force.
	current_table.add({type = "label", name = gui_names.settings_current_target_force_label, caption = {"gui.message-broadcaster_current-target-force", gui_captions.target_forces[current_target_force]}})
	-- Current target distance.
	current_table.add({type = "label", name = gui_names.settings_current_target_distance_label, caption = {"gui.message-broadcaster_current-target-distance", gui_captions.target_distances[current_target_distance]}})
	-- Current method.
	current_table.add({type = "label", name = gui_names.settings_current_method_label, caption = {"gui.message-broadcaster_current-method", gui_captions.methods[current_method]}})
	
	-- Set message label.
	frame.add({type = "flow", name = gui_names.settings_message_label_container, direction = "horizontal"}) -- This container is required because the hint button is causing unwanted space vertically. May
	local label_container = frame[gui_names.settings_message_label_container]
	label_container.style.maximal_height = 25 -- Limit the height
	label_container.add({type = "label", name = gui_names.settings_message_label, caption = {"gui.message-broadcaster_set-message"}})
	local set_message_label = label_container[gui_names.settings_message_label]
	set_message_label.style.minimal_width = main_frame_width - 8 * 4 - 20
	set_message_label.style.maximal_width = set_message_label.style.minimal_width
	-- Hint button.
	label_container.add({type = "button", name = gui_names.settings_message_hint_button, style = "small_message_hint_panel_button_style", tooltip = {"gui.message-broadcaster_show-hints"}})
	
	-- Set message textfield.
	frame.add({type = "textfield", name = gui_names.settings_message_textfield, text = current_message})
	local textfield = frame[gui_names.settings_message_textfield]
	textfield.style.minimal_width = main_frame_width - 13 * 2
	textfield.style.maximal_width = textfield.style.minimal_width
	
	-- Message color.
	frame.add({type = "flow", name = gui_names.settings_message_color_container, direction = "horizontal"}) -- Same as above, this container is required.
	local message_color_container = frame[gui_names.settings_message_color_container]
	message_color_container.style.maximal_height = 25 -- Limit the height
	message_color_container.add({type = "label", name = gui_names.settings_message_color_label, caption = {"gui.message-broadcaster_message-color"}})
	message_color_container.add({type = "label", name = gui_names.settings_message_color_value_label, caption = current_color_text})
	local color_value_label = message_color_container[gui_names.settings_message_color_value_label]
	color_value_label.style.font_color = current_color
	-- Pick color button.
	message_color_container.add({type = "button", name = gui_names.settings_message_pick_color_button, style = "small_color_picker_panel_button_style", tooltip = {"gui.message-broadcaster_pick-color"}})
	
	-- Target and method container.
	subcontainer_right.add({type = "table", name = gui_names.settings_target_and_method_container, colspan = 2})
	local target_and_method_container = subcontainer_right[gui_names.settings_target_and_method_container]
	target_and_method_container.style.vertical_spacing = 0
	target_and_method_container.style.horizontal_spacing = 0
	
	-- Target container.
	target_and_method_container.add({type = "frame", name = gui_names.settings_target_container, direction = "vertical", caption = {"gui.message-broadcaster_target"}})
	local target_container = target_and_method_container[gui_names.settings_target_container]
	target_container.style.minimal_width = main_frame_width * 0.5
	target_container.style.maximal_width = target_container.style.minimal_width
	
	-- Target - Force
	target_container.add({type = "label", name = gui_names.settings_target_force_label, caption = {"gui.message-broadcaster_force"}})
	target_container.add({type = "table", name = gui_names.settings_target_force_table, colspan = 1}) -- This table is needed, because checkboxes are horizontally aligned. They will be on the same line if their captions are not long enough.
	local force_table = target_container[gui_names.settings_target_force_table]
	force_table.style.left_padding = 10
	force_table.add({type = "checkbox", name = gui_names.settings_target_same_force_checkbox, state = current_target_force == 1, caption = gui_captions.target_forces[1]})
	force_table.add({type = "checkbox", name = gui_names.settings_target_all_forces_checkbox, state = current_target_force == 2, caption = gui_captions.target_forces[2]})
	
	-- Target - Distance
	target_container.add({type = "label", name = gui_names.settings_target_distance_label, caption = {"gui.message-broadcaster_distance"}})
	target_container.add({type = "table", name = gui_names.settings_target_distance_table, colspan = 1}) -- Same as force_table
	local distance_table = target_container[gui_names.settings_target_distance_table]
	distance_table.style.left_padding = 10
	distance_table.add({type = "checkbox", name = gui_names.settings_target_players_nearby_checkbox, state = current_target_distance == 1, caption = gui_captions.target_distances[1]})
	distance_table.add({type = "checkbox", name = gui_names.settings_target_same_surface_checkbox, state = current_target_distance == 2, caption = gui_captions.target_distances[2]})
	distance_table.add({type = "checkbox", name = gui_names.settings_target_all_players_checkbox, state = current_target_distance == 3, caption = gui_captions.target_distances[3]})
	
	-- Method.
	target_and_method_container.add({type = "frame", name = gui_names.settings_method_container, direction = "vertical", caption = {"gui.message-broadcaster_method"}})
	local method_container = target_and_method_container[gui_names.settings_method_container]
	method_container.style.minimal_width = target_container.style.minimal_width
	method_container.style.maximal_width = target_container.style.maximal_width
	method_container.add({type = "table", name = gui_names.settings_method_table, colspan = 1}) -- Same as force_table
	local method_table = method_container[gui_names.settings_method_table]
	method_table.add({type = "checkbox", name = gui_names.settings_method_console_checkbox, state = current_method == 1, caption = gui_captions.methods[1]})
	method_table.add({type = "checkbox", name = gui_names.settings_method_flying_text_checkbox, state = current_method == 2, caption = gui_captions.methods[2]})
	method_table.add({type = "checkbox", name = gui_names.settings_method_popup_checkbox, state = current_method == 3, caption = gui_captions.methods[3]})
	
	-- Apply and reload.
	subcontainer_right.add({type = "frame", name = gui_names.settings_apply_and_reload_container, direction = "horizontal"})
	local apply_and_reload_container = subcontainer_right[gui_names.settings_apply_and_reload_container]
	apply_and_reload_container.style.minimal_width = frame.style.minimal_width
	apply_and_reload_container.style.maximal_width = frame.style.maximal_width
	
	-- Left space.
	apply_and_reload_container.add({type = "flow", name = gui_names.settings_apply_and_reload_left_space, direction = "horizontal"})
	local apply_and_reload_left_space = apply_and_reload_container[gui_names.settings_apply_and_reload_left_space]
	apply_and_reload_left_space.style.minimal_width = main_frame_width - 8 * 5 - apply_and_reload_button_width * 2
	apply_and_reload_left_space.style.maximal_width = apply_and_reload_left_space.minimal_width
	
	-- Reload button.
	apply_and_reload_container.add({type = "button", name = gui_names.settings_reload_button, caption = {"gui.message-broadcaster_reload"}})
	local reload_button = apply_and_reload_container[gui_names.settings_reload_button]
	reload_button.style.minimal_width = apply_and_reload_button_width
	reload_button.style.maximal_width = reload_button.style.minimal_width
	
	-- Apply button.
	apply_and_reload_container.add({type = "button", name = gui_names.settings_apply_button, caption = {"gui.message-broadcaster_apply"}})
	local apply_button = apply_and_reload_container[gui_names.settings_apply_button]
	apply_button.style.minimal_width = reload_button.style.minimal_width
	apply_button.style.maximal_width = apply_button.style.minimal_width
end

-- Closes our custom GUI for the given player.
function close_message_broadcaster_gui_for_player(player)
	local left = player.gui.left
	if left[gui_names.settings_container] then
		left[gui_names.settings_container].destroy()
	end
	
	-- Remove the record about the player.
	global.message_broadcaster.players[player.index] = nil
end

-- Updates the current message settings in our custom GUI for the given player according to his opened entity.
-- This may be called when someone clicked the apply button, so all players opening the same entity should have their UI updated.
function update_current_message_settings_for_player(player)
	local left = player.gui.left
	if not left[gui_names.settings_container] then
		-- Not opened. Do nothing.
		return
	end
	
	if not global.message_broadcaster.players[player.index] then
		-- The player has not opened our entity!
		return
	end
	
	local target_entity = global.message_broadcaster.players[player.index]
	
	-- Load data from the entity.
	local current_message, current_color, current_target_force, current_target_distance, current_method = load_current_settings_from_entity(target_entity)
	
	-- Convert the color to 0 - 255 and separate the channels for display.
	local current_color_text = get_string_for_color(current_color)
	
	local container = left[gui_names.settings_container]
	local subcontainer_right = container[gui_names.settings_subcontainer_right]
	
	local frame = subcontainer_right[gui_names.settings_frame]
	local current_frame = frame[gui_names.settings_current_frame]
	local current_table = current_frame[gui_names.settings_current_table]
	-- Current message.
	current_table[gui_names.settings_current_message_label].caption = {"gui.message-broadcaster_current-message", current_message}
	-- Current color.
	local current_color_container = current_table[gui_names.settings_current_color_container]
	local current_color_value_label = current_color_container[gui_names.settings_current_color_value_label]
	current_color_value_label.caption = current_color_text
	current_color_value_label.style.font_color = current_color
	-- Current target force.
	current_table[gui_names.settings_current_target_force_label].caption = {"gui.message-broadcaster_current-target-force", gui_captions.target_forces[current_target_force]}
	-- Current target distance.
	current_table[gui_names.settings_current_target_distance_label].caption = {"gui.message-broadcaster_current-target-distance", gui_captions.target_distances[current_target_distance]}
	-- Current method.
	current_table[gui_names.settings_current_method_label].caption = {"gui.message-broadcaster_current-method", gui_captions.methods[current_method]}
end

-- Reloads the settings in our custom GUI for the given player.
function reload_message_broadcaster_gui_for_player(player)
	local left = player.gui.left
	if not left[gui_names.settings_container] then
		-- Not opened. Do nothing.
		return
	end
	
	if not global.message_broadcaster.players[player.index] then
		-- The player has not opened our entity!
		return
	end
	
	local target_entity = global.message_broadcaster.players[player.index]
	
	-- Load data from the entity.
	local current_message, current_color, current_target_force, current_target_distance, current_method = load_current_settings_from_entity(target_entity)
	
	-- Convert the color to 0 - 255 and separate the channels for display.
	local current_color_text = get_string_for_color(current_color)
	
	container = left[gui_names.settings_container]
	local subcontainer_right = container[gui_names.settings_subcontainer_right]
	local frame = subcontainer_right[gui_names.settings_frame]
	
	-- Message.
	frame[gui_names.settings_message_textfield].text = current_message
	
	-- Message color.
	local message_color_container = frame[gui_names.settings_message_color_container]
	local color_value_label = message_color_container[gui_names.settings_message_color_value_label]
	color_value_label.caption = current_color_text
	color_value_label.style.font_color = current_color
	
	-- Color picker if it is opened.
	if container[gui_names.color_picker_container] then
		remote.call("color-picker", "set_color", container[gui_names.color_picker_container], current_color)
	end
	
	-- Target and method container.
	local target_and_method_container = subcontainer_right[gui_names.settings_target_and_method_container]
	
	-- Target container.
	local target_container = target_and_method_container[gui_names.settings_target_container]
	
	-- Target - Force
	local force_table = target_container[gui_names.settings_target_force_table]
	force_table[gui_names.settings_target_same_force_checkbox].state = current_target_force == 1
	force_table[gui_names.settings_target_all_forces_checkbox].state = current_target_force == 2
	
	-- Target - Distance
	local distance_table = target_container[gui_names.settings_target_distance_table]
	distance_table[gui_names.settings_target_players_nearby_checkbox].state = current_target_distance == 1
	distance_table[gui_names.settings_target_same_surface_checkbox].state = current_target_distance == 2
	distance_table[gui_names.settings_target_all_players_checkbox].state = current_target_distance == 3
	
	-- Method.
	local method_container = target_and_method_container[gui_names.settings_method_container]
	local method_table = method_container[gui_names.settings_method_table]
	method_table[gui_names.settings_method_console_checkbox].state = current_method == 1
	method_table[gui_names.settings_method_flying_text_checkbox].state = current_method == 2
	method_table[gui_names.settings_method_popup_checkbox].state = current_method == 3
end

-- Broadcasts the message according to the given broadcaster entity.
function broadcast_message_from_entity(entity)
	for _, data in ipairs(global.message_broadcaster.broadcaster_datas) do
		if data.entity == entity then
			-- Get all target players first.
			local target_players = {}
			local entity_owner = entity.built_by
			if entity_owner == nil then
				-- No owner. Do nothing.
			end
			
			-- Add players by force.
			if data.target_force == 1 then
				-- Same force only.
				for _, p in pairs(game.players) do
					if p.force == entity_owner.force then
						table.insert(target_players, p)
					end
				end
			else
				-- All forces.
				for _, p in pairs(game.players) do
					table.insert(target_players, p)
				end
			end
			
			-- Remove players by distance.
			if data.target_distance == 1 then
				-- Nearby.
				for index, p in ipairs(target_players) do
					if p.surface ~= entity.surface or math.abs(p.position.x - entity.position.x) > nearby_tiles or math.abs(p.position.y - entity.position.y) > nearby_tiles then
						table.remove(target_players, index)
					end
				end
			elseif data.target_distance == 2 then
				-- Same surface.
				for index, p in ipairs(target_players) do
					if p.surface ~= entity.surface then
						table.remove(target_players, index)
					end
				end
			end
			
			-- Broadcast the message to the target players.
			if data.method == 1 then
				-- Console.
				for _, p in ipairs(target_players) do
					p.print(data.message)
				end
			elseif data.method == 2 then
				-- Flying text.
				for _, p in ipairs(target_players) do
					p.surface.create_entity{name = "flying-text", position = p.position, text = data.message, color = data.color}
				end
			else
				-- Popup.
				for _, p in ipairs(target_players) do
					local center = p.gui.center
					local frame = center[gui_names.received_message_popup_frame]
					-- Create the frame if it does not exist.
					if not frame then
						center.add({type = "frame", name = gui_names.received_message_popup_frame, direction = "vertical", caption = {"gui.message-broadcaster_title"}})
						frame = center[gui_names.received_message_popup_frame]						
						frame.add({type = "table", name = gui_names.received_message_popup_table, colspan = 1})
					end
					
					local message_table = frame[gui_names.received_message_popup_table]
					local children_names = message_table.children_names
					local children_num = #children_names
					local usable_name
					-- Remove the oldest message if there are too many.
					if children_num >= max_popup_message then
						-- We can simply reuse the name of the removed element.
						usable_name = children_names[1]
						message_table[usable_name].destroy()
					else
						-- Find a name that has not been used.
						local is_name_usable
						for i = 1, max_popup_message, 1 do
							usable_name = gui_names.received_message_popup_inner_frame_prefix .. i
							is_name_usable = true
							for _, used_name in pairs(children_names) do
								if usable_name == used_name then
									is_name_usable = false
									break
								end
							end
							if is_name_usable then
								break
							end
						end
					end
					
					-- Inner message frame.
					message_table.add({type = "frame", name = usable_name, direction = "vertical"})
					local inner_frame = message_table[usable_name]
					inner_frame.style.minimal_width = 400
					inner_frame.style.maximal_width = inner_frame.style.minimal_width
					
					-- Message label.
					inner_frame.add({type = "label", name = gui_names.received_message_popup_label, caption = data.message})
					local label = inner_frame[gui_names.received_message_popup_label]
					label.style.font_color = data.color
					
					-- OK button container.
					inner_frame.add({type = "flow", name = gui_names.received_message_popup_button_container, direction = "horizontal"})
					local button_container = inner_frame[gui_names.received_message_popup_button_container]
					-- Left space.
					button_container.add({type = "flow", name = gui_names.received_message_popup_button_space, direction = "horizontal"})
					local button_space = button_container[gui_names.received_message_popup_button_space]
					button_space.style.minimal_width = inner_frame.style.minimal_width - 80 - 8 * 4
					button_space.style.maximal_width = button_space.style.minimal_width
					-- Button.
					button_container.add({type = "button", name = gui_names.received_message_popup_button, caption = {"gui.ok"}})
					local button = button_container[gui_names.received_message_popup_button]
					button.style.minimal_width = 80
					button.style.maximal_width = button.style.minimal_width
				end
			end
		end
	end
end