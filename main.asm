;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _init
	.globl _UpdateTargetMove
	.globl _CheckIfBulletColliding
	.globl _CheckIfEffectsIsOutofScreenX
	.globl _SpawnEffectsOnBullet
	.globl _SpawnBullet
	.globl _removeTargetfromList
	.globl _UpdateHealth
	.globl _switchLevel
	.globl _PrepareLevel
	.globl _SetBullets
	.globl _ResetLevel
	.globl _SpawnTallTarget
	.globl _SpawnArrow
	.globl _SpawnSwitch
	.globl _SetTargetToVerticalMove
	.globl _SetTargetToHorizontalMove
	.globl _DestroySmallTarget
	.globl _SpawnSmallTarget
	.globl _DestroyBigTarget
	.globl _MoveBigTarget
	.globl _MoveLongTarget
	.globl _SpawnBigTarget
	.globl _DestroyLongTarget
	.globl _SpawnLongTarget
	.globl _DrawWall
	.globl _UpdatePlayerAnimation
	.globl _setupPlayer
	.globl _movePlayer
	.globl _splashscreen
	.globl _makeSound
	.globl _fadein
	.globl _fadeout
	.globl _SwitchPlayerEyeFrames
	.globl _collisionCheck
	.globl _perfomantdelay
	.globl _printf
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_tile_xy
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _numberspriteList
	.globl _TimerisOn
	.globl _BisPressed
	.globl _AisPressed
	.globl _NextLevelHasStarted
	.globl _BulletEffectChecker
	.globl _Abletoshoot
	.globl _BulletIsShooting
	.globl _LevelPrepareCountdown
	.globl _BulletCurrentDirection
	.globl _TargetList
	.globl _WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	.globl _Lives
	.globl _EffectYMover
	.globl _EffectMover
	.globl _EffectMoveCheck
	.globl _EffectCurrentY
	.globl _Ammo
	.globl _Levels
	.globl _playerinitloopTiles
	.globl _Playerframespeed
	.globl _VelocityY
	.globl _switchPlayerFrame
	.globl _framecounter
	.globl _WindowTileset
	.globl _WindowMap
	.globl _TargetSprites
	.globl _Bullet
	.globl _Font
	.globl _BackgroundObjects
	.globl _LevelMap
	.globl _Arrows
	.globl _Switches
	.globl _MovingObjects
	.globl _Objects
	.globl _BulletPosition
	.globl _EffectPosition
	.globl _PlayerPosition
	.globl _VelocityX
	.globl _PlayerframesReverse
	.globl _Playerframes
	.globl _Ghost
	.globl _LevelTiles
	.globl _u3logoMap
	.globl _u3logo
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_VelocityX::
	.ds 1
_PlayerPosition::
	.ds 4
_EffectPosition::
	.ds 2
_BulletPosition::
	.ds 2
_Objects::
	.ds 120
_MovingObjects::
	.ds 35
_Switches::
	.ds 18
_Arrows::
	.ds 6
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_LevelMap::
	.ds 360
_BackgroundObjects::
	.ds 208
_Font::
	.ds 416
_Bullet::
	.ds 48
_TargetSprites::
	.ds 160
_WindowMap::
	.ds 20
_WindowTileset::
	.ds 224
_framecounter::
	.ds 1
_switchPlayerFrame::
	.ds 1
_VelocityY::
	.ds 1
_Playerframespeed::
	.ds 1
_playerinitloopTiles::
	.ds 1
_Levels::
	.ds 1
_Ammo::
	.ds 1
_EffectCurrentY::
	.ds 1
_EffectMoveCheck::
	.ds 1
_EffectMover::
	.ds 1
_EffectYMover::
	.ds 1
_Lives::
	.ds 1
_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao::
	.ds 1
_TargetList::
	.ds 1
_BulletCurrentDirection::
	.ds 1
_LevelPrepareCountdown::
	.ds 2
_BulletIsShooting::
	.ds 1
_Abletoshoot::
	.ds 1
_BulletEffectChecker::
	.ds 1
_NextLevelHasStarted::
	.ds 1
_AisPressed::
	.ds 1
_BisPressed::
	.ds 1
_TimerisOn::
	.ds 1
_numberspriteList::
	.ds 10
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:143: void perfomantdelay(int8_t numloops)
;	---------------------------------
; Function perfomantdelay
; ---------------------------------
_perfomantdelay::
;main.c:145: for (int8_t i = 0; i < numloops; i++)
	ld	c, #0x00
00103$:
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	ret	NC
;main.c:147: wait_vbl_done();
	call	_wait_vbl_done
;main.c:145: for (int8_t i = 0; i < numloops; i++)
	inc	c
;main.c:149: }
	jr	00103$
_u3logo:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xdc	; 220
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7c	; 124
	.db #0x7f	; 127
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x18	; 24
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xb8	; 184
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xc1	; 193
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0xe3	; 227
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x79	; 121	'y'
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0xfc	; 252
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0xde	; 222
	.db #0xfe	; 254
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0x8f	; 143
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x7e	; 126
	.db #0x78	; 120	'x'
	.db #0x7c	; 124
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0xbc	; 188
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xf7	; 247
	.db #0xf7	; 247
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0x79	; 121	'y'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x3e	; 62
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0x7e	; 126
	.db #0x1e	; 30
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3c	; 60
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x8f	; 143
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x79	; 121	'y'
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfe	; 254
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5c	; 92
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x38	; 56	'8'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xb0	; 176
	.db #0x78	; 120	'x'
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x3e	; 62
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x3f	; 63
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x1f	; 31
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0x8f	; 143
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0x9f	; 159
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xcf	; 207
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xc7	; 199
	.db #0xe7	; 231
	.db #0xe3	; 227
	.db #0xc7	; 199
	.db #0xe3	; 227
	.db #0xc3	; 195
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xa2	; 162
	.db #0xc1	; 193
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xe3	; 227
	.db #0xc1	; 193
	.db #0xe1	; 225
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xd8	; 216
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1c	; 28
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x7f	; 127
	.db #0x8e	; 142
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xc4	; 196
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x98	; 152
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x09	; 9
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0xc3	; 195
	.db #0xc1	; 193
	.db #0x83	; 131
	.db #0xc3	; 195
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x1f	; 31
	.db #0x7f	; 127
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xf6	; 246
	.db #0xf9	; 249
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2c	; 44
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf4	; 244
	.db #0xfb	; 251
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0xf8	; 248
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0e	; 14
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xee	; 238
	.db #0xdc	; 220
	.db #0xce	; 206
	.db #0x9c	; 156
	.db #0x0c	; 12
	.db #0x9e	; 158
	.db #0xcc	; 204
	.db #0x9e	; 158
	.db #0x8e	; 142
	.db #0xdc	; 220
	.db #0xce	; 206
	.db #0xdc	; 220
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x87	; 135
	.db #0x83	; 131
	.db #0x87	; 135
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0xc7	; 199
	.db #0x83	; 131
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x83	; 131
	.db #0xc1	; 193
	.db #0xe0	; 224
	.db #0xc1	; 193
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfb	; 251
	.db #0xe0	; 224
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x43	; 67	'C'
	.db #0x87	; 135
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0xbb	; 187
	.db #0xc7	; 199
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x70	; 112	'p'
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0xb8	; 184
	.db #0x78	; 120	'x'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x1e	; 30
	.db #0x1c	; 28
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x79	; 121	'y'
	.db #0x3c	; 60
	.db #0x77	; 119	'w'
	.db #0x7f	; 127
	.db #0xf3	; 243
	.db #0x70	; 112	'p'
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0x70	; 112	'p'
	.db #0xe0	; 224
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x83	; 131
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0b	; 11
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xf1	; 241
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x5e	; 94
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0xe6	; 230
	.db #0xf8	; 248
	.db #0xc3	; 195
	.db #0xe3	; 227
	.db #0x43	; 67	'C'
	.db #0x81	; 129
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3e	; 62
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x1d	; 29
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x79	; 121	'y'
	.db #0xf8	; 248
	.db #0xf0	; 240
	.db #0xf1	; 241
	.db #0xf1	; 241
	.db #0xe0	; 224
	.db #0x81	; 129
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe2	; 226
	.db #0xfc	; 252
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xed	; 237
	.db #0xf2	; 242
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x01	; 1
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0xf9	; 249
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xe1	; 225
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0x60	; 96
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x33	; 51	'3'
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0xe0	; 224
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x9f	; 159
	.db #0x7f	; 127
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfc	; 252
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x3f	; 63
	.db #0x17	; 23
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0xef	; 239
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0x3f	; 63
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0x10	; 16
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe3	; 227
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x41	; 65	'A'
	.db #0x83	; 131
	.db #0xe7	; 231
	.db #0x03	; 3
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xbe	; 190
	.db #0xff	; 255
	.db #0x1e	; 30
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_u3logoMap:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x11	; 17
	.db #0x12	; 18
	.db #0x13	; 19
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x19	; 25
	.db #0x1a	; 26
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x20	; 32
	.db #0x21	; 33
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x24	; 36
	.db #0x25	; 37
	.db #0x26	; 38
	.db #0x27	; 39
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x2a	; 42
	.db #0x2b	; 43
	.db #0x2c	; 44
	.db #0x2d	; 45
	.db #0x2e	; 46
	.db #0x22	; 34
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x31	; 49	'1'
	.db #0x32	; 50	'2'
	.db #0x33	; 51	'3'
	.db #0x34	; 52	'4'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x38	; 56	'8'
	.db #0x39	; 57	'9'
	.db #0x3a	; 58
	.db #0x3b	; 59
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x41	; 65	'A'
	.db #0x42	; 66	'B'
	.db #0x43	; 67	'C'
	.db #0x44	; 68	'D'
	.db #0x45	; 69	'E'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x48	; 72	'H'
	.db #0x49	; 73	'I'
	.db #0x00	; 0
	.db #0x4a	; 74	'J'
	.db #0x42	; 66	'B'
	.db #0x4b	; 75	'K'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x4f	; 79	'O'
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x42	; 66	'B'
	.db #0x51	; 81	'Q'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x52	; 82	'R'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x53	; 83	'S'
	.db #0x54	; 84	'T'
	.db #0x4f	; 79	'O'
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x57	; 87	'W'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x59	; 89	'Y'
	.db #0x5a	; 90	'Z'
	.db #0x5b	; 91
	.db #0x5c	; 92
	.db #0x5d	; 93
	.db #0x5e	; 94
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x5f	; 95
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x61	; 97	'a'
	.db #0x62	; 98	'b'
	.db #0x63	; 99	'c'
	.db #0x64	; 100	'd'
	.db #0x65	; 101	'e'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x67	; 103	'g'
	.db #0x68	; 104	'h'
	.db #0x69	; 105	'i'
	.db #0x6a	; 106	'j'
	.db #0x6b	; 107	'k'
	.db #0x6c	; 108	'l'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x6e	; 110	'n'
	.db #0x6f	; 111	'o'
	.db #0x70	; 112	'p'
	.db #0x71	; 113	'q'
	.db #0x72	; 114	'r'
	.db #0x73	; 115	's'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x75	; 117	'u'
	.db #0x00	; 0
	.db #0x76	; 118	'v'
	.db #0x77	; 119	'w'
	.db #0x78	; 120	'x'
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x7b	; 123
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7d	; 125
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x80	; 128
	.db #0x81	; 129
	.db #0x82	; 130
	.db #0x83	; 131
	.db #0x84	; 132
	.db #0x85	; 133
	.db #0x86	; 134
	.db #0x87	; 135
	.db #0x88	; 136
	.db #0x00	; 0
	.db #0x89	; 137
	.db #0x42	; 66	'B'
	.db #0x8a	; 138
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x8b	; 139
	.db #0x8c	; 140
	.db #0x8d	; 141
	.db #0x8e	; 142
	.db #0x8f	; 143
	.db #0x90	; 144
	.db #0x91	; 145
	.db #0x92	; 146
	.db #0x93	; 147
	.db #0x94	; 148
	.db #0x95	; 149
	.db #0x96	; 150
	.db #0x42	; 66	'B'
	.db #0x97	; 151
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x98	; 152
	.db #0x99	; 153
	.db #0x9a	; 154
	.db #0x9b	; 155
	.db #0x9c	; 156
	.db #0x9d	; 157
	.db #0x9e	; 158
	.db #0x9f	; 159
	.db #0xa0	; 160
	.db #0xa1	; 161
	.db #0xa2	; 162
	.db #0x42	; 66	'B'
	.db #0xa3	; 163
	.db #0xa4	; 164
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xa5	; 165
	.db #0xa6	; 166
	.db #0xa7	; 167
	.db #0xa8	; 168
	.db #0xa9	; 169
	.db #0xaa	; 170
	.db #0xab	; 171
	.db #0xac	; 172
	.db #0xad	; 173
	.db #0xae	; 174
	.db #0xaf	; 175
	.db #0xb0	; 176
	.db #0xb1	; 177
	.db #0xb2	; 178
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_LevelTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf0	; 240
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf4	; 244
	.db #0x38	; 56	'8'
	.db #0xe8	; 232
	.db #0x70	; 112	'p'
	.db #0xd1	; 209
	.db #0xe0	; 224
	.db #0xa2	; 162
	.db #0xc1	; 193
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xf0	; 240
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x2c	; 44
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x0f	; 15
	.db #0x8b	; 139
	.db #0x07	; 7
	.db #0x45	; 69	'E'
	.db #0x83	; 131
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xa5	; 165
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x10	; 16
	.db #0x40	; 64
	.db #0x20	; 32
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xaa	; 170
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x08	; 8
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xfc	; 252
	.db #0x27	; 39
	.db #0xe6	; 230
	.db #0x5b	; 91
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0x67	; 103	'g'
	.db #0xda	; 218
	.db #0x3f	; 63
	.db #0xe4	; 228
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xda	; 218
	.db #0x67	; 103	'g'
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xf4	; 244
	.db #0x5f	; 95
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xda	; 218
	.db #0x67	; 103	'g'
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xab	; 171
	.db #0xd5	; 213
	.db #0xd5	; 213
	.db #0x7f	; 127
	.db #0xfa	; 250
	.db #0x2f	; 47
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xf4	; 244
	.db #0x5f	; 95
	.db #0xaa	; 170
	.db #0xff	; 255
	.db #0xd5	; 213
	.db #0xab	; 171
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xda	; 218
	.db #0x67	; 103	'g'
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0xf1	; 241
	.db #0x8f	; 143
	.db #0xfe	; 254
	.db #0x7f	; 127
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0xfa	; 250
	.db #0x2f	; 47
	.db #0xd5	; 213
	.db #0x7f	; 127
	.db #0xab	; 171
	.db #0xd5	; 213
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xda	; 218
	.db #0x67	; 103	'g'
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x55	; 85	'U'
_Ghost:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x1a	; 26
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x17	; 23
	.db #0x15	; 21
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1e	; 30
	.db #0x11	; 17
	.db #0x15	; 21
	.db #0x1b	; 27
	.db #0x0a	; 10
	.db #0x0e	; 14
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x17	; 23
	.db #0x18	; 24
	.db #0x0a	; 10
	.db #0x0d	; 13
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x1f	; 31
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1b	; 27
	.db #0x14	; 20
	.db #0x15	; 21
	.db #0x1e	; 30
	.db #0x0a	; 10
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
_Playerframes:
	.db #0x04	;  4
	.db #0x05	;  5
	.db #0x06	;  6
	.db #0x07	;  7
_PlayerframesReverse:
	.db #0x07	;  7
	.db #0x06	;  6
	.db #0x05	;  5
	.db #0x04	;  4
;main.c:151: int8_t collisionCheck(int8_t x1, int8_t y1, int8_t w1, int8_t h1, int8_t x2, int8_t y2, int8_t w2, int8_t h2)
;	---------------------------------
; Function collisionCheck
; ---------------------------------
_collisionCheck::
	add	sp, #-4
