	object_const_def
	const GOLDENRODNAMERATER_NAME_RATER

GoldenrodNameRater_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

GoldenrodNameRaterBookshelf:
	jumpstd DifficultBookshelfScript

GoldenrodNameRaterRadio:
	jumpstd Radio2Script

GoldenrodNameRater_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event  1,  1, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event  7,  1, BGEVENT_READ, GoldenrodNameRaterRadio

	def_object_events
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNameRater, -1
