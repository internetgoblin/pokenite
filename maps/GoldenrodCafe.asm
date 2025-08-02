	object_const_def
	const GOLDENRODCAFE_NERD
	const GOLDENRODCAFE_MELAINA
	const GOLDENRODCAFE_GRISELDA
	const GOLDENRODCAFE_BLANKA_CUT

GoldenrodCafe_MapScripts:
	def_scene_scripts
	scene_script GoldenrodCafeGossipScene, SCENE_GOLDENRODCAFE_GOSSIP
	scene_script GoldenrodCafeNoopScene, SCENE_GOLDENRODCAFE_NOOP

	def_callbacks

GoldenrodCafeGossipScene:
	sdefer GoldenrodCafeGossipScript
	end

GoldenrodCafeNoopScene:
	end

GoldenrodCafeGossipScript:
	applymovement PLAYER, GCafeHidePanObjectMovement
	opentext
	writenamedtext GCafeBlankaName, GoldenrodCafeBlankaText1
	promptbutton
	turnobject GOLDENRODCAFE_GRISELDA, LEFT
	writenamedtext GCafeGriseldaName, GoldenrodCafeGriseldaText1
	promptbutton
	closetext
	showemote EMOTE_SHOCK, GOLDENRODCAFE_MELAINA, 15
	opentext
	writenamedtext GCafeMelainaName, GoldenrodCafeMelainaText1
	promptbutton
	writenamedtext GCafeBlankaName, GoldenrodCafeBlankaText2
	promptbutton
	writenamedtext GCafeGriseldaName, GoldenrodCafeGriseldaText2
	promptbutton
	writenamedtext GCafeMelainaName, GoldenrodCafeMelainaText2
	promptbutton
	writenamedtext GCafeBlankaName, GoldenrodCafeBlankaText3
	promptbutton
	writenamedtext GCafeMelainaName, GoldenrodCafeMelainaText3
	promptbutton
	closetext
	pause 15
	opentext
	writenamedtext GCafeGriseldaName, GoldenrodCafeGriseldaText3
	promptbutton
	writenamedtext GCafeMelainaName, GoldenrodCafeMelainaText4
	promptbutton
	writenamedtext GCafeBlankaName, GoldenrodCafeBlankaText4
	promptbutton
	closetext
	pause 5
	opentext
	writenamedtext GCafeGriseldaName, GoldenrodCafeGriseldaText4
	promptbutton
	writenamedtext GCafeBlankaName, GoldenrodCafeBlankaText5
	promptbutton
	closetext
	pause 15
	opentext
	writenamedtext GCafeGriseldaName, GoldenrodCafeGriseldaText5
	promptbutton
	writenamedtext GCafeMelainaName, GoldenrodCafeMelainaText5
	promptbutton
	; waitsfx
	; playsound SFX_NIGHTMARE
	closetext
	applymovement PLAYER, GCafeShowObjectMovement
	disappear GOLDENRODCAFE_BLANKA_CUT
	setmapscene GOLDENROD_CITY, SCENE_GOLDENRODCITY_NOOP
	setscene SCENE_GOLDENRODCAFE_NOOP
	setevent EVENT_GOLDENROD_CAFE_GOSSIP1
	playmapmusic
	end

GCafeBlankaName:
	db "BLANKA@"

GCafeGriseldaName:
	db "GRISELDA@"

GCafeMelainaName:
	db "MELAINA@"

CafeNerdName:
	db "BART@"

GoldenrodCafeNerdScript:
	faceplayer
	opentext
	writenamedtext CafeNerdName, GoldenrodCafeNerdText
	promptbutton
	closetext
	end

GoldenrodCafeEmpty:
	end

GoldenrodCafeNerdText:
	text "TESTING!"
	done

GoldenrodCafeBlankaText1:
	text "What is up with" ; WIP
	line "this new guy?"
	done

GoldenrodCafeGriseldaText1:
	text "He goes by SHILOH." ; WIP
	line "Comes from AZALEA"
	cont "TOWN in the south."
	done

GoldenrodCafeMelainaText1:
	text "That backwater?"
	done

GoldenrodCafeBlankaText2:
	text "So, he's a hick?"
	done

GoldenrodCafeGriseldaText2:
	text "Not exactly."

	para "He's an apprentice"
	line "of the # BALL"
	cont "craftsman."
	done

GoldenrodCafeMelainaText2:
	text "Ok? And?"

	para "He's a bumpkin"
	line "who can build"
	cont "special BALLS."
	done

GoldenrodCafeBlankaText3:
	text "Even if he is"
	line "a dummy, …"

	para "at least he"
	line "looks cute."
	done

GoldenrodCafeMelainaText3: ; Guess she's the racist one?
	text "Also, quite dark!"

	para "<……><……><……><……><……><……>"

	para "Probably from"
	line "spending so much"
	cont "time outside."
	done

GoldenrodCafeGriseldaText3:
	text "No, that's his"
	line "natural skintone."
	done

GoldenrodCafeMelainaText4:
	text "Ohhh! He must"
	line "be from AFRICA!"

	para "Never seen a"
	line "real AFRICAN"
	cont "before."
	done

GoldenrodCafeBlankaText4:
	text "Could also be"
	line "an AMERICAN."

	para "GRIS?"
	done

GoldenrodCafeGriseldaText4:
	text "Neither…"

	para "His mom is native"
	line "while his dad came"
	cont "here from GUYANA."
	done

GoldenrodCafeBlankaText5:
	text "SOUTH AMERICAN…"

	para "<……><……><……><……><……><……>"

	para "Well… I did say"
	line "he might be"
	cont "AMERICAN…"
	done

GoldenrodCafeGriseldaText5:
	text "SHILOH, himself,"
	line "was born here."

	para "He's just as"
	line "much a native"
	cont "as we are."
	done

GoldenrodCafeMelainaText5:
	text "I guess."
	done



; +SCENE SCRIPT PLANNING+

; Seems cute.

; He's a pretty boy

GCafeShowObjectMovement:
	step UP
	step UP
	turn_head DOWN
	show_object
	step_end

GCafeHidePanObjectMovement:
	hide_object
	step DOWN
	step DOWN
	step_end

GoldenrodCafe_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 16
	warp_event  3,  7, GOLDENROD_CITY, 16

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCafeNerdScript, -1
	object_event  2,  1, SPRITE_CAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCafeEmpty, EVENT_GOLDENROD_CAFE_GOSSIP1
	object_event  4,  2, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCafeEmpty, EVENT_GOLDENROD_CAFE_GOSSIP1
	object_event  3,  1, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodCafeEmpty, EVENT_GOLDENROD_CAFE_GOSSIP1
