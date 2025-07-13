	object_const_def

TakeHouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

TakeHouseMrsTake1:
	jumptextfaceplayer TakeHouseMrsTake1Text

TakeHouseMrsTake1Text:
	text "Hey kiddo!" ; placeholder
	done

TakeHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, TAKE_HOUSE_2F, 1
	warp_event  6,  7, GOLDENROD_CITY, 8
	warp_event  7,  7, GOLDENROD_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  4, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TakeHouseMrsTake1, -1