;main.c:154: if ((x1 < (x2 + w2)) && ((x1 + w1) > x2) && (y1 < (h2 + y2)) && ((y1 + h1) > y2))
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00129$
	bit	7, d
	jr	NZ, 00130$
	cp	a, a
	jr	00130$
00129$:
	bit	7, d
	jr	Z, 00130$
	scf
00130$:
	jp	NC, 00102$
	ldhl	sp,	#8
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	NC, 00102$
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	NC, 00102$
	ldhl	sp,	#9
	ld	a, (hl)
	ld	c, a
	rlca
	sbc	a, a
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	jr	NC, 00102$
;main.c:156: return 1;
	ld	e, #0x01
	jr	00107$
00102$:
;main.c:160: return 0;
	ld	e, #0x00
00107$:
;main.c:162: }
	add	sp, #4
	ret
;main.c:164: void SwitchPlayerEyeFrames(int8_t Frame)
;	---------------------------------
; Function SwitchPlayerEyeFrames
; ---------------------------------
_SwitchPlayerEyeFrames::
;main.c:166: switch (Frame)
	ldhl	sp,	#2
	ld	a, (hl)
	or	a, a
	jr	Z, 00133$
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00135$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00137$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x03
	jr	Z, 00139$
	ret
;main.c:169: for (int8_t i = 0; i < 2; i++)
00133$:
	ld	c, #0x00
00115$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	ret	NC
;main.c:171: set_sprite_tile(i, 0);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:169: for (int8_t i = 0; i < 2; i++)
	inc	c
	jr	00115$
;main.c:176: for (int8_t i = 0; i < 2; i++)
00135$:
	ld	c, #0x00
00118$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	ret	NC
;main.c:178: set_sprite_tile(i, 1);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x01
;main.c:176: for (int8_t i = 0; i < 2; i++)
	inc	c
	jr	00118$
;main.c:182: for (int8_t i = 0; i < 2; i++)
00137$:
	ld	c, #0x00
00121$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	ret	NC
;main.c:184: set_sprite_tile(i, 2);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x02
;main.c:182: for (int8_t i = 0; i < 2; i++)
	inc	c
	jr	00121$
;main.c:188: for (int8_t i = 0; i < 2; i++)
00139$:
	ld	c, #0x00
00124$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	ret	NC
;main.c:190: set_sprite_tile(i, 3);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x03
;main.c:188: for (int8_t i = 0; i < 2; i++)
	inc	c
;main.c:193: }
;main.c:194: }
	jr	00124$
;main.c:196: void fadeout(int8_t delay)
;	---------------------------------
; Function fadeout
; ---------------------------------
_fadeout::
;main.c:198: for (int8_t i = 0; i < 4; i++)
	ld	c, #0x00
00108$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	ret	NC
;main.c:200: switch (i)
	ld	a, c
	or	a, a
	jr	Z, 00101$
	ld	a, c
	dec	a
	jr	Z, 00102$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00103$
	sub	a, #0x03
	jr	Z, 00104$
	jr	00105$
;main.c:202: case 0:
00101$:
;main.c:203: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:204: break;
	jr	00105$
;main.c:206: case 1:
00102$:
;main.c:207: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:208: break;
	jr	00105$
;main.c:210: case 2:
00103$:
;main.c:211: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:212: break;
	jr	00105$
;main.c:214: case 3:
00104$:
;main.c:215: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;main.c:217: }
00105$:
;main.c:218: perfomantdelay(delay);
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_perfomantdelay
	inc	sp
	pop	bc
;main.c:198: for (int8_t i = 0; i < 4; i++)
	inc	c
;main.c:220: }
	jr	00108$
;main.c:222: void fadein(int8_t delay)
;	---------------------------------
; Function fadein
; ---------------------------------
_fadein::
;main.c:224: for (int8_t i = 0; i < 3; i++)
	ld	c, #0x00
00107$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;main.c:226: switch (i)
	ld	a, c
	or	a, a
	jr	Z, 00101$
	ld	a, c
	dec	a
	jr	Z, 00102$
	ld	a, c
	sub	a, #0x02
	jr	Z, 00103$
	jr	00104$
;main.c:228: case 0:
00101$:
;main.c:229: BGP_REG = 0xFE;
	ld	a, #0xfe
	ldh	(_BGP_REG + 0), a
;main.c:230: break;
	jr	00104$
;main.c:232: case 1:
00102$:
;main.c:233: BGP_REG = 0xF9;
	ld	a, #0xf9
	ldh	(_BGP_REG + 0), a
;main.c:234: break;
	jr	00104$
;main.c:236: case 2:
00103$:
;main.c:237: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:239: }
00104$:
;main.c:240: perfomantdelay(delay);
	push	bc
	ldhl	sp,	#4
	ld	a, (hl)
	push	af
	inc	sp
	call	_perfomantdelay
	inc	sp
	pop	bc
;main.c:224: for (int8_t i = 0; i < 3; i++)
	inc	c
;main.c:242: }
	jr	00107$
;main.c:244: void makeSound(char sweep, char wave, char envolope, char low, char high)
;	---------------------------------
; Function makeSound
; ---------------------------------
_makeSound::
;main.c:246: NR10_REG = sweep;
	ldhl	sp,	#2
;main.c:247: NR11_REG = wave;
	ld	a, (hl+)
	ldh	(_NR10_REG + 0), a
;main.c:248: NR12_REG = envolope;
	ld	a, (hl+)
	ldh	(_NR11_REG + 0), a
;main.c:249: NR13_REG = low;
	ld	a, (hl+)
	ldh	(_NR12_REG + 0), a
;main.c:250: NR14_REG = high;
	ld	a, (hl+)
	ldh	(_NR13_REG + 0), a
	ld	a, (hl)
	ldh	(_NR14_REG + 0), a
;main.c:251: }
	ret
;main.c:253: void splashscreen()
;	---------------------------------
; Function splashscreen
; ---------------------------------
_splashscreen::
;main.c:255: BGP_REG = 0xFF;
	ld	a, #0xff
	ldh	(_BGP_REG + 0), a
;main.c:256: set_bkg_data(0, 179, u3logo);
	ld	de, #_u3logo
	push	de
	ld	hl, #0xb300
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:257: set_bkg_tiles(0, 0, 20, 18, u3logoMap);
	ld	de, #_u3logoMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:258: fadein(3);
	ld	a, #0x03
	push	af
	inc	sp
	call	_fadein
	inc	sp
;main.c:262: }
	ret
;main.c:264: void movePlayer(int8_t x, int8_t y)
;	---------------------------------
; Function movePlayer
; ---------------------------------
_movePlayer::
	dec	sp
;main.c:271: move_sprite(0, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:272: move_sprite(1, x + 8, y);
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#0
	ld	(hl), a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), e
;main.c:273: move_sprite(2, x, y + 8);
	ld	a, b
	add	a, #0x08
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #(_shadow_OAM + 8)
	ld	(hl+), a
	ld	(hl), c
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+12
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(bc), a
	inc	bc
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;main.c:274: move_sprite(3, x + 8, y + 8);
;main.c:275: }
	inc	sp
	ret
;main.c:277: void setupPlayer()
;	---------------------------------
; Function setupPlayer
; ---------------------------------
_setupPlayer::
;main.c:279: PlayerPosition[0] = 80;
	ld	hl, #_PlayerPosition
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:280: PlayerPosition[1] = 135;
	ld	hl, #(_PlayerPosition + 2)
	ld	a, #0x87
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:282: for (int8_t i = 0; i < 4; i++)
	ld	c, #0x00
00106$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	NC, 00101$
;main.c:284: playerinitloopTiles = (i >= 2) ? (i == 3 ? 7 : 4) : playerinitloopTiles;
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	jr	C, 00110$
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00112$
	ld	de, #0x0007
	jr	00111$
00112$:
	ld	de, #0x0004
	jr	00111$
00110$:
	ld	a, (#_playerinitloopTiles)
	ld	e, a
	rlca
00111$:
	ld	hl, #_playerinitloopTiles
	ld	(hl), e
;main.c:286: set_sprite_tile(i, playerinitloopTiles);
	ld	b, (hl)
	ld	e, c
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), b
;main.c:282: for (int8_t i = 0; i < 4; i++)
	inc	c
	jr	00106$
00101$:
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 7)
	ld	(hl), #0x20
	ld	hl, #(_shadow_OAM + 15)
	ld	(hl), #0x20
;main.c:292: movePlayer(PlayerPosition[0], PlayerPosition[1]);
	ld	a, (#(_PlayerPosition + 2) + 0)
	ld	hl, #_PlayerPosition
	ld	b, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_movePlayer
	pop	hl
;main.c:293: }
	ret
;main.c:295: void UpdatePlayerAnimation()
;	---------------------------------
; Function UpdatePlayerAnimation
; ---------------------------------
_UpdatePlayerAnimation::
;main.c:297: framecounter++;
	ld	hl, #_framecounter
	inc	(hl)
;main.c:299: if (framecounter >= Playerframespeed)
	ld	hl, #_Playerframespeed
	ld	e, (hl)
	ld	hl, #_framecounter
	ld	d, (hl)
	ld	a, (hl)
	ld	hl, #_Playerframespeed
	sub	a, (hl)
	bit	7, e
	jr	Z, 00119$
	bit	7, d
	jr	NZ, 00120$
	cp	a, a
	jr	00120$
00119$:
	bit	7, d
	jr	Z, 00120$
	scf
00120$:
	ret	C
;main.c:301: switchPlayerFrame++;
	ld	hl, #_switchPlayerFrame
	inc	(hl)
;main.c:303: switchPlayerFrame = (switchPlayerFrame > 3) ? 0 : switchPlayerFrame;
	ld	e, (hl)
	ld	a,#0x03
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00121$
	bit	7, d
	jr	NZ, 00122$
	cp	a, a
	jr	00122$
00121$:
	bit	7, d
	jr	Z, 00122$
	scf
00122$:
	jr	NC, 00107$
	xor	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	jr	00108$
00107$:
	ld	hl, #_switchPlayerFrame
	ld	a, (hl)
	push	af
	rlca
	sbc	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
00108$:
	ld	(_switchPlayerFrame), a
;main.c:305: set_sprite_tile(2, Playerframes[switchPlayerFrame]);
	ld	bc, #_Playerframes+0
	ld	a, (#_switchPlayerFrame)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), c
;main.c:306: set_sprite_tile(3, PlayerframesReverse[switchPlayerFrame]);
	ld	bc, #_PlayerframesReverse+0
	ld	a, (#_switchPlayerFrame)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), c
;main.c:308: framecounter = 0;
	ld	hl, #_framecounter
	ld	(hl), #0x00
;main.c:310: }
	ret
;main.c:312: void DrawWall(int8_t x, int8_t y, int8_t width, int8_t height, int8_t ObjectNumber)
;	---------------------------------
; Function DrawWall
; ---------------------------------
_DrawWall::
	dec	sp
	dec	sp
;main.c:315: Objects[ObjectNumber].x = ((x + 1) * 8) - 2;
	ldhl	sp,	#8
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
;main.c:316: Objects[ObjectNumber].y = (y + 1) * 8;
	ld	a, (hl+)
	inc	a
	add	a, a
	add	a, a
	add	a, a
	dec	a
	dec	a
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	inc	a
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;main.c:317: Objects[ObjectNumber].type = Wall;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x03
;main.c:318: Objects[ObjectNumber].ishit = true;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x01
;main.c:319: Objects[ObjectNumber].width = width * 8;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;main.c:320: Objects[ObjectNumber].height = (height + 1) * 8;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#7
	ld	a, (hl)
	inc	a
	add	a, a
	add	a, a
	add	a, a
	ld	(bc), a
;main.c:327: for (int8_t i = 0; i < width; i++)
	ld	c, #0x00
00107$:
	ldhl	sp,	#0
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	NC, 00109$
;main.c:329: for (int8_t j = 0; j < height; j++)
	ldhl	sp,	#4
	ld	a, (hl)
	add	a, c
	ldhl	sp,	#1
	ld	(hl), a
	ld	b, #0x00
00104$:
	ldhl	sp,	#7
	ld	e, (hl)
	ld	a,b
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	jr	NC, 00108$
;main.c:331: set_bkg_tile_xy((x + i), (y + j), 36);
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, b
	ld	h, #0x24
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:329: for (int8_t j = 0; j < height; j++)
	inc	b
	jr	00104$
00108$:
;main.c:327: for (int8_t i = 0; i < width; i++)
	inc	c
	jr	00107$
00109$:
;main.c:334: }
	inc	sp
	inc	sp
	ret
;main.c:336: void SpawnLongTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t OAM_END, int8_t TargetNumber)
;	---------------------------------
; Function SpawnLongTarget
; ---------------------------------
_SpawnLongTarget::
	add	sp, #-8
;main.c:338: Objects[TargetNumber].x = x;
	ldhl	sp,	#14
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
;main.c:339: Objects[TargetNumber].y = y;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:340: Objects[TargetNumber].type = Long;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x02
;main.c:341: Objects[TargetNumber].width = 24;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x18
;main.c:342: Objects[TargetNumber].height = 13;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x0d
;main.c:343: Objects[TargetNumber].oamStart = OAM_START;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#12
;main.c:344: Objects[TargetNumber].oamEnd = OAM_END;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:345: Objects[TargetNumber].ishit = false;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;main.c:347: TargetList++;
	ld	hl, #_TargetList
	inc	(hl)
;main.c:349: set_sprite_tile(OAM_START, 11);
	ldhl	sp,	#12
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x0b
;main.c:350: set_sprite_tile(OAM_START + 1, 11);
	ld	a, c
	inc	a
	ldhl	sp,	#0
	ld	(hl), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x0b
;main.c:351: set_sprite_tile(OAM_START + 2, 11);
	ld	a, c
	add	a, #0x02
	ldhl	sp,	#1
	ld	(hl), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x0b
;main.c:352: set_sprite_tile(OAM_START + 3, 11);
	ld	a, c
	add	a, #0x03
	ldhl	sp,	#2
	ld	(hl), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x0b
;main.c:353: set_sprite_tile(OAM_START + 4, 12);
	ld	a, c
	add	a, #0x04
	ldhl	sp,	#3
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), #0x0c
;main.c:354: set_sprite_tile(OAM_START + 5, 12);
	ld	a, c
	add	a, #0x05
	ldhl	sp,	#4
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x0c
;main.c:356: move_sprite(OAM_START, x, y);
	ldhl	sp,	#11
	ld	a, (hl-)
	ld	c, a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:357: move_sprite(OAM_START + 1, x, y + 8);
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	ldhl	sp,	#0
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#7
;main.c:358: move_sprite(OAM_START + 2, x + 16, y);
	ld	a, (hl-)
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ld	a, b
	add	a, #0x10
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl), a
	ldhl	sp,	#1
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;main.c:359: move_sprite(OAM_START + 3, x + 16, y + 8);
	ldhl	sp,	#2
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	(de), a
	inc	de
;main.c:360: move_sprite(OAM_START + 4, x + 8, y);
	ld	a, (hl+)
	ld	(de), a
	ld	a, b
	add	a, #0x08
	ld	(hl), a
	ld	b, (hl)
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:361: move_sprite(OAM_START + 5, x + 8, y + 8);
	ldhl	sp,	#4
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#5
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:363: set_sprite_prop(OAM_START + 1, S_FLIPY);
	ldhl	sp,	#0
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;main.c:364: set_sprite_prop(OAM_START + 2, S_FLIPX);
	ldhl	sp,	#1
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
;main.c:365: set_sprite_prop(OAM_START + 3, S_FLIPX | S_FLIPY);
	ldhl	sp,	#2
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x60
;main.c:366: set_sprite_prop(OAM_START + 5, S_FLIPY);
	ldhl	sp,	#4
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;main.c:366: set_sprite_prop(OAM_START + 5, S_FLIPY);
;main.c:367: }
	add	sp, #8
	ret
