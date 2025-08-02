	object_const_def
	const TAKEHOUSE1F_MOM1

TakeHouse1F_MapScripts:
	def_scene_scripts
	scene_script TakeHouse1FNoop1, SCENE_TAKEHOUSE1F_ERRAND
	scene_script TakeHouse1FNoop2, SCENE_TAKEHOUSE1F_NOOP

	def_callbacks

TakeHouse1FNoop1:
	end

TakeHouse1FNoop2:
	end


TakeHouse1FMomErrandRight:
	
	turnobject TAKEHOUSE1F_MOM1, RIGHT
	;opentext
	;writenamedtext
	applymovement PLAYER, ErrandBlanka1Movement
	sjump TakeHouse1FMomErrandScript

TakeHouse1FMomErrandLeft:
	turnobject TAKEHOUSE1F_MOM1, RIGHT
	;opentext
	;writenamedtext
	turnobject PLAYER, LEFT
TakeHouse1FMomErrandScript:
	setscene SCENE_TAKEHOUSE1F_NOOP
	end

TakeHouseMrsTake1:
	faceplayer
	opentext
	writenamedtext TakeHouseMrsName, TakeHouseMrsTake1Text
	promptbutton
	closetext
	end

TakeHouse1FBedroomScript:
	opentext
	writenamedtext Take1FBlankaName, TakeHouse1FBedroomText
	promptbutton
	closetext
	end

TakeHouse1FBookshelfScript:
	jumpstd DifficultBookshelfScript

TakeHouse1FTVScript:
	opentext
	writenamedtext Take1FBlankaName, TakeHouse1FTVText
	promptbutton
	writenamedtext TakeHouseMrsName, TakeHouse1FTVMomText
	promptbutton
	closetext
	end

ErrandBlanka1Movement:
	step LEFT
	step_end

Take1FBlankaName:
	db "BLANKA@"

TakeHouseMrsName:
	db "MOM@"

TakeHouseMrsTake1Text:
	text "Hey kiddo!" ; placeholder
	done

TakeHouse1FBedroomText:
	text "The door leading"
	line "to MOM's bedroom."

	para "It's locked."
	done

TakeHouse1FTVText:
	text "What are you"
	line "watching?"
	done

TakeHouse1FTVMomText:
	text "Don't worry"
	line "about it."
	done

TakeHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, TAKE_HOUSE_2F, 1
	warp_event  6,  7, GOLDENROD_CITY, 8
	warp_event  7,  7, GOLDENROD_CITY, 8

	def_coord_events
	coord_event  8,  4, SCENE_TAKEHOUSE1F_ERRAND, TakeHouse1FMomErrandLeft
	coord_event  9,  4, SCENE_TAKEHOUSE1F_ERRAND, TakeHouse1FMomErrandRight

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, TakeHouse1FBedroomScript
	bg_event  7,  1, BGEVENT_READ, TakeHouse1FBookshelfScript
	bg_event  6,  1, BGEVENT_READ, TakeHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TakeHouseMrsTake1, -1