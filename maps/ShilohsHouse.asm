	object_const_def
	const SHILOHS_HOUSE_MOM
	const SHILOHS_HOUSE_DAD
	const SHILOHS_HOUSE_PHOTO

ShilohsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ShilohsMomNameText:
	db "SHILOH'S MOM@"

ShilohsDadNameText:
	db "SHILOH'S DAD@"

ShilohsHouseMomScript:
	faceplayer
	opentext
	writenamedtext ShilohsMomNameText, ShilohsMomText
	waitbutton
	closetext
	end

ShilohsHouseDadScript:
	faceplayer
	opentext
	writenamedtext ShilohsDadNameText, ShilohsDadText
	waitbutton
	closetext
	end

ShilohsHousePhoto1:
	jumptext ShilohsHousePhotoText

ShilohsHousePhoto2:
	jumptext ShilohsHousePhotoText

ShilohsMomText: ; placeholder
	text "Oh, you've met our"
	line "son? Isn't he"
	cont "something?"
	done

ShilohsDadText: ; placeholder
	text "My wife has was"
	line "born and raised"
	cont "here in AZALEA."

	para "It's not all too"
	line "different from"
	cont "where I grew up."
	done

ShilohsHousePhotoText:
	text "A framed photo of"
	line "a young girl wear-"
	cont "ing a nice kimono."

	para "An EEVEE appears"
	line "alongside her."
	done

ShilohsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, AZALEA_TOWN, 9
	warp_event  4,  7, AZALEA_TOWN, 9

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, ShilohsHousePhoto1
	bg_event  5,  0, BGEVENT_READ, ShilohsHousePhoto2

	def_object_events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_OW_PURPLE, OBJECTTYPE_SCRIPT, 0, ShilohsHouseMomScript, -1
	object_event  5,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_OW_PURPLE, OBJECTTYPE_SCRIPT, 0, ShilohsHouseDadScript, -1