;main.c:369: void DestroyLongTarget(int8_t OAM_START, int8_t OAM_END)
;	---------------------------------
; Function DestroyLongTarget
; ---------------------------------
_DestroyLongTarget::
	add	sp, #-4
;main.c:371: for (int8_t i = OAM_START; i < OAM_END - 2; i++)
	ldhl	sp,	#6
	ld	c, (hl)
00106$:
	ldhl	sp,	#7
	ld	a, (hl)
	push	af
	rlca
	sbc	a, a
	ld	b, a
	pop	af
	ld	e, a
	ld	d, b
	ld	hl, #0x0002
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, e
	ld	(hl+), a
	inc	hl
	ld	a, c
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00135$
	bit	7, d
	jr	NZ, 00136$
	cp	a, a
	jr	00136$
00135$:
	bit	7, d
	jr	Z, 00136$
	scf
00136$:
	jr	NC, 00101$
;main.c:373: set_sprite_tile(i, 16);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x10
;main.c:371: for (int8_t i = OAM_START; i < OAM_END - 2; i++)
	inc	c
	jr	00106$
00101$:
;main.c:375: for (int8_t i = OAM_START + 4; i < OAM_END; i++)
	ldhl	sp,	#6
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
	inc	c
00109$:
	ldhl	sp,	#7
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00137$
	bit	7, d
	jr	NZ, 00138$
	cp	a, a
	jr	00138$
00137$:
	bit	7, d
	jr	Z, 00138$
	scf
00138$:
	jr	NC, 00111$
;main.c:377: set_sprite_tile(i, 17);
	ld	b, c
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x11
;main.c:375: for (int8_t i = OAM_START + 4; i < OAM_END; i++)
	inc	c
	jr	00109$
00111$:
;main.c:379: }
	add	sp, #4
	ret
;main.c:381: void SpawnBigTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t OAM_END, int8_t TargetNumber)
;	---------------------------------
; Function SpawnBigTarget
; ---------------------------------
_SpawnBigTarget::
	add	sp, #-6
;main.c:386: Objects[TargetNumber].x = x;
	ldhl	sp,	#12
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
;main.c:387: Objects[TargetNumber].y = y;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:388: Objects[TargetNumber].type = Big;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x00
;main.c:389: Objects[TargetNumber].width = 13;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x0d
;main.c:390: Objects[TargetNumber].height = 13;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x0d
;main.c:391: Objects[TargetNumber].oamStart = OAM_START;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#10
;main.c:392: Objects[TargetNumber].oamEnd = OAM_END;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:393: Objects[TargetNumber].ishit = false;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;main.c:396: TargetList++;
	ld	hl, #_TargetList
	inc	(hl)
;main.c:398: for (int8_t i = OAM_START; i < OAM_END; i++)
	ldhl	sp,	#10
	ld	c, (hl)
00111$:
	ldhl	sp,	#11
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00126$
	bit	7, d
	jr	NZ, 00127$
	cp	a, a
	jr	00127$
00126$:
	bit	7, d
	jr	Z, 00127$
	scf
00127$:
	jr	NC, 00101$
;main.c:400: set_sprite_tile(i, 11);
	ld	b, c
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x0b
;main.c:398: for (int8_t i = OAM_START; i < OAM_END; i++)
	inc	c
	jr	00111$
00101$:
;main.c:403: move_sprite(OAM_START, x, y);
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
;main.c:404: move_sprite(OAM_START + 1, x + 8, y);
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
	ld	a, (hl-)
	ld	c, a
	ld	a, (hl+)
	inc	hl
	inc	a
	ld	(hl), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:405: move_sprite(OAM_START + 2, x, y + 8);
	ld	a, e
	add	a, #0x08
	ldhl	sp,	#4
	ld	(hl), a
	ld	c, (hl)
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x02
	ldhl	sp,	#5
	ld	(hl), a
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(de), a
	inc	de
	ldhl	sp,	#0
;main.c:406: move_sprite(OAM_START + 3, x + 8, y + 8);
	ld	a, (hl+)
	ld	(de), a
	ld	c, (hl)
	inc	c
	inc	c
	inc	c
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:408: set_sprite_prop(OAM_START + 2, S_FLIPY);
	ldhl	sp,	#5
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x40
;main.c:409: set_sprite_prop(OAM_START + 1, S_FLIPX);
	ldhl	sp,	#3
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x20
;main.c:410: set_sprite_prop(OAM_START + 3, S_FLIPX | S_FLIPY);
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x60
;main.c:410: set_sprite_prop(OAM_START + 3, S_FLIPX | S_FLIPY);
;main.c:411: }
	add	sp, #6
	ret
;main.c:413: void MoveLongTarget(int8_t OAM_START, int8_t x, int8_t y)
;	---------------------------------
; Function MoveLongTarget
; ---------------------------------
_MoveLongTarget::
	add	sp, #-6
;main.c:415: move_sprite(OAM_START, x, y);
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
;main.c:416: move_sprite(OAM_START + 1, x, y + 8);
	ld	a, (hl-)
	ld	(bc), a
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#3
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	inc	a
	ldhl	sp,	#5
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(bc), a
;main.c:417: move_sprite(OAM_START + 2, x + 16, y);
	ld	a, (hl+)
	add	a, #0x10
	ld	c, a
	ld	b, c
	ld	e, (hl)
	inc	e
	inc	e
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
;main.c:418: move_sprite(OAM_START + 3, x + 16, y + 8);
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#3
;main.c:419: move_sprite(OAM_START + 4, x + 8, y);
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
	ld	a, (hl+)
	add	a, #0x08
	ld	c, a
	ld	b, c
	ld	e, (hl)
	inc	e
	inc	e
	inc	e
	inc	e
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
;main.c:420: move_sprite(OAM_START + 5, x + 8, y + 8);
	ld	a, (hl+)
	inc	hl
	ld	(de), a
	inc	de
	ld	a, b
	ld	(de), a
	ld	a, (hl)
	add	a, #0x05
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:420: move_sprite(OAM_START + 5, x + 8, y + 8);
;main.c:421: }
	add	sp, #6
	ret
;main.c:423: void MoveBigTarget(int8_t OAM_START, int8_t x, int8_t y)
;	---------------------------------
; Function MoveBigTarget
; ---------------------------------
_MoveBigTarget::
	add	sp, #-6
;main.c:425: move_sprite(OAM_START, x, y);
	ldhl	sp,	#10
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM+0
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:426: move_sprite(OAM_START + 1, x + 8, y);
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	(hl), a
	ld	a, (hl+)
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	inc	a
	ldhl	sp,	#5
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
;main.c:427: move_sprite(OAM_START + 2, x, y + 8);
	ldhl	sp,	#0
	ld	a, (hl+)
	inc	hl
	add	a, #0x08
	ld	c, a
	ld	b, c
	ld	e, (hl)
	inc	e
	inc	e
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	e, l
	ld	d, h
	ldhl	sp,	#1
;main.c:428: move_sprite(OAM_START + 3, x + 8, y + 8);
	ld	a, (hl+)
	ld	(de), a
	ld	b, (hl)
	inc	b
	inc	b
	inc	b
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	l, b
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:428: move_sprite(OAM_START + 3, x + 8, y + 8);
;main.c:429: }
	add	sp, #6
	ret
;main.c:431: void DestroyBigTarget(int8_t OAM_START, int8_t OAM_END)
;	---------------------------------
; Function DestroyBigTarget
; ---------------------------------
_DestroyBigTarget::
;main.c:433: for (int8_t i = OAM_START; i < OAM_END; i++)
	ldhl	sp,	#2
	ld	c, (hl)
00104$:
	ldhl	sp,	#3
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00119$
	bit	7, d
	jr	NZ, 00120$
	cp	a, a
	jr	00120$
00119$:
	bit	7, d
	jr	Z, 00120$
	scf
00120$:
	ret	NC
;main.c:435: set_sprite_tile(i, 16);
	ld	b, c
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x10
;main.c:433: for (int8_t i = OAM_START; i < OAM_END; i++)
	inc	c
;main.c:437: }
	jr	00104$
;main.c:439: void SpawnSmallTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t TargetNumber)
;	---------------------------------
; Function SpawnSmallTarget
; ---------------------------------
_SpawnSmallTarget::
;main.c:442: Objects[TargetNumber].x = x;
	ldhl	sp,	#5
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
;main.c:443: Objects[TargetNumber].y = y;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:444: Objects[TargetNumber].width = 8;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x08
;main.c:445: Objects[TargetNumber].height = 8;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x08
;main.c:446: Objects[TargetNumber].type = Small;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x01
;main.c:447: Objects[TargetNumber].oamStart = OAM_START;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;main.c:448: Objects[TargetNumber].ishit = false;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;main.c:450: TargetList++;
	ld	hl, #_TargetList
	inc	(hl)
;main.c:452: set_sprite_tile(OAM_START, 13);
	ldhl	sp,	#4
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x0d
;main.c:453: move_sprite(OAM_START, x, y);
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:453: move_sprite(OAM_START, x, y);
;main.c:454: }
	ret
;main.c:456: void DestroySmallTarget(int8_t OAM_START)
;	---------------------------------
; Function DestroySmallTarget
; ---------------------------------
_DestroySmallTarget::
;main.c:458: set_sprite_tile(OAM_START, 18);
	ldhl	sp,	#2
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x12
;main.c:458: set_sprite_tile(OAM_START, 18);
;main.c:459: }
	ret
;main.c:461: void SetTargetToHorizontalMove(int8_t TargetNumber, int8_t MoveNumber, int8_t Min_X, int8_t Max_X, int8_t Speed, int8_t Rail_X, int8_t Rail_Y, int8_t Rail_Width)
;	---------------------------------
; Function SetTargetToHorizontalMove
; ---------------------------------
_SetTargetToHorizontalMove::
;main.c:463: Objects[TargetNumber].canMove = true;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;main.c:464: Objects[TargetNumber].move_number = MoveNumber;
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:466: MovingObjects[MoveNumber].min_x = Min_X;
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_MovingObjects
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#4
;main.c:467: MovingObjects[MoveNumber].max_x = Max_X;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
;main.c:468: MovingObjects[MoveNumber].speed = Speed;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:469: MovingObjects[MoveNumber].move_number = MoveNumber;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:470: MovingObjects[MoveNumber].type = Horizontal;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x00
;main.c:472: set_bkg_tile_xy(Rail_X, Rail_Y, 37);
	ld	a, #0x25
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:474: for (int8_t i = 1; i < Rail_Width; i++)
	ld	c, #0x01
00103$:
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	jr	NC, 00101$
;main.c:476: set_bkg_tile_xy((Rail_X + i), Rail_Y, 38);
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, c
	ld	h, #0x26
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:474: for (int8_t i = 1; i < Rail_Width; i++)
	inc	c
	jr	00103$
00101$:
;main.c:479: set_bkg_tile_xy((Rail_X + Rail_Width), Rail_Y, 39);
	ldhl	sp,	#7
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ld	h, #0x27
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:480: }
	ret
;main.c:482: void SetTargetToVerticalMove(int8_t TargetNumber, int8_t MoveNumber, int8_t Min_Y, int8_t Max_Y, int8_t Speed, int8_t Rail_X, int8_t Rail_Y, int8_t Rail_Height)
;	---------------------------------
; Function SetTargetToVerticalMove
; ---------------------------------
_SetTargetToVerticalMove::
;main.c:484: Objects[TargetNumber].canMove = true;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;main.c:485: Objects[TargetNumber].move_number = MoveNumber;
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:487: MovingObjects[MoveNumber].min_y = Min_Y;
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_MovingObjects
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
;main.c:488: MovingObjects[MoveNumber].max_y = Max_Y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
;main.c:489: MovingObjects[MoveNumber].speed = Speed;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:490: MovingObjects[MoveNumber].move_number = MoveNumber;
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(bc), a
;main.c:491: MovingObjects[MoveNumber].type = Vertical;
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x01
;main.c:493: set_bkg_tile_xy(Rail_X, Rail_Y, 40);
	ld	a, #0x28
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:495: for (int8_t i = 1; i < Rail_Height; i++)
	ld	c, #0x01
00103$:
	ldhl	sp,	#9
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	jr	NC, 00101$
;main.c:497: set_bkg_tile_xy(Rail_X, (Rail_Y + i), 41);
	ldhl	sp,	#8
	ld	a, (hl)
	add	a, c
	ld	h, #0x29
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:495: for (int8_t i = 1; i < Rail_Height; i++)
	inc	c
	jr	00103$
00101$:
;main.c:500: set_bkg_tile_xy(Rail_X, (Rail_Y + Rail_Height), 42);
	ldhl	sp,	#8
	ld	a, (hl+)
	add	a, (hl)
	ld	h, #0x2a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	ldhl	sp,	#9
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:501: }
	ret
;main.c:503: void SpawnSwitch(int8_t x, int8_t y, int8_t ObjectNumber, int8_t SwitchNumber, int8_t box_x, int8_t box_y, int8_t box_width, int8_t box_height, int8_t SwitchObjectNumber)
;	---------------------------------
; Function SpawnSwitch
; ---------------------------------
_SpawnSwitch::
;main.c:505: Objects[ObjectNumber].x = ((x + 1) * 8) - 2;
	ldhl	sp,	#4
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
;main.c:506: Objects[ObjectNumber].y = (y + 2) * 8;
	ld	a, (hl+)
	inc	a
	add	a, a
	add	a, a
	add	a, a
	dec	a
	dec	a
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	inc	a
	inc	a
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;main.c:507: Objects[ObjectNumber].width = 8;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x08
;main.c:508: Objects[ObjectNumber].height = 8;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x08
;main.c:509: Objects[ObjectNumber].type = Switch;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x04
;main.c:510: Objects[ObjectNumber].ishit = false;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;main.c:511: Objects[ObjectNumber].switch_number = SwitchNumber;
	ld	hl, #0x0008
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
;main.c:513: set_bkg_tile_xy(x, y, 43);
	ld	a, (hl-)
	dec	hl
	ld	(bc), a
	ld	a, #0x2b
	push	af
	inc	sp
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:515: Switches[SwitchNumber].switch_number = SwitchNumber;
	ldhl	sp,	#5
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc,#_Switches
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#5
	ld	a, (hl)
	ld	(bc), a
;main.c:516: Switches[SwitchNumber].object_number = SwitchObjectNumber;
	ld	e, c
	ld	d, b
	inc	de
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(de), a
;main.c:517: Switches[SwitchNumber].box_X = box_x;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#6
;main.c:518: Switches[SwitchNumber].box_y = box_y;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:519: Switches[SwitchNumber].box_width = box_width;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
;main.c:520: Switches[SwitchNumber].box_height = box_height;
	ld	a, (hl+)
	ld	(de), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:521: }
	ret
;main.c:523: void SpawnArrow(int8_t x, int8_t y, int8_t ObjectsNumber, int8_t Direction, int8_t ArrowNumber)
;	---------------------------------
; Function SpawnArrow
; ---------------------------------
_SpawnArrow::
;main.c:525: Objects[ObjectsNumber].x = ((x + 1) * 8) - 2;
	ldhl	sp,	#4
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
;main.c:526: Objects[ObjectsNumber].y = (y + 2) * 8;
	ld	a, (hl+)
	inc	a
	add	a, a
	add	a, a
	add	a, a
	dec	a
	dec	a
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	inc	a
	inc	a
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
;main.c:527: Objects[ObjectsNumber].width = 8;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x08
;main.c:528: Objects[ObjectsNumber].height = 4;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x04
;main.c:529: Objects[ObjectsNumber].type = Arrow;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x05
;main.c:530: Objects[ObjectsNumber].ishit = true;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x01
;main.c:531: Objects[ObjectsNumber].arrow_number = ArrowNumber;
	ld	hl, #0x0009
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(bc), a
;main.c:533: Arrows[ArrowNumber].arrow_number = ArrowNumber;
	ld	bc, #_Arrows+0
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	inc	de
	ldhl	sp,	#6
