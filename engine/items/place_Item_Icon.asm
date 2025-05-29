PlaceItemIcon:
	ld a, [wMenuSelection]
	ld [wCurSpecies], a
	cp a, -1 ; special case for Cancel in Key Items pocket
	ld de, CurrentCancelString
	ld [wNamedObjectIndexBuffer], a
	call nz, GetItemName
	pop hl
	call PlaceString
	
	ld a, [wCurSpecies]
	cp a, -1
	jr z, .clear
	ld e, a
	ld d, 0
	ld hl, ItemIconPointers
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld a, 4
	ld c, a
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first
	cp 1
	jr z, .second
	cp 2
	jr z, .third
	cp 3
	jr z, .forth
	jr .fifth
.first
	ld hl, vTiles0 tile $68
	jr .finish
.second
	ld hl, vTiles0 tile $6c
	jr .finish
.third
	ld hl, vTiles0 tile $70
	jr .finish
.forth
	ld hl, vTiles0 tile $74
.finish
	push af
	call Get2bpp
	; farcall LoadItemIconPalette
	call SetDefaultBGPAndOBP
	pop af
	inc a
	ld [wPlaceBallsX], a
	ret
.fifth
	ld hl, vTiles0 tile $78
	call Get2bpp
	; farcall LoadItemIconPalette
	call SetDefaultBGPAndOBP
	xor a
	ld [wPlaceBallsX], a
	ret
.clear
	ld a, [wPlaceBallsX]
	cp 0
	jr z, .first2
	cp 1
	jr z, .second2
	cp 2
	jr z, .third2
	cp 3
	jr z, .forth2
	jr .fifth2
.first2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, vTiles0 tile $68
	call Get2bpp
.second2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, vTiles0 tile $6c
	call Get2bpp
.third2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, vTiles0 tile $70
	call Get2bpp
.forth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, vTiles0 tile $74
	call Get2bpp
.fifth2
	ld de, NoItemIcon
	lb bc, BANK(NoItemIcon), 4
	ld hl, vTiles0 tile $78
	call Get2bpp
	xor a
	ld [wPlaceBallsX], a
	ret

CurrentCancelString:
	db "CANCEL@"