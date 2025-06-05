FindItemInBallScript::
	callasm .TryReceiveItem
	iffalse .no_room
	disappear LAST_TALKED
	; applymovement PLAYER, FancySpinMovement
	; callasm LoadItemGetGFX
	opentext
	writetext .FoundItemText
	playsound SFX_ITEM
	pause 60
	itemnotify
	; applymovement PLAYER, Hideemoteitem
	closetext
	; scall BackToNormal
	end

.no_room
	opentext
	writetext .FoundItemText
	waitbutton
	writetext .CantCarryItemText
	waitbutton
	closetext
	end

.FoundItemText:
	text_far _FoundItemText
	text_end

.CantCarryItemText:
	text_far _CantCarryItemText
	text_end

.TryReceiveItem:
	xor a
	ld [wScriptVar], a
	ld a, [wItemBallItemID]
	ld [wNamedObjectIndex], a
	call GetItemName
	ld hl, wStringBuffer3
	call CopyName2
	ld a, [wItemBallItemID]
	ld [wCurItem], a
	ld a, [wItemBallQuantity]
	ld [wItemQuantityChange], a
	ld hl, wNumItems
	call ReceiveItem
	ret nc
	ld a, $1
	ld [wScriptVar], a
	ret

LoadItemGetGFX::
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	ld de, ItemGetGFX
	ld hl, vTiles0 tile $00
	call .LoadGFX
	ld hl, vTiles0 tile $02
	call .LoadGFX
	ld hl, vTiles0 tile $f8
	call .LoadItemGFX
	ld hl, vTiles0 tile $fa
	call .LoadItemGFX

	pop af
	ldh [rVBK], a
	ret

.LoadGFX:
	lb bc, BANK(ItemGetGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

.LoadItemGFX
	lb bc, BANK(ItemIconGFX), 4
	push de
	call Get2bpp
	pop de
	ld hl, 2 tiles
	add hl, de
	ld d, h
	ld e, l
	ret

BackToNormal:
	special UpdateTimePals
	loadvar VAR_MOVEMENT, PLAYER_NORMAL
	special UpdatePlayerSprite
	end

FancySpinMovement:
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	show_emote
	step_end

Hideemoteitem:
	hide_emote
	step_end

ItemGetGFX:
INCBIN "gfx/overworld/player_item.2bpp"

ItemIconGFX:
INCBIN "gfx/overworld/noitem.2bpp"