;main.c:534: Arrows[ArrowNumber].direction = Direction;
	ld	a, (hl-)
	ld	(de), a
	ld	a, (hl)
	ld	(bc), a
;main.c:536: set_bkg_tile_xy(x, y, (Direction + 45));
	ld	a, (hl-)
	dec	hl
	add	a, #0x2d
	push	af
	inc	sp
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:537: }
	ret
;main.c:539: void SpawnTallTarget(int8_t x, int8_t y, int8_t TargetNumber, int8_t OAM_START)
;	---------------------------------
; Function SpawnTallTarget
; ---------------------------------
_SpawnTallTarget::
	dec	sp
;main.c:541: Objects[TargetNumber].x = x;
	ldhl	sp,	#5
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#3
;main.c:542: Objects[TargetNumber].y = y;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:543: Objects[TargetNumber].width = 8;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x08
;main.c:544: Objects[TargetNumber].height = 16;
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0x10
;main.c:545: Objects[TargetNumber].type = Tall;
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x06
;main.c:546: Objects[TargetNumber].oamStart = OAM_START;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;main.c:547: Objects[TargetNumber].ishit = false;
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0x00
;main.c:549: set_sprite_tile(OAM_START, 14);
	ldhl	sp,	#6
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x0e
;main.c:550: set_sprite_tile(OAM_START + 1, 15);
	ld	a, c
	inc	a
	ldhl	sp,	#0
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
	inc	hl
	inc	hl
	ld	(hl), #0x0f
;main.c:552: move_sprite(OAM_START, x, y);
	ldhl	sp,	#4
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:553: move_sprite(OAM_START + 1, x, y + 8);
	ld	a, b
	add	a, #0x08
	ld	b, a
	ldhl	sp,	#0
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:553: move_sprite(OAM_START + 1, x, y + 8);
;main.c:554: }
	inc	sp
	ret
;main.c:556: void ResetLevel()
;	---------------------------------
; Function ResetLevel
; ---------------------------------
_ResetLevel::
;main.c:558: TargetList = 0;
	ld	hl, #_TargetList
	ld	(hl), #0x00
;main.c:560: for (int8_t i = 0; i < 10; i++)
	ld	c, #0x00
00111$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00101$
;main.c:563: set_win_tiles(0, 0, 20, 1, WindowMap);
	ld	de, #_WindowMap
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:565: Objects[i].x = 0;
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	a, #<(_Objects)
	add	a, l
	ld	e, a
	ld	a, #>(_Objects)
	adc	a, h
	ld	d, a
	xor	a, a
	ld	(de), a
;main.c:566: Objects[i].y = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x00
;main.c:567: Objects[i].oamStart = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:568: Objects[i].oamEnd = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:569: Objects[i].width = 0;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x00
;main.c:570: Objects[i].height = 0;
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x00
;main.c:571: Objects[i].canMove = false;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;main.c:572: Objects[i].ishit = false;
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0x00
;main.c:573: Objects[i].move_number = 5;
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x05
;main.c:574: Objects[i].switch_number = 5;
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x05
;main.c:575: Objects[i].arrow_number = 5;
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x05
;main.c:560: for (int8_t i = 0; i < 10; i++)
	inc	c
	jr	00111$
00101$:
;main.c:578: for (int8_t i = 0; i < 4; i++)
	ld	c, #0x00
00114$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x84
	jr	NC, 00102$
;main.c:580: MovingObjects[i].move_number = 5;
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	a, l
	add	a, #<(_MovingObjects)
	ld	e, a
	ld	a, h
	adc	a, #>(_MovingObjects)
	ld	d, a
	ld	a, #0x05
	ld	(de), a
;main.c:581: MovingObjects[i].max_x = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:582: MovingObjects[i].max_y = 0;
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x00
;main.c:583: MovingObjects[i].min_x = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:584: MovingObjects[i].min_y = 0;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x00
;main.c:585: MovingObjects[i].type = 0;
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x00
;main.c:586: MovingObjects[i].speed = 0;
	inc	de
	xor	a, a
	ld	(de), a
;main.c:578: for (int8_t i = 0; i < 4; i++)
	inc	c
	jr	00114$
00102$:
;main.c:589: for (int8_t i = 0; i < 3; i++)
	ld	c, #0x00
00117$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x83
	jr	NC, 00103$
;main.c:591: Switches[i].switch_number = 4;
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, l
	add	a, #<(_Switches)
	ld	e, a
	ld	a, h
	adc	a, #>(_Switches)
	ld	d, a
	ld	a, #0x04
	ld	(de), a
;main.c:592: Switches[i].object_number = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	(hl), #0x00
;main.c:593: Switches[i].box_height = 0;
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x00
;main.c:594: Switches[i].box_width = 0;
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x00
;main.c:595: Switches[i].box_X = 0;
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:596: Switches[i].box_y = 0;
	inc	de
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;main.c:598: Arrows[i].direction = 4;
	ld	a, c
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
	add	hl, hl
	ld	de, #_Arrows
	add	hl, de
;main.c:599: Arrows[i].arrow_number = 4;
	ld	a, #0x04
	ld	(hl+), a
	ld	(hl), #0x04
;main.c:589: for (int8_t i = 0; i < 3; i++)
	inc	c
	jr	00117$
00103$:
;main.c:602: EffectPosition[0] = 0;
	ld	bc, #_EffectPosition+0
	xor	a, a
	ld	(bc), a
;main.c:603: EffectPosition[1] = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
;main.c:604: EffectMoveCheck = 0;
	ld	hl, #_EffectMoveCheck
	ld	(hl), #0x00
;main.c:605: EffectYMover = 0;
	ld	hl, #_EffectYMover
	ld	(hl), #0x00
;main.c:607: for (int8_t j = 7; j < 33; j++)
	ld	c, #0x07
00120$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0xa1
	ret	NC
;main.c:609: move_sprite(j, 0, 0);
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;main.c:610: set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPX);
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
;main.c:610: set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPX);
	res	5, b
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), b
;main.c:611: set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPY);
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	l, c
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	b, (hl)
;main.c:611: set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPY);
	res	6, b
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), b
;main.c:607: for (int8_t j = 7; j < 33; j++)
	inc	c
;main.c:613: }
	jr	00120$
;main.c:615: void SetBullets(int8_t AmmoLimit)
;	---------------------------------
; Function SetBullets
; ---------------------------------
_SetBullets::
;main.c:617: Ammo = 0;
	ld	hl, #_Ammo
;main.c:619: for (int8_t i = 0; i < AmmoLimit; i++)
	ld	(hl), #0x00
	ld	c, (hl)
00103$:
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00118$
	bit	7, d
	jr	NZ, 00119$
	cp	a, a
	jr	00119$
00118$:
	bit	7, d
	jr	Z, 00119$
	scf
00119$:
	ret	NC
;main.c:621: WindowMap[Ammo] = 0x21;
	ld	a, (#_Ammo)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_WindowMap
	add	hl, de
	ld	(hl), #0x21
;main.c:622: Ammo++;
	ld	hl, #_Ammo
	inc	(hl)
;main.c:623: set_win_tiles(0, 0, 20, 1, WindowMap);
	ld	de, #_WindowMap
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:619: for (int8_t i = 0; i < AmmoLimit; i++)
	inc	c
;main.c:625: }
	jr	00103$
;main.c:627: void PrepareLevel()
;	---------------------------------
; Function PrepareLevel
; ---------------------------------
_PrepareLevel::
;main.c:629: LevelMap[167] = 0x3C;
	ld	hl, #(_LevelMap + 167)
	ld	(hl), #0x3c
;main.c:630: LevelMap[168] = 0x35;
	ld	hl, #(_LevelMap + 168)
	ld	(hl), #0x35
;main.c:631: LevelMap[169] = 0x46;
	ld	hl, #(_LevelMap + 169)
	ld	(hl), #0x46
;main.c:632: LevelMap[170] = 0x35;
	ld	hl, #(_LevelMap + 170)
	ld	(hl), #0x35
;main.c:633: LevelMap[171] = 0x3C;
	ld	hl, #(_LevelMap + 171)
	ld	(hl), #0x3c
;main.c:637: LevelMap[173] = numberspriteList[0];
	ld	bc, #_LevelMap + 173
;main.c:635: if (Levels > 9)
	ld	hl, #_Levels
	ld	e, (hl)
	ld	a,#0x09
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00111$
	bit	7, d
	jr	NZ, 00112$
	cp	a, a
	jr	00112$
00111$:
	bit	7, d
	jr	Z, 00112$
	scf
00112$:
	jr	NC, 00102$
;main.c:637: LevelMap[173] = numberspriteList[0];
	ld	de, #_numberspriteList+0
	ld	a, (de)
	ld	(bc), a
;main.c:638: LevelMap[174] = numberspriteList[Levels - 9];
	ld	bc, #_LevelMap + 174
	ld	a, (#_Levels)
	add	a, #0xf7
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
	jr	00103$
00102$:
;main.c:642: LevelMap[173] = numberspriteList[Levels - 1];
	ld	a, (#_Levels)
	dec	a
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_numberspriteList
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
00103$:
;main.c:645: set_bkg_tiles(0, 0, 20, 18, LevelMap);
	ld	de, #_LevelMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:647: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;main.c:649: BulletPosition[0] = 0;
	ld	bc, #_BulletPosition+0
	xor	a, a
	ld	(bc), a
;main.c:650: BulletPosition[1] = 0;
	inc	bc
	xor	a, a
	ld	(bc), a
;main.c:651: PlayerPosition[0] = 80;
	ld	hl, #_PlayerPosition
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:652: movePlayer(PlayerPosition[0], PlayerPosition[1]);
	ld	a, (#(_PlayerPosition + 2) + 0)
	ld	hl, #_PlayerPosition
	ld	b, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_movePlayer
	pop	hl
;main.c:654: perfomantdelay(125);
	ld	a, #0x7d
	push	af
	inc	sp
	call	_perfomantdelay
	inc	sp
;main.c:656: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:658: LevelMap[167] = 0x00;
	ld	hl, #(_LevelMap + 167)
	ld	(hl), #0x00
;main.c:659: LevelMap[168] = 0x00;
	ld	hl, #(_LevelMap + 168)
	ld	(hl), #0x00
;main.c:660: LevelMap[169] = 0x00;
	ld	hl, #(_LevelMap + 169)
	ld	(hl), #0x00
;main.c:661: LevelMap[170] = 0x00;
	ld	hl, #(_LevelMap + 170)
	ld	(hl), #0x00
;main.c:662: LevelMap[171] = 0x00;
	ld	hl, #(_LevelMap + 171)
	ld	(hl), #0x00
;main.c:663: LevelMap[173] = 0x00;
	ld	hl, #(_LevelMap + 173)
	ld	(hl), #0x00
;main.c:664: LevelMap[174] = 0x00;
	ld	hl, #(_LevelMap + 174)
	ld	(hl), #0x00
;main.c:666: set_bkg_tiles(0, 0, 20, 18, LevelMap);
	ld	de, #_LevelMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:667: }
	ret
;main.c:669: void switchLevel(int8_t ChangeLevel)
;	---------------------------------
; Function switchLevel
; ---------------------------------
_switchLevel::
;main.c:671: ResetLevel();
	call	_ResetLevel
;main.c:673: PrepareLevel();
	call	_PrepareLevel
;main.c:675: SetBullets(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_SetBullets
	inc	sp
;main.c:677: switch (ChangeLevel)
	ldhl	sp,	#2
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x81
	jp	C, 00110$
	ld	e, (hl)
	ld	a,#0x08
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00123$
	bit	7, d
	jr	NZ, 00124$
	cp	a, a
	jr	00124$
00123$:
	bit	7, d
	jr	Z, 00124$
	scf
00124$:
	jp	C, 00110$
	ldhl	sp,	#2
	ld	c, (hl)
	dec	c
	ld	b, #0x00
	ld	hl, #00125$
	add	hl, bc
	add	hl, bc
	add	hl, bc
	jp	(hl)
00125$:
	jp	00101$
	jp	00102$
	jp	00103$
	jp	00104$
	jp	00105$
	jp	00106$
	jp	00107$
	jp	00108$
;main.c:679: case 1:
00101$:
;main.c:680: SpawnBigTarget(80, 42, 7, 11, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x0b
	push	hl
	ld	hl, #0x72a
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:681: SpawnBigTarget(50, 67, 11, 15, 1);
	ld	hl, #0x10f
	push	hl
	ld	hl, #0xb43
	push	hl
	ld	a, #0x32
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:682: SpawnBigTarget(110, 67, 15, 19, 2);
	ld	hl, #0x213
	push	hl
	ld	hl, #0xf43
	push	hl
	ld	a, #0x6e
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:683: break;
	jp	00110$
;main.c:684: case 2:
00102$:
;main.c:685: SpawnSmallTarget(60, 72, 7, 0);
	ld	hl, #0x07
	push	hl
	ld	hl, #0x483c
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:686: SpawnSmallTarget(108, 72, 9, 1);
	ld	hl, #0x109
	push	hl
	ld	hl, #0x486c
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:687: SpawnLongTarget(77, 48, 11, 17, 2);
	ld	hl, #0x211
	push	hl
	ld	hl, #0xb30
	push	hl
	ld	a, #0x4d
	push	af
	inc	sp
	call	_SpawnLongTarget
	add	sp, #5
;main.c:688: break;
	jp	00110$
;main.c:689: case 3:
00103$:
;main.c:690: SpawnBigTarget(80, 84, 7, 11, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x0b
	push	hl
	ld	hl, #0x754
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:691: SetTargetToHorizontalMove(0, 0, 42, 119, 1, 5, 9, 9);
	ld	hl, #0x909
	push	hl
	ld	hl, #0x501
	push	hl
	ld	hl, #0x772a
	push	hl
	xor	a, a
	rrca
	push	af
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:692: SpawnBigTarget(68, 60, 12, 16, 1);
	ld	hl, #0x110
	push	hl
	ld	hl, #0xc3c
	push	hl
	ld	a, #0x44
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:693: SetTargetToHorizontalMove(1, 1, 42, 119, -1, 5, 6, 9);
	ld	hl, #0x906
	push	hl
	ld	hl, #0x5ff
	push	hl
	ld	hl, #0x772a
	push	hl
	ld	hl, #0x101
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:694: SpawnBigTarget(96, 36, 17, 21, 2);
	ld	hl, #0x215
	push	hl
	ld	hl, #0x1124
	push	hl
	ld	a, #0x60
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:695: SetTargetToHorizontalMove(2, 2, 42, 119, 1, 5, 3, 9);
	ld	hl, #0x903
	push	hl
	ld	hl, #0x501
	push	hl
	ld	hl, #0x772a
	push	hl
	ld	hl, #0x202
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:696: break;
	jp	00110$
;main.c:697: case 4:
00104$:
;main.c:698: SpawnSmallTarget(96, 64, 7, 0);
	ld	hl, #0x07
	push	hl
	ld	hl, #0x4060
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:699: SetTargetToHorizontalMove(0, 0, 53, 115, 1, 6, 6, 7);
	ld	hl, #0x706
	push	hl
	ld	hl, #0x601
	push	hl
	ld	hl, #0x7335
	push	hl
	xor	a, a
	rrca
	push	af
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:700: DrawWall(12, 8, 4, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x408
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:701: DrawWall(4, 8, 4, 2, 2);
	ld	hl, #0x202
	push	hl
	ld	hl, #0x408
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:702: break;
	jp	00110$
;main.c:704: case 5:
00105$:
;main.c:706: DrawWall(12, 8, 2, 2, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	hl, #0x208
	push	hl
	ld	a, #0x0c
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:707: DrawWall(6, 3, 2, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x203
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:709: SpawnBigTarget(80, 108, 7, 11, 2);
	ld	hl, #0x20b
	push	hl
	ld	hl, #0x76c
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:710: SetTargetToHorizontalMove(2, 0, 44, 118, -1, 5, 12, 9);
	ld	hl, #0x90c
	push	hl
	ld	hl, #0x5ff
	push	hl
	ld	hl, #0x762c
	push	hl
	ld	hl, #0x02
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:712: SpawnSmallTarget(70, 80, 11, 3);
	ld	hl, #0x30b
	push	hl
	ld	hl, #0x5046
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:713: SetTargetToHorizontalMove(3, 1, 44, 96, 1, 5, 8, 6);
	ld	hl, #0x608
	push	hl
	ld	hl, #0x501
	push	hl
	ld	hl, #0x602c
	push	hl
	ld	hl, #0x103
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:715: SpawnSmallTarget(90, 40, 13, 4);
	ld	hl, #0x40d
	push	hl
	ld	hl, #0x285a
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:716: SetTargetToHorizontalMove(4, 2, 72, 122, 1, 8, 3, 6);
	ld	hl, #0x603
	push	hl
	ld	hl, #0x801
	push	hl
	ld	hl, #0x7a48
	push	hl
	ld	hl, #0x204
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:718: break;
	jp	00110$
;main.c:719: case 6:
00106$:
;main.c:721: DrawWall(9, 7, 2, 2, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	hl, #0x207
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:722: DrawWall(9, 11, 2, 2, 1);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x20b
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:723: DrawWall(4, 11, 2, 2, 2);
	ld	hl, #0x202
	push	hl
	ld	hl, #0x20b
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:724: DrawWall(6, 11, 3, 2, 3);
	ld	hl, #0x302
	push	hl
	ld	hl, #0x30b
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:726: SpawnSwitch(14, 8, 4, 0, 6, 11, 3, 2, 3);
	ld	hl, #0x302
	push	hl
	ld	hl, #0x30b
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	ld	hl, #0x04
	push	hl
	ld	hl, #0x80e
	push	hl
	call	_SpawnSwitch
	add	sp, #9
;main.c:728: SpawnLongTarget(80, 36, 7, 14, 5);
	ld	hl, #0x50e
	push	hl
	ld	hl, #0x724
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	call	_SpawnLongTarget
	add	sp, #5
;main.c:729: SetTargetToHorizontalMove(5, 0, 40, 112, -2, 5, 3, 9);
	ld	hl, #0x903
	push	hl
	ld	hl, #0x5fe
	push	hl
	ld	hl, #0x7028
	push	hl
	ld	hl, #0x05
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:731: SpawnSmallTarget(70, 80, 14, 6);
	ld	hl, #0x60e
	push	hl
	ld	hl, #0x5046
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:732: SetTargetToHorizontalMove(6, 1, 44, 72, 1, 5, 8, 3);
	ld	hl, #0x308
	push	hl
	ld	hl, #0x501
	push	hl
	ld	hl, #0x482c
	push	hl
	ld	hl, #0x106
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:734: SpawnBigTarget(100, 100, 16, 21, 7);
	ld	hl, #0x715
	push	hl
	ld	hl, #0x1064
	push	hl
	ld	a, #0x64
	push	af
	inc	sp
	call	_SpawnBigTarget
	add	sp, #5
;main.c:735: SetTargetToHorizontalMove(7, 2, 94, 118, -1, 11, 11, 3);
	ld	hl, #0x30b
	push	hl
	ld	hl, #0xbff
	push	hl
	ld	hl, #0x765e
	push	hl
	ld	hl, #0x207
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:737: break;
	jp	00110$
;main.c:739: case 7:
00107$:
;main.c:741: DrawWall(9, 10, 7, 3, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x03
	push	hl
	ld	hl, #0x70a
	push	hl
	ld	a, #0x09
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:743: SpawnArrow(6, 5, 1, Right, 0);
	xor	a, a
	rrca
	push	af
	xor	a, a
	ld	hl, #0x105
	push	hl
	ld	a, #0x06
	push	af
	inc	sp
	call	_SpawnArrow
	add	sp, #5
;main.c:745: SpawnTallTarget(120, 52, 2, 7);
	ld	hl, #0x702
	push	hl
	ld	hl, #0x3478
	push	hl
	call	_SpawnTallTarget
	add	sp, #4
;main.c:747: SetTargetToVerticalMove(2, 0, 36, 74, -1, 14, 3, 5);
	ld	hl, #0x503
	push	hl
	ld	hl, #0xeff
	push	hl
	ld	hl, #0x4a24
	push	hl
	ld	hl, #0x02
	push	hl
	call	_SetTargetToVerticalMove
	add	sp, #8
;main.c:749: break;
	jr	00110$
;main.c:751: case 8:
00108$:
;main.c:753: DrawWall(11, 5, 1, 4, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	hl, #0x105
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:755: SpawnSwitch(7, 12, 1, 0, 11, 5, 1, 4, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x04
	push	hl
	ld	hl, #0x105
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	ld	hl, #0x01
	push	hl
	ld	hl, #0xc07
	push	hl
	call	_SpawnSwitch
	add	sp, #9
;main.c:757: DrawWall(11, 3, 5, 2, 2);
	ld	hl, #0x202
	push	hl
	ld	hl, #0x503
	push	hl
	ld	a, #0x0b
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:759: DrawWall(4, 9, 8, 2, 3);
	ld	hl, #0x302
	push	hl
	ld	hl, #0x809
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	call	_DrawWall
	add	sp, #5
;main.c:761: SpawnSmallTarget(48, 40, 7, 4);
	ld	hl, #0x407
	push	hl
	ld	hl, #0x2830
	push	hl
	call	_SpawnSmallTarget
	add	sp, #4
;main.c:763: SetTargetToHorizontalMove(4, 0, 44, 83, -1, 5, 3, 4);
	ld	hl, #0x403
	push	hl
	ld	hl, #0x5ff
	push	hl
	ld	hl, #0x532c
	push	hl
	ld	hl, #0x04
	push	hl
	call	_SetTargetToHorizontalMove
	add	sp, #8
;main.c:771: }
00110$:
;main.c:773: NextLevelHasStarted = true;
	ld	hl, #_NextLevelHasStarted
	ld	(hl), #0x01
;main.c:774: }
	ret
;main.c:776: void UpdateHealth(int8_t Number)
;	---------------------------------
; Function UpdateHealth
; ---------------------------------
_UpdateHealth::
;main.c:778: if (Ammo <= 0 && TargetList != 0)
	ld	hl, #_Ammo
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00116$
	bit	7, d
	jr	NZ, 00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z, 00117$
	scf
00117$:
	jr	C, 00102$
	ld	a, (#_TargetList)
	or	a, a
	jr	Z, 00102$
;main.c:780: Lives--;
	ld	hl, #_Lives
	dec	(hl)
;main.c:781: Number--;
	ldhl	sp,	#2
	dec	(hl)
;main.c:782: switchLevel(Levels);
	ld	a, (#_Levels)
	push	af
	inc	sp
	call	_switchLevel
	inc	sp
;main.c:783: PlayerPosition[0] = 80;
	ld	hl, #_PlayerPosition
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:784: SetBullets(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_SetBullets
	inc	sp
00102$:
;main.c:787: WindowMap[19] = numberspriteList[Number - 1];
	ld	bc, #_WindowMap + 19
	ld	de, #_numberspriteList+0
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, de
	ld	a, (hl)
	ld	(bc), a
;main.c:788: set_win_tiles(0, 0, 20, 1, WindowMap);
	ld	de, #_WindowMap
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:789: }
	ret
;main.c:791: void removeTargetfromList()
;	---------------------------------
; Function removeTargetfromList
; ---------------------------------
_removeTargetfromList::
;main.c:793: TargetList--;
	ld	hl, #_TargetList
	dec	(hl)
;main.c:795: if (TargetList <= 0)
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	ret	C
;main.c:797: Levels++;
	ld	hl, #_Levels
	inc	(hl)
;main.c:798: switchLevel(Levels);
	ld	a, (hl)
	push	af
	inc	sp
	call	_switchLevel
	inc	sp
;main.c:800: }
	ret
;main.c:802: void SpawnBullet()
;	---------------------------------
; Function SpawnBullet
; ---------------------------------
_SpawnBullet::
;main.c:805: if (BulletIsShooting == false)
	ld	hl, #_BulletIsShooting
	bit	0, (hl)
	ret	NZ
;main.c:807: Abletoshoot = false;
	ld	hl, #_Abletoshoot
	ld	(hl), #0x00
;main.c:810: Ammo--;
	ld	hl, #_Ammo
	dec	(hl)
;main.c:811: WindowMap[Ammo] = 0x00;
	ld	bc, #_WindowMap+0
	ld	a, (hl)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	(hl), #0x00
;main.c:812: set_win_tiles(0, 0, 20, 1, WindowMap); // Update HUD
	push	bc
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;main.c:815: for (int8_t i = 0; i < 2; i++)
	ld	c, #0x00
00107$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x82
	jr	NC, 00101$
;main.c:817: BulletPosition[i] = PlayerPosition[i];
	ld	a, c
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_BulletPosition
	add	hl, de
	ld	a, e
	add	a, a
	rl	d
	add	a, #<(_PlayerPosition)
	ld	e, a
	ld	a, d
	adc	a, #>(_PlayerPosition)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;main.c:815: for (int8_t i = 0; i < 2; i++)
	inc	c
	jr	00107$
00101$:
;main.c:821: BulletPosition[0] += 4;
	ld	a, (#_BulletPosition + 0)
	add	a, #0x04
	ld	(#_BulletPosition),a
;main.c:822: BulletPosition[1] -= 5;
	ld	bc, #_BulletPosition + 1
	ld	a, (bc)
	add	a, #0xfb
	ld	(bc), a
;main.c:824: makeSound(0x3D, 0x05, 0xF2, 0x00, 0x87);
	push	bc
	ld	a, #0x87
	push	af
	inc	sp
	ld	hl, #0xf2
	push	hl
	ld	hl, #0x53d
	push	hl
	call	_makeSound
	add	sp, #5
	pop	bc
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x08
;main.c:828: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	ld	a, (bc)
	ld	c, a
	ld	hl, #_BulletPosition
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:831: BulletIsShooting = true;
	ld	hl, #_BulletIsShooting
	ld	(hl), #0x01
;main.c:833: }
	ret
;main.c:835: void SpawnEffectsOnBullet()
;	---------------------------------
; Function SpawnEffectsOnBullet
; ---------------------------------
_SpawnEffectsOnBullet::
	dec	sp
	dec	sp
;main.c:837: BulletIsShooting = false;
	ld	hl, #_BulletIsShooting
	ld	(hl), #0x00
;main.c:840: for (int8_t i = 5; i < 7; i++)
	ld	c, #0x05
00105$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x87
	jp	NC, 00101$
;main.c:842: EffectMoveCheck = (i > 5) ? 1 : 0;
	ld	e, c
	ld	a,#0x05
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00127$
	bit	7, d
	jr	NZ, 00128$
	cp	a, a
	jr	00128$
00127$:
	bit	7, d
	jr	Z, 00128$
	scf
00128$:
	jr	NC, 00109$
	ld	a, #0x01
;	spillPairReg hl
;	spillPairReg hl
	jr	00110$
00109$:
	xor	a, a
;	spillPairReg hl
;	spillPairReg hl
00110$:
	ld	(_EffectMoveCheck), a
;main.c:844: EffectPosition[i - (i - EffectMoveCheck)] = BulletPosition[0];
	ld	a, c
	ld	hl, #_EffectMoveCheck
	sub	a, (hl)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_EffectPosition
	add	hl, de
	ld	b, l
	ld	a, h
	ld	hl, #_BulletPosition
	push	af
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	pop	af
	ld	e, b
	ld	d, a
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
;main.c:846: set_sprite_tile(i, 9);
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x09
;main.c:848: move_sprite(i, EffectPosition[i - (i - EffectMoveCheck)], BulletPosition[1]);
	ld	a, (#(_BulletPosition + 1) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, c
	ld	hl, #_EffectMoveCheck
	sub	a, (hl)
	ld	b, a
	ld	a, c
	sub	a, b
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	hl, #_EffectPosition
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ld	b, c
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:850: EffectMoveCheck = 0;
	ld	hl, #_EffectMoveCheck
	ld	(hl), #0x00
;main.c:840: for (int8_t i = 5; i < 7; i++)
	inc	c
	jp	00105$
00101$:
;main.c:852: EffectCurrentY = BulletPosition[1];
	ld	a, (#(_BulletPosition + 1) + 0)
	ld	(#_EffectCurrentY),a
;main.c:855: BulletEffectChecker = true;
	ld	hl, #_BulletEffectChecker
	ld	(hl), #0x01
;main.c:856: }
	inc	sp
	inc	sp
	ret
;main.c:858: void CheckIfEffectsIsOutofScreenX()
;	---------------------------------
; Function CheckIfEffectsIsOutofScreenX
; ---------------------------------
_CheckIfEffectsIsOutofScreenX::
;main.c:862: if (EffectPosition[0] < 37 && EffectPosition[0] > 0 || EffectPosition[0] > -126 && EffectPosition[0] < 0)
	ld	hl, #_EffectPosition
	ld	c, (hl)
	ld	a, c
	xor	a, #0x80
	sub	a, #0xa5
	jr	NC, 00107$
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00149$
	bit	7, d
	jr	NZ, 00150$
	cp	a, a
	jr	00150$
00149$:
	bit	7, d
	jr	Z, 00150$
	scf
00150$:
	jr	C, 00103$
00107$:
	ld	e, c
	ld	a,#0x82
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00151$
	bit	7, d
	jr	NZ, 00152$
	cp	a, a
	jr	00152$
00151$:
	bit	7, d
	jr	Z, 00152$
	scf
00152$:
	jr	NC, 00104$
	bit	7, c
	jr	Z, 00104$
00103$:
;main.c:864: EffectPosition[0] = 0;
	ld	hl, #_EffectPosition
	ld	(hl), #0x00
;main.c:865: move_sprite(5, EffectPosition[0], 0);
	ld	hl, #_EffectPosition
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), c
;main.c:866: if (EffectPosition[1] == 0)
	ld	a, (#(_EffectPosition + 1) + 0)
	or	a, a
	jr	NZ, 00104$
;main.c:868: SwitchPlayerEyeFrames(0);
	xor	a, a
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
;main.c:869: UpdateHealth(Lives);
	ld	a, (#_Lives)
	push	af
	inc	sp
	call	_UpdateHealth
	inc	sp
;main.c:870: Abletoshoot = true;
	ld	hl, #_Abletoshoot
	ld	(hl), #0x01
;main.c:871: BulletEffectChecker = false;
	ld	hl, #_BulletEffectChecker
	ld	(hl), #0x00
00104$:
;main.c:874: if (EffectPosition[1] > -126 && EffectPosition[1] < 0 || EffectPosition[1] < 37 && EffectPosition[1] > 0)
	ld	hl, #_EffectPosition + 1
	ld	c, (hl)
	ld	e, c
	ld	a,#0x82
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00153$
	bit	7, d
	jr	NZ, 00154$
	cp	a, a
	jr	00154$
00153$:
	bit	7, d
	jr	Z, 00154$
	scf
00154$:
	jr	NC, 00114$
	bit	7, c
	jr	NZ, 00110$
00114$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0xa5
	ret	NC
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00155$
	bit	7, d
	jr	NZ, 00156$
	cp	a, a
	jr	00156$
00155$:
	bit	7, d
	jr	Z, 00156$
	scf
00156$:
	ret	NC
00110$:
;main.c:876: EffectPosition[1] = 0;
	ld	(hl), #0x00
;main.c:877: move_sprite(6, EffectPosition[1], 0);
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 24)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), c
;main.c:878: if (EffectPosition[0] == 0)
	ld	a, (#_EffectPosition + 0)
	or	a, a
	ret	NZ
;main.c:880: SwitchPlayerEyeFrames(0);
	xor	a, a
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
;main.c:881: UpdateHealth(Lives);
	ld	a, (#_Lives)
	push	af
	inc	sp
	call	_UpdateHealth
	inc	sp
;main.c:882: Abletoshoot = true;
	ld	hl, #_Abletoshoot
	ld	(hl), #0x01
;main.c:883: BulletEffectChecker = false;
	ld	hl, #_BulletEffectChecker
	ld	(hl), #0x00
;main.c:886: }
	ret
;main.c:888: void CheckIfBulletColliding()
;	---------------------------------
; Function CheckIfBulletColliding
; ---------------------------------
_CheckIfBulletColliding::
	add	sp, #-21
;main.c:891: if (BulletPosition[1] <= 30 && BulletPosition[1] >= 0)
	ld	a, (#(_BulletPosition + 1) + 0)
	ldhl	sp,#20
	ld	(hl), a
	ld	e, (hl)
	ld	a,#0x1e
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00368$
	bit	7, d
	jr	NZ, 00369$
	cp	a, a
	jr	00369$
00368$:
	bit	7, d
	jr	Z, 00369$
	scf
00369$:
	jr	C, 00158$
	ldhl	sp,	#20
	bit	7, (hl)
	jr	NZ, 00158$
;main.c:894: BulletPosition[1]--; // <-- dont ask why this is here :(
	ld	a, (hl)
	dec	a
	ld	(#(_BulletPosition + 1)),a
;main.c:897: EffectYMover = 0;
	ld	hl, #_EffectYMover
	ld	(hl), #0x00
;main.c:900: BulletIsShooting = false;
	ld	hl, #_BulletIsShooting
	ld	(hl), #0x00
;main.c:903: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 1;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x01
;main.c:906: makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x3e
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:909: SpawnEffectsOnBullet();
	call	_SpawnEffectsOnBullet
;main.c:912: BulletPosition[0] = -20;
	ld	hl, #_BulletPosition
	ld	(hl), #0xec
;main.c:913: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	ld	hl, #(_BulletPosition + 1)
	ld	b, (hl)
	ld	hl, #_BulletPosition
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:913: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	jp	00184$
00158$:
;main.c:915: else if (BulletPosition[0] <= 36 && BulletPosition[0] >= 0 || BulletPosition[0] >= -127 && BulletPosition[0] <= 0)
	ld	hl, #_BulletPosition
	ld	c, (hl)
	ld	e, c
	ld	a,#0x24
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00370$
	bit	7, d
	jr	NZ, 00371$
	cp	a, a
	jr	00371$
00370$:
	bit	7, d
	jr	Z, 00371$
	scf
00371$:
	jr	C, 00156$
	bit	7, c
	jr	Z, 00151$
00156$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x01
	jr	C, 00222$
	ld	e, c
	xor	a, a
	ld	d, a
	sub	a, c
	bit	7, e
	jr	Z, 00372$
	bit	7, d
	jr	NZ, 00373$
	cp	a, a
	jr	00373$
00372$:
	bit	7, d
	jr	Z, 00373$
	scf
00373$:
	jr	C, 00222$
00151$:
;main.c:919: EffectYMover = -2;
	ld	hl, #_EffectYMover
	ld	(hl), #0xfe
;main.c:922: BulletIsShooting = false;
	ld	hl, #_BulletIsShooting
	ld	(hl), #0x00
;main.c:925: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 1;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x01
;main.c:928: makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x3e
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:931: SpawnEffectsOnBullet();
	call	_SpawnEffectsOnBullet
;main.c:934: BulletPosition[0] = -20;
	ld	hl, #_BulletPosition
	ld	(hl), #0xec
;main.c:935: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	ld	hl, #(_BulletPosition + 1)
	ld	b, (hl)
	ld	hl, #_BulletPosition
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:935: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	jp	00184$
;main.c:939: for (int8_t i = 0; i <= 10; i++)
00222$:
	ldhl	sp,	#17
	ld	(hl), #0x00
00182$:
	ldhl	sp,	#17
	ld	e, (hl)
	ld	a,#0x0a
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00374$
	bit	7, d
	jr	NZ, 00375$
	cp	a, a
	jr	00375$
00374$:
	bit	7, d
	jr	Z, 00375$
	scf
00375$:
	jp	C, 00184$
;main.c:941: if (collisionCheck(BulletPosition[0], BulletPosition[1], 5, 8, Objects[i].x, Objects[i].y, Objects[i].width, Objects[i].height))
	ldhl	sp,	#17
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ld	hl, #(_BulletPosition + 1)
	ld	c, (hl)
	ld	a, (#_BulletPosition + 0)
	ldhl	sp,	#15
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#17
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	bc
	inc	sp
	ld	h, #0x08
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_collisionCheck
	add	sp, #8
	ld	a, e
	or	a, a
	jp	Z, 00183$
;main.c:943: if (NextLevelHasStarted)
	ld	hl, #_NextLevelHasStarted
	bit	0, (hl)
	jr	Z, 00106$
;main.c:945: for (int8_t j = 0; j < 10; j++)
	ldhl	sp,	#18
	ld	(hl), #0x00
00167$:
	ldhl	sp,	#18
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00104$
;main.c:947: Objects[j].ishit = false;
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	bc,#_Objects
	add	hl,bc
	ld	c, l
	ld	b, h
	ld	hl, #0x000a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
;main.c:948: if (Objects[j].type == Wall || Objects[j].type == Arrow)
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl)
	cp	a, #0x03
	jr	Z, 00101$
	sub	a, #0x05
	jr	NZ, 00168$
00101$:
;main.c:950: Objects[j].ishit = true;
	ldhl	sp,	#15
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x01
00168$:
;main.c:945: for (int8_t j = 0; j < 10; j++)
	ldhl	sp,	#18
	inc	(hl)
	jr	00167$
00104$:
;main.c:953: NextLevelHasStarted = false;
	ld	hl, #_NextLevelHasStarted
	ld	(hl), #0x00
00106$:
;main.c:957: switch (Objects[i].type)
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#18
	ld	(hl), a
	ld	a, #0x06
	sub	a, (hl)
	jp	C, 00142$
;main.c:964: if (Objects[i].ishit)
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl), a
;main.c:973: DestroySmallTarget(Objects[i].oamStart);
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
;main.c:992: DestroyBigTarget(Objects[i].oamStart, Objects[i].oamEnd);
	ldhl	sp,	#19
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;main.c:957: switch (Objects[i].type)
	dec	hl
	dec	hl
	inc	bc
	inc	bc
	inc	bc
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #00379$
	add	hl, de
	add	hl, de
	add	hl, de
	jp	(hl)
00379$:
	jp	00111$
	jp	00107$
	jp	00115$
	jp	00119$
	jp	00120$
	jp	00218$
	jp	00138$
;main.c:959: case Small:
00107$:
;main.c:962: EffectYMover = 1;
	ld	hl, #_EffectYMover
	ld	(hl), #0x01
;main.c:964: if (Objects[i].ishit)
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00109$
;main.c:966: makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x3e
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:967: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
	jp	00143$
00109$:
;main.c:971: makeSound(0x3D, 0xFF, 0xF3, 0xE1, 0x87);
	ld	hl, #0x87e1
	push	hl
	ld	hl, #0xf3ff
	push	hl
	ld	a, #0x3d
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
;main.c:972: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x02
;main.c:973: DestroySmallTarget(Objects[i].oamStart);
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	af
	inc	sp
	call	_DestroySmallTarget
	inc	sp
;main.c:976: break;
	jp	00143$
;main.c:978: case Big:
00111$:
;main.c:981: EffectYMover = 1;
	ld	hl, #_EffectYMover
	ld	(hl), #0x01
;main.c:983: if (Objects[i].ishit)
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00113$
;main.c:985: makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x3e
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:986: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
	jp	00143$
00113$:
;main.c:990: makeSound(0x3D, 0xE3, 0xF3, 0xFF, 0x87);
	push	bc
	ld	hl, #0x87ff
	push	hl
	ld	hl, #0xf3e3
	push	hl
	ld	a, #0x3d
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
	pop	bc
;main.c:991: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x02
;main.c:992: DestroyBigTarget(Objects[i].oamStart, Objects[i].oamEnd);
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_DestroyBigTarget
	pop	hl
;main.c:994: break;
	jp	00143$
;main.c:996: case Long:
00115$:
;main.c:998: EffectYMover = 1;
	ld	hl, #_EffectYMover
	ld	(hl), #0x01
;main.c:1000: if (Objects[i].ishit)
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00117$
;main.c:1002: makeSound(0x4A, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x4a
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:1003: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
	jp	00143$
00117$:
;main.c:1007: makeSound(0x1F, 0xE9, 0xF4, 0xFF, 0x87);
	push	bc
	ld	hl, #0x87ff
	push	hl
	ld	hl, #0xf4e9
	push	hl
	ld	a, #0x1f
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
	pop	bc
;main.c:1008: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x02
;main.c:1009: DestroyLongTarget(Objects[i].oamStart, Objects[i].oamEnd);
	ld	a, (bc)
	ld	b, a
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_DestroyLongTarget
	pop	hl
;main.c:1011: break;
	jp	00143$
;main.c:1013: case Wall:
00119$:
;main.c:1014: EffectYMover = 0;
	ld	hl, #_EffectYMover
	ld	(hl), #0x00
;main.c:1015: makeSound(0x4A, 0x20, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x204a
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:1016: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
;main.c:1017: break;
	jp	00143$
;main.c:1019: case Switch:
00120$:
;main.c:1020: if (!Objects[i].ishit)
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jp	NZ, 00127$
;main.c:1022: makeSound(0x50, 0xF2, 0xF4, 0xA8, 0x87);
	push	bc
	ld	hl, #0x87a8
	push	hl
	ld	hl, #0xf4f2
	push	hl
	ld	a, #0x50
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
	pop	bc
;main.c:1023: set_bkg_tile_xy((Objects[i].x / 8), (Objects[i].y / 8) - 2, 44);
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00186$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
00186$:
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, e
	add	a, #0xfe
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	ld	a, (hl+)
	inc	hl
	ld	(hl-), a
	dec	hl
	bit	7, (hl)
	jr	Z, 00187$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
00187$:
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl+)
	inc	hl
	ld	e, a
	sra	e
	rr	d
	sra	e
	rr	d
	sra	e
	rr	d
	ld	a, #0x2c
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:1024: EffectYMover = 2;
	ld	hl, #_EffectYMover
	ld	(hl), #0x02
;main.c:1026: for (int8_t j = 0; j < 3; j++)
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#18
	ld	(hl), #0x00
00176$:
	ldhl	sp,	#18
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jp	NC, 00128$
;main.c:1028: if (Objects[i].switch_number == Switches[j].switch_number)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	ld	(hl-), a
	ld	e, (hl)
	ld	a, e
	rlca
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	a, l
	add	a, #<(_Switches)
	ld	e, a
	ld	a, h
	adc	a, #>(_Switches)
	ld	d, a
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, (hl)
	jp	NZ,00177$
;main.c:1030: for (int8_t t = 0; t < Switches[j].box_width; t++)
	ldhl	sp,	#6
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#19
	ld	(hl), #0x00
00173$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00382$
	bit	7, d
	jr	NZ, 00383$
	cp	a, a
	jr	00383$
00382$:
	bit	7, d
	jr	Z, 00383$
	scf
00383$:
	jp	NC, 00177$
;main.c:1032: for (int8_t b = 0; b < Switches[j].box_height; b++)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl), a
	ldhl	sp,	#20
	ld	(hl), #0x00
00170$:
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
	ld	e, (hl)
	ldhl	sp,	#20
	ld	d, (hl)
	ld	a, (hl)
	ldhl	sp,	#16
	sub	a, (hl)
	bit	7, e
	jr	Z, 00384$
	bit	7, d
	jr	NZ, 00385$
	cp	a, a
	jr	00385$
00384$:
	bit	7, d
	jr	Z, 00385$
	scf
00385$:
	jr	NC, 00121$
;main.c:1034: set_bkg_tile_xy((Switches[j].box_X + t), (Switches[j].box_y + b), 0);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	add	a, (hl)
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#19
	add	a, (hl)
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#17
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
;main.c:1032: for (int8_t b = 0; b < Switches[j].box_height; b++)
	ldhl	sp,	#20
	inc	(hl)
	jr	00170$
00121$:
;main.c:1037: Objects[Switches[j].object_number].x = 0;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_Objects
	add	hl, de
	ld	(hl), #0x00
;main.c:1038: Objects[Switches[j].object_number].y = 0;
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_Objects
	add	hl, de
	inc	hl
	ld	(hl), #0x00
;main.c:1039: Objects[Switches[j].object_number].width = 0;
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_Objects
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:1040: Objects[Switches[j].object_number].height = 0;
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #_Objects
	add	hl, de
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;main.c:1030: for (int8_t t = 0; t < Switches[j].box_width; t++)
	ldhl	sp,	#19
	inc	(hl)
	jp	00173$
00177$:
;main.c:1026: for (int8_t j = 0; j < 3; j++)
	ldhl	sp,	#18
	inc	(hl)
	jp	00176$
00127$:
;main.c:1047: EffectYMover = 2;
	ld	hl, #_EffectYMover
	ld	(hl), #0x02
;main.c:1048: makeSound(0x4A, 0x20, 0xF3, 0xA0, 0x9A);
	push	bc
	ld	hl, #0x9aa0
	push	hl
	ld	hl, #0xf320
	push	hl
	ld	a, #0x4a
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
	pop	bc
;main.c:1049: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
00128$:
;main.c:1052: Objects[i].ishit = true;
	ld	a, #0x01
	ld	(bc), a
;main.c:1054: break;
	jp	00143$
;main.c:1058: for (int8_t j = 0; j < 3; j++)
00218$:
	ldhl	sp,#19
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ldhl	sp,	#20
	ld	(hl), #0x00
00179$:
	ldhl	sp,	#20
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x83
	jp	NC, 00143$
;main.c:1060: if (Objects[i].arrow_number == Arrows[j].arrow_number)
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#20
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	sla	e
	rl	d
	ld	hl, #_Arrows
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	ld	a, (de)
	ld	b, a
	ld	a, c
	sub	a, b
	jr	NZ, 00180$
;main.c:1062: switch (Arrows[j].direction)
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00133$
	cp	a, #0x01
	jr	Z, 00130$
	cp	a, #0x02
	jr	Z, 00132$
	sub	a, #0x03
	jr	Z, 00131$
	jr	00134$
;main.c:1064: case Up:
00130$:
;main.c:1065: BulletCurrentDirection = Up;
	ld	hl, #_BulletCurrentDirection
	ld	(hl), #0x01
;main.c:1066: break;
	jr	00134$
;main.c:1067: case Down:
00131$:
;main.c:1068: BulletCurrentDirection = Down;
	ld	hl, #_BulletCurrentDirection
	ld	(hl), #0x03
;main.c:1069: break;
	jr	00134$
;main.c:1070: case Left:
00132$:
;main.c:1071: BulletCurrentDirection = Left;
	ld	hl, #_BulletCurrentDirection
	ld	(hl), #0x02
;main.c:1072: break;
	jr	00134$
;main.c:1073: case Right:
00133$:
;main.c:1074: BulletCurrentDirection = Right;
	ld	hl, #_BulletCurrentDirection
	ld	(hl), #0x00
;main.c:1076: }
00134$:
;main.c:1078: makeSound(0x3A, 0xE4, 0xF3, 0x50, 0x94);
	ld	hl, #0x9450
	push	hl
	ld	hl, #0xf3e4
	push	hl
	ld	a, #0x3a
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
00180$:
;main.c:1058: for (int8_t j = 0; j < 3; j++)
	ldhl	sp,	#20
	inc	(hl)
	jr	00179$
;main.c:1084: case Tall:
00138$:
;main.c:1086: if (Objects[i].ishit)
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00140$
;main.c:1088: makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
	ld	a, #0x98
	push	af
	inc	sp
	ld	hl, #0xf3
	push	hl
	ld	hl, #0x3e
	push	hl
	call	_makeSound
	add	sp, #5
;main.c:1089: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x03
	jp	00143$
00140$:
;main.c:1093: makeSound(0x8D, 0xA6, 0xF3, 0xC9, 0x91);
	ld	hl, #0x91c9
	push	hl
	ld	hl, #0xf3a6
	push	hl
	ld	a, #0x8d
	push	af
	inc	sp
	call	_makeSound
	add	sp, #5
;main.c:1094: WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
	ld	hl, #_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao
	ld	(hl), #0x02
;main.c:1095: set_sprite_tile(Objects[i].oamStart, 20);
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#19
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00393$:
	ldhl	sp,	#19
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00393$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#15
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#14
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x14
;main.c:1096: set_sprite_tile(Objects[i].oamStart, 19);
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#19
	ld	a, c
	ld	(hl+), a
	ld	(hl), #0x00
	ld	a, #0x02
00394$:
	ldhl	sp,	#19
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00394$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#21
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#20
	ld	(hl-), a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x13
;main.c:1099: break;
	jr	00143$
;main.c:1101: default:
00142$:
;main.c:1102: printf("Bullet Type not found");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;main.c:1104: }
00143$:
;main.c:1106: if (Objects[i].type == Arrow)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#20
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00184$
;main.c:1108: return;
	jr	00145$
00145$:
;main.c:1112: BulletIsShooting = false;
	ld	hl, #_BulletIsShooting
	ld	(hl), #0x00
;main.c:1114: if (!Objects[i].ishit)
	pop	de
	push	de
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	NZ, 00147$
;main.c:1116: removeTargetfromList();
	push	bc
	call	_removeTargetfromList
	pop	bc
00147$:
;main.c:1119: Objects[i].ishit = (!true) ? true : true;
	ld	a, #0x01
	ld	(bc), a
;main.c:1123: SpawnEffectsOnBullet();
	call	_SpawnEffectsOnBullet
;main.c:1125: BulletPosition[0] = -20;
	ld	hl, #_BulletPosition
	ld	(hl), #0xec
;main.c:1126: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	ld	hl, #(_BulletPosition + 1)
	ld	c, (hl)
	ld	hl, #_BulletPosition
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1126: move_sprite(4, BulletPosition[0], BulletPosition[1]);
00183$:
;main.c:939: for (int8_t i = 0; i <= 10; i++)
	ldhl	sp,	#17
	inc	(hl)
	jp	00182$
00184$:
;main.c:1130: }
	add	sp, #21
	ret
___str_0:
	.ascii "Bullet Type not found"
	.db 0x00
;main.c:1132: void UpdateTargetMove()
;	---------------------------------
; Function UpdateTargetMove
; ---------------------------------
_UpdateTargetMove::
	add	sp, #-16
;main.c:1134: if (NextLevelHasStarted)
	ld	hl, #_NextLevelHasStarted
	bit	0, (hl)
	jr	Z, 00163$
;main.c:1136: for (int8_t i = 0; i < 10; i++)
	ld	c, #0x00
00134$:
	ld	a, c
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC, 00163$
;main.c:1138: Objects[i].ishit = false;
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #_Objects
	add	hl, de
	ld	de, #0x000a
	add	hl, de
	ld	(hl), #0x00
;main.c:1136: for (int8_t i = 0; i < 10; i++)
	inc	c
	jr	00134$
;main.c:1142: for (int8_t i = 0; i < 10; i++)
00163$:
	ldhl	sp,	#14
	ld	(hl), #0x00
00140$:
	ldhl	sp,	#14
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x8a
	jp	NC, 00142$
;main.c:1145: if (Objects[i].canMove)
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Objects
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#15
	ld	(hl), a
	ld	a, (hl)
	or	a, a
	jp	Z, 00141$
;main.c:1148: for (int8_t j = 0; j < 5; j++)
	ldhl	sp,	#12
	ld	a, (hl)
	ldhl	sp,	#2
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#15
	ld	(hl), #0x00
00137$:
	ldhl	sp,	#15
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x85
	jp	NC, 00120$
;main.c:1150: if (Objects[i].move_number == MovingObjects[j].move_number && !Objects[i].ishit)
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_Objects
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl+), a
	inc	hl
	ld	c, (hl)
	ld	a, c
	rlca
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	bc,#_MovingObjects
	add	hl,bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#13
	ld	a, (hl)
	sub	a, c
	jp	NZ,00138$
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jp	NZ, 00138$
;main.c:1153: switch (MovingObjects[j].type)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
;main.c:1158: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;main.c:1153: switch (MovingObjects[j].type)
	ld	a, c
	or	a, a
	jr	Z, 00104$
	dec	c
	jp	Z,00110$
	jp	00138$
;main.c:1155: case Horizontal:
00104$:
;main.c:1156: if (Objects[i].x >= MovingObjects[j].max_x)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#10
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
;main.c:1158: MovingObjects[j].speed = -MovingObjects[j].speed;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	xor	a, a
	sub	a, b
;main.c:1156: if (Objects[i].x >= MovingObjects[j].max_x)
	ld	(hl-), a
	ld	e, c
	ld	d, (hl)
	ld	a, (hl)
	sub	a, c
	bit	7, e
	jr	Z, 00251$
	bit	7, d
	jr	NZ, 00252$
	cp	a, a
	jr	00252$
00251$:
	bit	7, d
	jr	Z, 00252$
	scf
00252$:
	jr	C, 00108$
;main.c:1158: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	jr	00109$
00108$:
;main.c:1160: else if (Objects[i].x <= MovingObjects[j].min_x)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#10
	ld	e, (hl)
	ld	a,c
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00253$
	bit	7, d
	jr	NZ, 00254$
	cp	a, a
	jr	00254$
00253$:
	bit	7, d
	jr	Z, 00254$
	scf
00254$:
	jr	C, 00109$
;main.c:1162: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (hl)
	ld	(de), a
00109$:
;main.c:1165: Objects[i].x += MovingObjects[j].speed;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, c
	ld	c, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
;main.c:1166: break;
	jp	00138$
;main.c:1167: case Vertical:
00110$:
;main.c:1169: if (Objects[i].y >= MovingObjects[j].max_y)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#11
	ld	(hl), a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl), a
;main.c:1158: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	xor	a, a
	sub	a, l
	ldhl	sp,	#13
;main.c:1169: if (Objects[i].y >= MovingObjects[j].max_y)
	ld	(hl-), a
	ld	a, (hl-)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl+)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00255$
	bit	7, d
	jr	NZ, 00256$
	cp	a, a
	jr	00256$
00255$:
	bit	7, d
	jr	Z, 00256$
	scf
00256$:
	jr	C, 00114$
;main.c:1171: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
	jr	00115$
00114$:
;main.c:1173: else if (Objects[i].y <= MovingObjects[j].min_y)
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (hl-)
	sub	a, (hl)
	bit	7, e
	jr	Z, 00257$
	bit	7, d
	jr	NZ, 00258$
	cp	a, a
	jr	00258$
00257$:
	bit	7, d
	jr	Z, 00258$
	scf
00258$:
	jr	C, 00115$
;main.c:1175: MovingObjects[j].speed = -MovingObjects[j].speed;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
00115$:
;main.c:1178: Objects[i].y += MovingObjects[j].speed;
	ld	a, (bc)
	ldhl	sp,#8
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	add	a, l
	ld	(bc), a
;main.c:1181: }
00138$:
;main.c:1148: for (int8_t j = 0; j < 5; j++)
	ldhl	sp,	#15
	inc	(hl)
	jp	00137$
00120$:
;main.c:1185: switch (Objects[i].type)
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#15
	ld	(hl), a
;main.c:1189: MoveBigTarget(Objects[i].oamStart, Objects[i].x, Objects[i].y);
	pop	de
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
;main.c:1185: switch (Objects[i].type)
	ldhl	sp,	#15
	ld	a, (hl)
	or	a, a
	jr	Z, 00121$
	ldhl	sp,	#15
	ld	a, (hl)
	dec	a
	jr	Z, 00122$
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, #0x02
	jp	Z,00124$
	ldhl	sp,	#15
	ld	a, (hl)
	sub	a, #0x06
	jr	Z, 00123$
	jp	00125$
;main.c:1187: case Big:
00121$:
;main.c:1189: MoveBigTarget(Objects[i].oamStart, Objects[i].x, Objects[i].y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	h, c
;	spillPairReg hl
;	spillPairReg hl
	ld	l, b
	push	hl
	push	af
	inc	sp
	call	_MoveBigTarget
	add	sp, #3
;main.c:1191: break;
	jp	00141$
;main.c:1193: case Small:
00122$:
;main.c:1195: move_sprite(Objects[i].oamStart, Objects[i].x, Objects[i].y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:1197: break;
	jp	00141$
;main.c:1199: case Tall:
00123$:
;main.c:1201: move_sprite(Objects[i].oamStart, Objects[i].x, Objects[i].y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#15
	ld	(hl), a
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:1202: move_sprite(Objects[i].oamStart + 1, Objects[i].x, Objects[i].y + 8);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	add	a, #0x08
	ldhl	sp,	#13
	ld	(hl+), a
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	inc	a
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#12
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x02
00263$:
	ldhl	sp,	#9
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00263$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_shadow_OAM
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl-)
	dec	hl
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#11
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#10
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(de), a
;main.c:1204: break;
	jr	00141$
;main.c:1206: case Long:
00124$:
;main.c:1208: MoveLongTarget(Objects[i].oamStart, Objects[i].x, Objects[i].y);
	ldhl	sp,#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl+), a
	inc	hl
	pop	de
	push	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#14
	ld	a, (hl)
	push	af
	inc	sp
	call	_MoveLongTarget
	add	sp, #3
;main.c:1210: break;
	jr	00141$
;main.c:1212: default:
00125$:
;main.c:1214: printf("%d", Objects[i].type);
	ldhl	sp,	#15
	ld	c, (hl)
	ld	b, #0x00
	push	bc
	ld	de, #___str_1
	push	de
	call	_printf
	add	sp, #4
;main.c:1216: printf("type not found lmao");
	ld	de, #___str_2
	push	de
	call	_printf
	pop	hl
;main.c:1219: }
00141$:
;main.c:1142: for (int8_t i = 0; i < 10; i++)
	ldhl	sp,	#14
	inc	(hl)
	jp	00140$
00142$:
;main.c:1222: }
	add	sp, #16
	ret
___str_1:
	.ascii "%d"
	.db 0x00
___str_2:
	.ascii "type not found lmao"
	.db 0x00
;main.c:1224: void init() // INIT
;	---------------------------------
; Function init
; ---------------------------------
_init::
;main.c:1226: set_sprite_data(0, 8, Ghost);
	ld	de, #_Ghost
	push	de
	ld	hl, #0x800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1227: set_sprite_data(8, 3, Bullet);
	ld	de, #_Bullet
	push	de
	ld	hl, #0x308
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1228: set_sprite_data(11, 10, TargetSprites);
	ld	de, #_TargetSprites
	push	de
	ld	hl, #0xa0b
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:1229: set_bkg_data(0, 22, LevelTiles);
	ld	de, #_LevelTiles
	push	de
	ld	hl, #0x1600
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1230: set_bkg_tiles(0, 0, 20, 18, LevelMap);
	ld	de, #_LevelMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;main.c:1231: set_bkg_data(22, 14, WindowTileset);
	ld	de, #_WindowTileset
	push	de
	ld	hl, #0xe16
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1232: set_bkg_data(36, 13, BackgroundObjects);
	ld	de, #_BackgroundObjects
	push	de
	ld	hl, #0xd24
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1233: set_bkg_data(49, 26, Font);
	ld	de, #_Font
	push	de
	ld	hl, #0x1a31
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:1234: setupPlayer();
	call	_setupPlayer
;main.c:1236: set_win_tiles(0, 0, 20, 1, WindowMap);
	ld	de, #_WindowMap
	push	de
	ld	hl, #0x114
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;c:/gbdk/include/gb/gb.h:1316: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;main.c:1239: UpdateHealth(Lives);
	ld	a, (#_Lives)
	push	af
	inc	sp
	call	_UpdateHealth
	inc	sp
;main.c:1241: NR52_REG = 0x80;
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;main.c:1242: NR50_REG = 0x77;
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;main.c:1243: NR51_REG = 0xFF;
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
;main.c:1245: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;main.c:1246: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:1247: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;main.c:1248: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;main.c:1249: }
	ret
;main.c:1251: void main() // MAIN CODE EXECUTION
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-3
;main.c:1254: init();
	call	_init
;main.c:1256: switchLevel(Levels);
	ld	a, (#_Levels)
	push	af
	inc	sp
	call	_switchLevel
	inc	sp
;main.c:1258: while (1) // GAME LOOP
00131$:
;main.c:1262: switch (joypad())
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00105$
	cp	a, #0x02
	jr	Z, 00101$
	cp	a, #0x10
	jp	Z,00109$
	sub	a, #0x20
	jp	Z,00114$
	jp	00117$
;main.c:1264: case J_LEFT:
00101$:
;main.c:1265: if (PlayerPosition[0] <= 36)
	ld	hl, #_PlayerPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	e, h
	ld	d, #0x00
	ld	a, #0x24
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00264$
	bit	7, d
	jr	NZ, 00265$
	cp	a, a
	jr	00265$
00264$:
	bit	7, d
	jr	Z, 00265$
	scf
00265$:
	jr	C, 00103$
;main.c:1267: PlayerPosition[0] -= 0;
	ld	c, l
	ld	b, h
	ld	hl, #_PlayerPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1268: Playerframespeed = 15;
	ld	hl, #_Playerframespeed
	ld	(hl), #0x0f
;main.c:1269: SwitchPlayerEyeFrames(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
	jp	00118$
00103$:
;main.c:1273: PlayerPosition[0]--;
	dec	bc
	ld	hl, #_PlayerPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1274: Playerframespeed = 5;
	ld	hl, #_Playerframespeed
	ld	(hl), #0x05
;main.c:1277: break;
	jp	00118$
;main.c:1278: case J_RIGHT:
00105$:
;main.c:1279: if (PlayerPosition[0] >= 124)
	ld	hl, #_PlayerPosition
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	ld	a, l
	sub	a, #0x7c
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00107$
;main.c:1281: PlayerPosition[0] += 0;
	ld	hl, #_PlayerPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1282: Playerframespeed = 15;
	ld	hl, #_Playerframespeed
	ld	(hl), #0x0f
;main.c:1283: SwitchPlayerEyeFrames(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
	jr	00118$
00107$:
;main.c:1287: PlayerPosition[0]++;
	inc	bc
	ld	hl, #_PlayerPosition
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:1288: Playerframespeed = 5;
	ld	hl, #_Playerframespeed
	ld	(hl), #0x05
;main.c:1291: break;
	jr	00118$
;main.c:1292: case J_A:
00109$:
;main.c:1293: if (Abletoshoot && Ammo > 0 && !AisPressed)
	ld	hl, #_Abletoshoot
	bit	0, (hl)
	jr	Z, 00118$
	ld	hl, #_Ammo
	ld	e, (hl)
	xor	a, a
	ld	d, a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00266$
	bit	7, d
	jr	NZ, 00267$
	cp	a, a
	jr	00267$
00266$:
	bit	7, d
	jr	Z, 00267$
	scf
00267$:
	jr	NC, 00118$
	ld	hl, #_AisPressed
	bit	0, (hl)
	jr	NZ, 00118$
;main.c:1295: BulletCurrentDirection = Up;
	ld	hl, #_BulletCurrentDirection
	ld	(hl), #0x01
;main.c:1296: SpawnBullet();
	call	_SpawnBullet
;main.c:1297: AisPressed = true;
	ld	hl, #_AisPressed
	ld	(hl), #0x01
;main.c:1299: break;
	jr	00118$
;main.c:1300: case J_B:
00114$:
;main.c:1301: if (!BisPressed)
	ld	hl, #_BisPressed
	bit	0, (hl)
	jr	NZ, 00118$
;main.c:1303: BisPressed = true;
	ld	(hl), #0x01
;main.c:1304: Levels++;
	ld	hl, #_Levels
	inc	(hl)
;main.c:1305: switchLevel(Levels);
	ld	a, (hl)
	push	af
	inc	sp
	call	_switchLevel
	inc	sp
;main.c:1308: break;
	jr	00118$
;main.c:1309: default:
00117$:
;main.c:1310: Playerframespeed = 7; // set the speed of the Ghost Animation
	ld	hl, #_Playerframespeed
	ld	(hl), #0x07
;main.c:1311: BisPressed = false;
	ld	hl, #_BisPressed
	ld	(hl), #0x00
;main.c:1312: AisPressed = false;
	ld	hl, #_AisPressed
	ld	(hl), #0x00
;main.c:1313: SwitchPlayerEyeFrames(0);
	xor	a, a
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
;main.c:1315: }
00118$:
;main.c:1317: if (BulletIsShooting)
	ld	hl, #_BulletIsShooting
	bit	0, (hl)
	jp	Z, 00128$
;main.c:1320: CheckIfBulletColliding();
	call	_CheckIfBulletColliding
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 19) + 0)
;main.c:1322: set_sprite_prop(4, get_sprite_prop(4) & ~S_FLIPX);
	ld	c, a
	res	5, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), c
;c:/gbdk/include/gb/gb.h:1503: return shadow_OAM[nb].prop;
	ld	a, (#(_shadow_OAM + 19) + 0)
;main.c:1323: set_sprite_prop(4, get_sprite_prop(4) & ~S_FLIPY);
	ld	c, a
	res	6, c
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	(hl), c
;main.c:1325: switch (BulletCurrentDirection)
	ld	a, (#_BulletCurrentDirection)
	or	a, a
	jr	Z, 00122$
	ld	a, (#_BulletCurrentDirection)
	dec	a
	jr	Z, 00119$
	ld	a, (#_BulletCurrentDirection)
	sub	a, #0x02
	jr	Z, 00121$
	ld	a, (#_BulletCurrentDirection)
	sub	a, #0x03
	jr	Z, 00120$
	jr	00123$
;main.c:1327: case Up:
00119$:
;main.c:1328: BulletPosition[1] -= 2;
	ld	bc, #_BulletPosition+1
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x08
;main.c:1330: break;
	jr	00123$
;main.c:1331: case Down:
00120$:
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x08
;main.c:1333: BulletPosition[1] += 2;
	ld	bc, #_BulletPosition+1
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x40
;main.c:1335: break;
	jr	00123$
;main.c:1336: case Left:
00121$:
;main.c:1337: BulletPosition[0] -= 2;
	ld	bc, #_BulletPosition+0
	ld	a, (bc)
	dec	a
	dec	a
	ld	(bc), a
;c:/gbdk/include/gb/gb.h:1493: shadow_OAM[nb].prop=prop;
	ld	hl, #(_shadow_OAM + 19)
	ld	(hl), #0x20
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
;main.c:1340: break;
	jr	00123$
;main.c:1342: case Right:
00122$:
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
	ld	(hl), #0x0a
;main.c:1344: BulletPosition[0] += 2;
	ld	bc, #_BulletPosition+0
	ld	a, (bc)
	add	a, #0x02
	ld	(bc), a
;main.c:1346: }
00123$:
;main.c:1349: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	ld	hl, #_BulletPosition + 1
	ld	b, (hl)
	ld	hl, #_BulletPosition
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 16)
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:1349: move_sprite(4, BulletPosition[0], BulletPosition[1]);
	jp	00129$
00128$:
;main.c:1351: else if (BulletEffectChecker)
	ld	hl, #_BulletEffectChecker
	bit	0, (hl)
	jp	Z, 00129$
;main.c:1354: SwitchPlayerEyeFrames(WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao);
	ld	a, (#_WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao)
	push	af
	inc	sp
	call	_SwitchPlayerEyeFrames
	inc	sp
;main.c:1355: for (int8_t i = 5; i < 7; i++)
	ld	bc, #_EffectPosition+0
	ldhl	sp,	#2
	ld	(hl), #0x05
00146$:
	ldhl	sp,	#2
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x87
	jp	NC, 00129$
;main.c:1357: CheckIfEffectsIsOutofScreenX();
	push	bc
	call	_CheckIfEffectsIsOutofScreenX
	pop	bc
;main.c:1359: EffectMoveCheck = (i > 5) ? 1 : 0;
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a,#0x05
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00272$
	bit	7, d
	jr	NZ, 00273$
	cp	a, a
	jr	00273$
00272$:
	bit	7, d
	jr	Z, 00273$
	scf
00273$:
	ld	a, #0x00
	rla
	or	a, a
	jr	Z, 00150$
	ld	de, #0x0001
	jr	00151$
00150$:
	ld	de, #0x0000
00151$:
	ld	hl, #_EffectMoveCheck
	ld	(hl), e
;main.c:1360: EffectMover = (i > 5) ? 2 : -2;
	or	a, a
	jr	Z, 00152$
	ld	de, #0x0002
	jr	00153$
00152$:
	ld	de, #0xfffe
00153$:
	ld	hl, #_EffectMover
	ld	(hl), e
;main.c:1361: EffectCurrentY += EffectYMover;
	ld	a, (#_EffectCurrentY)
	ld	hl, #_EffectYMover
	add	a, (hl)
	ld	hl, #_EffectCurrentY
	ld	(hl), a
;main.c:1363: move_sprite(i, EffectPosition[i - (i - EffectMoveCheck)] += EffectMover, EffectCurrentY);
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	hl
	ld	a, (hl)
	ld	hl, #_EffectMoveCheck
	sub	a, (hl)
	ld	e, a
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, e
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	rlca
	sbc	a, a
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	hl, #_EffectMover
	add	a, (hl)
	ld	(de), a
	ldhl	sp,	#1
	ld	(hl+), a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;main.c:1365: EffectMoveCheck = 0;
	ld	hl, #_EffectMoveCheck
	ld	(hl), #0x00
;main.c:1355: for (int8_t i = 5; i < 7; i++)
	ldhl	sp,	#2
	inc	(hl)
	jp	00146$
00129$:
;main.c:1370: UpdatePlayerAnimation();
	call	_UpdatePlayerAnimation
;main.c:1372: UpdateTargetMove();
	call	_UpdateTargetMove
;main.c:1375: movePlayer(PlayerPosition[0], PlayerPosition[1]);
	ld	a, (#(_PlayerPosition + 2) + 0)
	ld	hl, #_PlayerPosition
	ld	b, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_movePlayer
	pop	hl
;main.c:1378: wait_vbl_done();
	call	_wait_vbl_done
	jp	00131$
;main.c:1380: }
	add	sp, #3
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__LevelMap:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0d	; 13
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x09	; 9
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x0a	; 10
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x10	; 16
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0c	; 12
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x0b	; 11
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x11	; 17
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x13	; 19
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x12	; 18
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__BackgroundObjects:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0xdb	; 219
	.db #0xa5	; 165
	.db #0xdb	; 219
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xe7	; 231
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x81	; 129
	.db #0x3c	; 60
	.db #0x81	; 129
	.db #0x24	; 36
	.db #0x81	; 129
	.db #0x24	; 36
	.db #0x81	; 129
	.db #0x3c	; 60
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0x81	; 129
	.db #0xa5	; 165
	.db #0x81	; 129
	.db #0xbd	; 189
	.db #0x81	; 129
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x16	; 22
	.db #0x1e	; 30
	.db #0xfb	; 251
	.db #0xf7	; 247
	.db #0x8d	; 141
	.db #0xf3	; 243
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xf3	; 243
	.db #0x1e	; 30
	.db #0x16	; 22
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0xdb	; 219
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x68	; 104	'h'
	.db #0x78	; 120	'x'
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xb1	; 177
	.db #0xcf	; 207
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xcf	; 207
	.db #0x78	; 120	'x'
	.db #0x68	; 104	'h'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0xff	; 255
	.db #0xe7	; 231
	.db #0x99	; 153
	.db #0xe7	; 231
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
__xinit__Font:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x5d	; 93
	.db #0x7e	; 126
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1d	; 29
	.db #0x1e	; 30
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x4a	; 74	'J'
	.db #0x4c	; 76	'L'
	.db #0x54	; 84	'T'
	.db #0x58	; 88	'X'
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x54	; 84	'T'
	.db #0x58	; 88	'X'
	.db #0x4a	; 74	'J'
	.db #0x4c	; 76	'L'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x65	; 101	'e'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x4d	; 77	'M'
	.db #0x4e	; 78	'N'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x55	; 85	'U'
	.db #0x56	; 86	'V'
	.db #0x4a	; 74	'J'
	.db #0x4c	; 76	'L'
	.db #0x35	; 53	'5'
	.db #0x36	; 54	'6'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x54	; 84	'T'
	.db #0x58	; 88	'X'
	.db #0x4a	; 74	'J'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x7a	; 122	'z'
	.db #0x7c	; 124
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x3a	; 58
	.db #0x2c	; 44
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x66	; 102	'f'
	.db #0x55	; 85	'U'
	.db #0x76	; 118	'v'
	.db #0x6d	; 109	'm'
	.db #0x6e	; 110	'n'
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x45	; 69	'E'
	.db #0x46	; 70	'F'
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7d	; 125
	.db #0x7e	; 126
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x7d	; 125
	.db #0x7e	; 126
__xinit__Bullet:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x1c	; 28
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x1e	; 30
	.db #0x0e	; 14
	.db #0x38	; 56	'8'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
__xinit__TargetSprites:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x0b	; 11
	.db #0x09	; 9
	.db #0x16	; 22
	.db #0x12	; 18
	.db #0x0c	; 12
	.db #0x24	; 36
	.db #0x19	; 25
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xbd	; 189
	.db #0x4a	; 74	'J'
	.db #0xad	; 173
	.db #0x52	; 82	'R'
	.db #0xb5	; 181
	.db #0x42	; 66	'B'
	.db #0xbd	; 189
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x0e	; 14
	.db #0x81	; 129
	.db #0x0e	; 14
	.db #0xb1	; 177
	.db #0x0e	; 14
	.db #0xb9	; 185
	.db #0x1e	; 30
	.db #0x9d	; 157
	.db #0x78	; 120	'x'
	.db #0x8d	; 141
	.db #0x70	; 112	'p'
	.db #0x81	; 129
	.db #0x70	; 112	'p'
	.db #0x81	; 129
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x18	; 24
	.db #0x66	; 102	'f'
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x0b	; 11
	.db #0x0f	; 15
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x3d	; 61
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0xad	; 173
	.db #0xe7	; 231
	.db #0xb5	; 181
	.db #0xe7	; 231
	.db #0xbd	; 189
	.db #0xff	; 255
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0e	; 14
	.db #0x8f	; 143
	.db #0x0e	; 14
	.db #0x8f	; 143
	.db #0x0e	; 14
	.db #0xbf	; 191
	.db #0x1e	; 30
	.db #0xa7	; 167
	.db #0x78	; 120	'x'
	.db #0xe5	; 229
	.db #0x70	; 112	'p'
	.db #0xfd	; 253
	.db #0x70	; 112	'p'
	.db #0xf1	; 241
	.db #0x70	; 112	'p'
	.db #0xf1	; 241
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
__xinit__WindowMap:
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x21	; 33
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x22	; 34
	.db #0x23	; 35
	.db #0x20	; 32
	.db #0x18	; 24
__xinit__WindowTileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0xa8	; 168
	.db #0xb0	; 176
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x60	; 96
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0x98	; 152
	.db #0x10	; 16
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0xfa	; 250
	.db #0xfc	; 252
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0xe8	; 232
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x34	; 52	'4'
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x74	; 116	't'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x0a	; 10
	.db #0x0c	; 12
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x68	; 104	'h'
	.db #0x70	; 112	'p'
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x74	; 116	't'
	.db #0x78	; 120	'x'
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x74	; 116	't'
	.db #0x78	; 120	'x'
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x8a	; 138
	.db #0x8c	; 140
	.db #0x74	; 116	't'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x48	; 72	'H'
	.db #0x8c	; 140
	.db #0xb4	; 180
	.db #0xd8	; 216
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x28	; 40
	.db #0x30	; 48	'0'
	.db #0x94	; 148
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x14	; 20
	.db #0x18	; 24
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x2a	; 42
	.db #0x2c	; 44
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0b	; 11
	.db #0x0c	; 12
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xd1	; 209
	.db #0xe1	; 225
	.db #0xa8	; 168
	.db #0x70	; 112	'p'
	.db #0xd4	; 212
	.db #0x38	; 56	'8'
	.db #0xf4	; 244
	.db #0x58	; 88	'X'
	.db #0xf4	; 244
	.db #0x58	; 88	'X'
	.db #0xf5	; 245
	.db #0x59	; 89	'Y'
	.db #0xf4	; 244
	.db #0x18	; 24
__xinit__framecounter:
	.db #0x00	;  0
__xinit__switchPlayerFrame:
	.db #0x00	;  0
__xinit__VelocityY:
	.db #0x00	;  0
__xinit__Playerframespeed:
	.db #0x07	;  7
__xinit__playerinitloopTiles:
	.db #0x00	;  0
__xinit__Levels:
	.db #0x01	;  1
__xinit__Ammo:
	.db #0x05	;  5
__xinit__EffectCurrentY:
	.db #0x00	;  0
__xinit__EffectMoveCheck:
	.db #0x01	;  1
__xinit__EffectMover:
	.db #0x00	;  0
__xinit__EffectYMover:
	.db #0x00	;  0
__xinit__Lives:
	.db #0x03	;  3
__xinit__WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao:
	.db #0x00	;  0
__xinit__TargetList:
	.db #0x00	;  0
__xinit__BulletCurrentDirection:
	.db #0x01	;  1
__xinit__LevelPrepareCountdown:
	.dw #0x0000
__xinit__BulletIsShooting:
	.db #0x00	;  0
__xinit__Abletoshoot:
	.db #0x01	;  1
__xinit__BulletEffectChecker:
	.db #0x00	;  0
__xinit__NextLevelHasStarted:
	.db #0x00	;  0
__xinit__AisPressed:
	.db #0x00	;  0
__xinit__BisPressed:
	.db #0x00	;  0
__xinit__TimerisOn:
	.db #0x00	;  0
__xinit__numberspriteList:
	.db #0x16	;  22
	.db #0x17	;  23
	.db #0x18	;  24
	.db #0x19	;  25
	.db #0x1a	;  26
	.db #0x1b	;  27
	.db #0x1c	;  28
	.db #0x1d	;  29
	.db #0x1e	;  30
	.db #0x1f	;  31
	.area _CABS (ABS)
