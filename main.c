// Import GBDK libaries
#include <gb/gb.h>
#include <stdio.h>
#include <stdbool.h>
#include <rand.h>
#include <time.h>

// Background Data
#include "backgroundData/u3logo_data.c"
#include "backgroundData/u3logo_map.c"
#include "backgroundData/LevelMap.c"
#include "backgroundData/backgroundTilesetData/LevelTiles.c"
#include "backgroundData/BackgroundObjects.c"
#include "backgroundData/Font.c"

// Sprite Data
#include "SpriteData/GhostSprites.c"
#include "SpriteData/Bullet.c"
#include "SpriteData/TargetSprites.c"

// Window Data
#include "SpriteData/WindowTileset/WindowsMap.c"
#include "SpriteData/WindowTileset/WindowTileset.c"

// VARIABLE DECLARATIONS - STORED IN RAM

// integer variables
int8_t framecounter = 0;
int8_t switchPlayerFrame = 0;
int8_t VelocityX, VelocityY = 0;
int8_t Playerframespeed = 7;
int8_t playerinitloopTiles = 0;
int8_t Levels = 1;
int8_t Ammo = 5;
int8_t EffectCurrentY = 0; // this one is actually used for the Effect's Y position
int8_t EffectMoveCheck = 1;
int8_t EffectMover = 0;
int8_t EffectYMover = 0;
int8_t Lives = 3;
int8_t WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 0;
int8_t TargetList = 0;
int8_t BulletCurrentDirection = 1;
int16_t LevelPrepareCountdown = 0;

// Boolean variables :)))) (took some time to find out stdbool.h existed)
bool BulletIsShooting = false;
bool Abletoshoot = true;
bool BulletEffectChecker = false;
bool NextLevelHasStarted = false;
bool AisPressed = false;
bool BisPressed = false;
bool TimerisOn = false;

// Char Variables
char numberspriteList[] = {0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F};

// Int Arrays
int16_t PlayerPosition[2];
int8_t EffectPosition[2]; // this one is not used for X and Y, its for both of the 2 effects's X
int8_t BulletPosition[2];
const int8_t Playerframes[] = {4, 5, 6, 7};
const int8_t PlayerframesReverse[] = {7, 6, 5, 4};

// List of Structs and enums

enum ObjectType
{
    Big,
    Small,
    Long,
    Wall,
    Switch,
    Arrow,
    Tall
};

enum Direction
{
    Right,
    Up,
    Left,
    Down
};

enum MovingObjectType
{
    Horizontal,
    Vertical,
    Path
};

struct Switch
{
    int8_t switch_number;
    int8_t object_number;
    int8_t box_X;
    int8_t box_y;
    int8_t box_width;
    int8_t box_height;
};

struct MovingObject
{
    int8_t move_number;
    int8_t speed;
    int8_t min_x, max_x;
    int8_t min_y, max_y;
    enum MovingObjectType type;
};

struct Object
{
    int8_t x;
    int8_t y;
    int8_t oamStart;
    int8_t oamEnd;
    int8_t width;
    int8_t height;
    int8_t canMove;
    int8_t move_number, switch_number, arrow_number;
    int8_t ishit;
    enum ObjectType type;
};

struct Arrow
{
    enum Direction direction;
    int8_t arrow_number;
};

// Arrays of structs

struct Object Objects[10];

struct MovingObject MovingObjects[5];

struct Switch Switches[3];

struct Arrow Arrows[3];

// Goofy ahh Functions

void perfomantdelay(int8_t numloops)
{
    for (int8_t i = 0; i < numloops; i++)
    {
        wait_vbl_done();
    }
}

int8_t collisionCheck(int8_t x1, int8_t y1, int8_t w1, int8_t h1, int8_t x2, int8_t y2, int8_t w2, int8_t h2)
{

    if ((x1 < (x2 + w2)) && ((x1 + w1) > x2) && (y1 < (h2 + y2)) && ((y1 + h1) > y2))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

void SwitchPlayerEyeFrames(int8_t Frame)
{
    switch (Frame)
    {
    case 0:
        for (int8_t i = 0; i < 2; i++)
        {
            set_sprite_tile(i, 0);
        }
        break;

    case 1:
        for (int8_t i = 0; i < 2; i++)
        {
            set_sprite_tile(i, 1);
        }
        break;
    case 2:
        for (int8_t i = 0; i < 2; i++)
        {
            set_sprite_tile(i, 2);
        }
        break;
    case 3:
        for (int8_t i = 0; i < 2; i++)
        {
            set_sprite_tile(i, 3);
        }
        break;
    }
}

void fadeout(int8_t delay)
{
    for (int8_t i = 0; i < 4; i++)
    {
        switch (i)
        {
        case 0:
            BGP_REG = 0xE4;
            break;

        case 1:
            BGP_REG = 0xF9;
            break;

        case 2:
            BGP_REG = 0xFE;
            break;

        case 3:
            BGP_REG = 0xFF;
            break;
        }
        perfomantdelay(delay);
    }
}

void fadein(int8_t delay)
{
    for (int8_t i = 0; i < 3; i++)
    {
        switch (i)
        {
        case 0:
            BGP_REG = 0xFE;
            break;

        case 1:
            BGP_REG = 0xF9;
            break;

        case 2:
            BGP_REG = 0xE4;
            break;
        }
        perfomantdelay(delay);
    }
}

void makeSound(char sweep, char wave, char envolope, char low, char high)
{
    NR10_REG = sweep;
    NR11_REG = wave;
    NR12_REG = envolope;
    NR13_REG = low;
    NR14_REG = high;
}

void splashscreen()
{
    BGP_REG = 0xFF;
    set_bkg_data(0, 179, u3logo);
    set_bkg_tiles(0, 0, 20, 18, u3logoMap);
    fadein(3);

    // set_bkg_data(0, 179, EmptyData);
    // set_bkg_tiles(0, 0, 20, 18, EmptyData);
}

void movePlayer(int8_t x, int8_t y)
{
    // Working with this cleaner codes
    /*for (int8_t i = 0; i < 4; i++) {

        move_sprite(0, x + NumberX , y + NumberY);
    } */
    move_sprite(0, x, y);
    move_sprite(1, x + 8, y);
    move_sprite(2, x, y + 8);
    move_sprite(3, x + 8, y + 8);
}

void setupPlayer()
{
    PlayerPosition[0] = 80;
    PlayerPosition[1] = 135;

    for (int8_t i = 0; i < 4; i++)
    {
        playerinitloopTiles = (i >= 2) ? (i == 3 ? 7 : 4) : playerinitloopTiles;

        set_sprite_tile(i, playerinitloopTiles);
    }

    set_sprite_prop(1, S_FLIPX);
    set_sprite_prop(3, S_FLIPX);

    movePlayer(PlayerPosition[0], PlayerPosition[1]);
}

void UpdatePlayerAnimation()
{
    framecounter++;

    if (framecounter >= Playerframespeed)
    {
        switchPlayerFrame++;

        switchPlayerFrame = (switchPlayerFrame > 3) ? 0 : switchPlayerFrame;

        set_sprite_tile(2, Playerframes[switchPlayerFrame]);
        set_sprite_tile(3, PlayerframesReverse[switchPlayerFrame]);

        framecounter = 0;
    }
}

void DrawWall(int8_t x, int8_t y, int8_t width, int8_t height, int8_t ObjectNumber)
{

    Objects[ObjectNumber].x = ((x + 1) * 8) - 2;
    Objects[ObjectNumber].y = (y + 1) * 8;
    Objects[ObjectNumber].type = Wall;
    Objects[ObjectNumber].ishit = true;
    Objects[ObjectNumber].width = width * 8;
    Objects[ObjectNumber].height = (height + 1) * 8;

    /*printf("%d\n", Objects[ObjectNumber].x);
    printf("%d\n", Objects[ObjectNumber].y);
    printf("%d\n", Objects[ObjectNumber].width);
    printf("%d\n", Objects[ObjectNumber].height); */

    for (int8_t i = 0; i < width; i++)
    {
        for (int8_t j = 0; j < height; j++)
        {
            set_bkg_tile_xy((x + i), (y + j), 36);
        }
    }
}

void SpawnLongTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t OAM_END, int8_t TargetNumber)
{
    Objects[TargetNumber].x = x;
    Objects[TargetNumber].y = y;
    Objects[TargetNumber].type = Long;
    Objects[TargetNumber].width = 24;
    Objects[TargetNumber].height = 13;
    Objects[TargetNumber].oamStart = OAM_START;
    Objects[TargetNumber].oamEnd = OAM_END;
    Objects[TargetNumber].ishit = false;

    TargetList++;

    set_sprite_tile(OAM_START, 11);
    set_sprite_tile(OAM_START + 1, 11);
    set_sprite_tile(OAM_START + 2, 11);
    set_sprite_tile(OAM_START + 3, 11);
    set_sprite_tile(OAM_START + 4, 12);
    set_sprite_tile(OAM_START + 5, 12);

    move_sprite(OAM_START, x, y);
    move_sprite(OAM_START + 1, x, y + 8);
    move_sprite(OAM_START + 2, x + 16, y);
    move_sprite(OAM_START + 3, x + 16, y + 8);
    move_sprite(OAM_START + 4, x + 8, y);
    move_sprite(OAM_START + 5, x + 8, y + 8);

    set_sprite_prop(OAM_START + 1, S_FLIPY);
    set_sprite_prop(OAM_START + 2, S_FLIPX);
    set_sprite_prop(OAM_START + 3, S_FLIPX | S_FLIPY);
    set_sprite_prop(OAM_START + 5, S_FLIPY);
}

void DestroyLongTarget(int8_t OAM_START, int8_t OAM_END)
{
    for (int8_t i = OAM_START; i < OAM_END - 2; i++)
    {
        set_sprite_tile(i, 16);
    }
    for (int8_t i = OAM_START + 4; i < OAM_END; i++)
    {
        set_sprite_tile(i, 17);
    }
}

void SpawnBigTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t OAM_END, int8_t TargetNumber)

{

    // Setup the Target's stats
    Objects[TargetNumber].x = x;
    Objects[TargetNumber].y = y;
    Objects[TargetNumber].type = Big;
    Objects[TargetNumber].width = 13;
    Objects[TargetNumber].height = 13;
    Objects[TargetNumber].oamStart = OAM_START;
    Objects[TargetNumber].oamEnd = OAM_END;
    Objects[TargetNumber].ishit = false;

    // Add to the list
    TargetList++;

    for (int8_t i = OAM_START; i < OAM_END; i++)
    {
        set_sprite_tile(i, 11);
    }

    move_sprite(OAM_START, x, y);
    move_sprite(OAM_START + 1, x + 8, y);
    move_sprite(OAM_START + 2, x, y + 8);
    move_sprite(OAM_START + 3, x + 8, y + 8);

    set_sprite_prop(OAM_START + 2, S_FLIPY);
    set_sprite_prop(OAM_START + 1, S_FLIPX);
    set_sprite_prop(OAM_START + 3, S_FLIPX | S_FLIPY);
}

void MoveLongTarget(int8_t OAM_START, int8_t x, int8_t y)
{
    move_sprite(OAM_START, x, y);
    move_sprite(OAM_START + 1, x, y + 8);
    move_sprite(OAM_START + 2, x + 16, y);
    move_sprite(OAM_START + 3, x + 16, y + 8);
    move_sprite(OAM_START + 4, x + 8, y);
    move_sprite(OAM_START + 5, x + 8, y + 8);
}

void MoveBigTarget(int8_t OAM_START, int8_t x, int8_t y)
{
    move_sprite(OAM_START, x, y);
    move_sprite(OAM_START + 1, x + 8, y);
    move_sprite(OAM_START + 2, x, y + 8);
    move_sprite(OAM_START + 3, x + 8, y + 8);
}

void DestroyBigTarget(int8_t OAM_START, int8_t OAM_END)
{
    for (int8_t i = OAM_START; i < OAM_END; i++)
    {
        set_sprite_tile(i, 16);
    }
}

void SpawnSmallTarget(int8_t x, int8_t y, int8_t OAM_START, int8_t TargetNumber)
{

    Objects[TargetNumber].x = x;
    Objects[TargetNumber].y = y;
    Objects[TargetNumber].width = 8;
    Objects[TargetNumber].height = 8;
    Objects[TargetNumber].type = Small;
    Objects[TargetNumber].oamStart = OAM_START;
    Objects[TargetNumber].ishit = false;

    TargetList++;

    set_sprite_tile(OAM_START, 13);
    move_sprite(OAM_START, x, y);
}

void DestroySmallTarget(int8_t OAM_START)
{
    set_sprite_tile(OAM_START, 18);
}

void SetTargetToHorizontalMove(int8_t TargetNumber, int8_t MoveNumber, int8_t Min_X, int8_t Max_X, int8_t Speed, int8_t Rail_X, int8_t Rail_Y, int8_t Rail_Width)
{
    Objects[TargetNumber].canMove = true;
    Objects[TargetNumber].move_number = MoveNumber;

    MovingObjects[MoveNumber].min_x = Min_X;
    MovingObjects[MoveNumber].max_x = Max_X;
    MovingObjects[MoveNumber].speed = Speed;
    MovingObjects[MoveNumber].move_number = MoveNumber;
    MovingObjects[MoveNumber].type = Horizontal;

    set_bkg_tile_xy(Rail_X, Rail_Y, 37);

    for (int8_t i = 1; i < Rail_Width; i++)
    {
        set_bkg_tile_xy((Rail_X + i), Rail_Y, 38);
    }

    set_bkg_tile_xy((Rail_X + Rail_Width), Rail_Y, 39);
}

void SetTargetToVerticalMove(int8_t TargetNumber, int8_t MoveNumber, int8_t Min_Y, int8_t Max_Y, int8_t Speed, int8_t Rail_X, int8_t Rail_Y, int8_t Rail_Height)
{
    Objects[TargetNumber].canMove = true;
    Objects[TargetNumber].move_number = MoveNumber;

    MovingObjects[MoveNumber].min_y = Min_Y;
    MovingObjects[MoveNumber].max_y = Max_Y;
    MovingObjects[MoveNumber].speed = Speed;
    MovingObjects[MoveNumber].move_number = MoveNumber;
    MovingObjects[MoveNumber].type = Vertical;

    set_bkg_tile_xy(Rail_X, Rail_Y, 40);

    for (int8_t i = 1; i < Rail_Height; i++)
    {
        set_bkg_tile_xy(Rail_X, (Rail_Y + i), 41);
    }

    set_bkg_tile_xy(Rail_X, (Rail_Y + Rail_Height), 42);
}

void SpawnSwitch(int8_t x, int8_t y, int8_t ObjectNumber, int8_t SwitchNumber, int8_t box_x, int8_t box_y, int8_t box_width, int8_t box_height, int8_t SwitchObjectNumber)
{
    Objects[ObjectNumber].x = ((x + 1) * 8) - 2;
    Objects[ObjectNumber].y = (y + 2) * 8;
    Objects[ObjectNumber].width = 8;
    Objects[ObjectNumber].height = 8;
    Objects[ObjectNumber].type = Switch;
    Objects[ObjectNumber].ishit = false;
    Objects[ObjectNumber].switch_number = SwitchNumber;

    set_bkg_tile_xy(x, y, 43);

    Switches[SwitchNumber].switch_number = SwitchNumber;
    Switches[SwitchNumber].object_number = SwitchObjectNumber;
    Switches[SwitchNumber].box_X = box_x;
    Switches[SwitchNumber].box_y = box_y;
    Switches[SwitchNumber].box_width = box_width;
    Switches[SwitchNumber].box_height = box_height;
}

void SpawnArrow(int8_t x, int8_t y, int8_t ObjectsNumber, int8_t Direction, int8_t ArrowNumber)
{
    Objects[ObjectsNumber].x = ((x + 1) * 8) - 2;
    Objects[ObjectsNumber].y = (y + 2) * 8;
    Objects[ObjectsNumber].width = 8;
    Objects[ObjectsNumber].height = 4;
    Objects[ObjectsNumber].type = Arrow;
    Objects[ObjectsNumber].ishit = true;
    Objects[ObjectsNumber].arrow_number = ArrowNumber;

    Arrows[ArrowNumber].arrow_number = ArrowNumber;
    Arrows[ArrowNumber].direction = Direction;

    set_bkg_tile_xy(x, y, (Direction + 45));
}

void SpawnTallTarget(int8_t x, int8_t y, int8_t TargetNumber, int8_t OAM_START)
{
    Objects[TargetNumber].x = x;
    Objects[TargetNumber].y = y;
    Objects[TargetNumber].width = 8;
    Objects[TargetNumber].height = 16;
    Objects[TargetNumber].type = Tall;
    Objects[TargetNumber].oamStart = OAM_START;
    Objects[TargetNumber].ishit = false;

    set_sprite_tile(OAM_START, 14);
    set_sprite_tile(OAM_START + 1, 15);

    move_sprite(OAM_START, x, y);
    move_sprite(OAM_START + 1, x, y + 8);
}

void ResetLevel()
{
    TargetList = 0;

    for (int8_t i = 0; i < 10; i++)
    {

        set_win_tiles(0, 0, 20, 1, WindowMap);

        Objects[i].x = 0;
        Objects[i].y = 0;
        Objects[i].oamStart = 0;
        Objects[i].oamEnd = 0;
        Objects[i].width = 0;
        Objects[i].height = 0;
        Objects[i].canMove = false;
        Objects[i].ishit = false;
        Objects[i].move_number = 5;
        Objects[i].switch_number = 5;
        Objects[i].arrow_number = 5;
    }

    for (int8_t i = 0; i < 4; i++)
    {
        MovingObjects[i].move_number = 5;
        MovingObjects[i].max_x = 0;
        MovingObjects[i].max_y = 0;
        MovingObjects[i].min_x = 0;
        MovingObjects[i].min_y = 0;
        MovingObjects[i].type = 0;
        MovingObjects[i].speed = 0;
    }

    for (int8_t i = 0; i < 3; i++)
    {
        Switches[i].switch_number = 4;
        Switches[i].object_number = 0;
        Switches[i].box_height = 0;
        Switches[i].box_width = 0;
        Switches[i].box_X = 0;
        Switches[i].box_y = 0;

        Arrows[i].direction = 4;
        Arrows[i].arrow_number = 4;
    }

    EffectPosition[0] = 0;
    EffectPosition[1] = 0;
    EffectMoveCheck = 0;
    EffectYMover = 0;

    for (int8_t j = 7; j < 33; j++)
    {
        move_sprite(j, 0, 0);
        set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPX);
        set_sprite_prop(j, get_sprite_prop(j) & ~S_FLIPY);
    }
}

void SetBullets(int8_t AmmoLimit)
{
    Ammo = 0;

    for (int8_t i = 0; i < AmmoLimit; i++)
    {
        WindowMap[Ammo] = 0x21;
        Ammo++;
        set_win_tiles(0, 0, 20, 1, WindowMap);
    }
}

void PrepareLevel()
{
    LevelMap[167] = 0x3C;
    LevelMap[168] = 0x35;
    LevelMap[169] = 0x46;
    LevelMap[170] = 0x35;
    LevelMap[171] = 0x3C;

    if (Levels > 9)
    {
        LevelMap[173] = numberspriteList[0];
        LevelMap[174] = numberspriteList[Levels - 9];
    }
    else
    {
        LevelMap[173] = numberspriteList[Levels - 1];
    }

    set_bkg_tiles(0, 0, 20, 18, LevelMap);

    HIDE_SPRITES;

    BulletPosition[0] = 0;
    BulletPosition[1] = 0;
    PlayerPosition[0] = 80;
    movePlayer(PlayerPosition[0], PlayerPosition[1]);
    CheckIfEffectsIsOutofScreenX();

    perfomantdelay(125);

    SHOW_SPRITES;

    LevelMap[167] = 0x00;
    LevelMap[168] = 0x00;
    LevelMap[169] = 0x00;
    LevelMap[170] = 0x00;
    LevelMap[171] = 0x00;
    LevelMap[173] = 0x00;
    LevelMap[174] = 0x00;

    set_bkg_tiles(0, 0, 20, 18, LevelMap);
}

void switchLevel(int8_t ChangeLevel)
{
    ResetLevel();

    PrepareLevel();

    SetBullets(5);

    switch (ChangeLevel)
    {
    case 1:
        SpawnBigTarget(80, 42, 7, 11, 0);
        SpawnBigTarget(50, 67, 11, 15, 1);
        SpawnBigTarget(110, 67, 15, 19, 2);
        break;
    case 2:
        SpawnSmallTarget(60, 72, 7, 0);
        SpawnSmallTarget(108, 72, 9, 1);
        SpawnLongTarget(77, 48, 11, 17, 2);
        break;
    case 3:
        SpawnBigTarget(80, 84, 7, 11, 0);
        SetTargetToHorizontalMove(0, 0, 42, 119, 1, 5, 9, 9);
        SpawnBigTarget(68, 60, 12, 16, 1);
        SetTargetToHorizontalMove(1, 1, 42, 119, -1, 5, 6, 9);
        SpawnBigTarget(96, 36, 17, 21, 2);
        SetTargetToHorizontalMove(2, 2, 42, 119, 1, 5, 3, 9);
        break;
    case 4:
        SpawnSmallTarget(96, 64, 7, 0);
        SetTargetToHorizontalMove(0, 0, 53, 115, 1, 6, 6, 7);
        DrawWall(12, 8, 4, 2, 1);
        DrawWall(4, 8, 4, 2, 2);
        break;

    case 5:

        DrawWall(12, 8, 2, 2, 0);
        DrawWall(6, 3, 2, 2, 1);

        SpawnBigTarget(80, 108, 7, 11, 2);
        SetTargetToHorizontalMove(2, 0, 44, 118, -1, 5, 12, 9);

        SpawnSmallTarget(70, 80, 11, 3);
        SetTargetToHorizontalMove(3, 1, 44, 96, 1, 5, 8, 6);

        SpawnSmallTarget(90, 40, 13, 4);
        SetTargetToHorizontalMove(4, 2, 72, 122, 1, 8, 3, 6);

        break;
    case 6:

        DrawWall(9, 7, 2, 2, 0);
        DrawWall(9, 11, 2, 2, 1);
        DrawWall(4, 11, 2, 2, 2);
        DrawWall(6, 11, 3, 2, 3);

        SpawnSwitch(14, 8, 4, 0, 6, 11, 3, 2, 3);

        SpawnLongTarget(80, 36, 7, 14, 5);
        SetTargetToHorizontalMove(5, 0, 40, 112, -2, 5, 3, 9);

        SpawnSmallTarget(70, 80, 14, 6);
        SetTargetToHorizontalMove(6, 1, 44, 72, 1, 5, 8, 3);

        SpawnBigTarget(100, 100, 16, 21, 7);
        SetTargetToHorizontalMove(7, 2, 94, 118, -1, 11, 11, 3);

        break;

    case 7:

        DrawWall(9, 10, 7, 3, 0);

        SpawnArrow(6, 5, 1, Right, 0);

        SpawnTallTarget(120, 52, 2, 7);

        SetTargetToVerticalMove(2, 0, 36, 74, -1, 14, 3, 5);

        break;

    case 8:

        DrawWall(11, 5, 1, 4, 0);

        SpawnSwitch(7, 12, 1, 0, 11, 5, 1, 4, 0);

        DrawWall(11, 3, 5, 2, 2);

        DrawWall(4, 9, 8, 2, 3);

        SpawnSmallTarget(48, 40, 7, 4);

        SetTargetToHorizontalMove(4, 0, 44, 83, -1, 5, 3, 4);

        break;

    default:

        // printf("No level Found");
        break;
    }

    NextLevelHasStarted = true;
}

void UpdateHealth(int8_t Number)
{
    if (Ammo <= 0 && TargetList != 0)
    {
        Lives--;
        Number--;
        switchLevel(Levels);
        PlayerPosition[0] = 80;
        SetBullets(5);
    }

    WindowMap[19] = numberspriteList[Number - 1];
    set_win_tiles(0, 0, 20, 1, WindowMap);
}

void removeTargetfromList()
{
    TargetList--;

    if (TargetList <= 0)
    {
        Levels++;
        switchLevel(Levels);
    }
}

void SpawnBullet()
{
    // If able to shootF
    if (BulletIsShooting == false)
    {
        Abletoshoot = false;

        // Remove Bullet from UI and subract the Ammo
        Ammo--;
        WindowMap[Ammo] = 0x00;
        set_win_tiles(0, 0, 20, 1, WindowMap); // Update HUD

        // set the BulletPosition Numbers X and Y to the Player
        for (int8_t i = 0; i < 2; i++)
        {
            BulletPosition[i] = PlayerPosition[i];
        }

        // Fix the Offset for both X and Y
        BulletPosition[0] += 4;
        BulletPosition[1] -= 5;

        makeSound(0x3D, 0x05, 0xF2, 0x00, 0x87);

        // Set sprite 4 to Tile (8) and set the position of Bullet with the numbers we set
        set_sprite_tile(4, 8);
        move_sprite(4, BulletPosition[0], BulletPosition[1]);

        // Turn on Update for the Bullet which will make it go :)
        BulletIsShooting = true;
    }
}

void SpawnEffectsOnBullet()
{
    BulletIsShooting = false;

    // Spawn Effects
    for (int8_t i = 5; i < 7; i++)
    {
        EffectMoveCheck = (i > 5) ? 1 : 0;

        EffectPosition[i - (i - EffectMoveCheck)] = BulletPosition[0];

        set_sprite_tile(i, 9);

        move_sprite(i, EffectPosition[i - (i - EffectMoveCheck)], BulletPosition[1]);

        EffectMoveCheck = 0;
    }
    EffectCurrentY = BulletPosition[1];

    // Know if the effect has spawned which will be sent to update
    BulletEffectChecker = true;
}

void CheckIfEffectsIsOutofScreenX()
{
    // printf("%d\n", EffectPosition[0]);

    if (EffectPosition[0] < 37 && EffectPosition[0] > 0 || EffectPosition[0] > -126 && EffectPosition[0] < 0)
    {
        EffectPosition[0] = 0;
        move_sprite(5, EffectPosition[0], 0);
        if (EffectPosition[1] == 0)
        {
            SwitchPlayerEyeFrames(0);
            UpdateHealth(Lives);
            Abletoshoot = true;
            BulletEffectChecker = false;
        }
    }
    if (EffectPosition[1] > -126 && EffectPosition[1] < 0 || EffectPosition[1] < 37 && EffectPosition[1] > 0)
    {
        EffectPosition[1] = 0;
        move_sprite(6, EffectPosition[1], 0);
        if (EffectPosition[0] == 0)
        {
            SwitchPlayerEyeFrames(0);
            UpdateHealth(Lives);
            Abletoshoot = true;
            BulletEffectChecker = false;
        }
    }
}

void CheckIfBulletColliding()
{

    if (BulletPosition[1] <= 30 && BulletPosition[1] >= 0)
    {

        BulletPosition[1]--; // <-- dont ask why this is here :(

        // How much the Effects Y position should add when the they Spawn
        EffectYMover = 0;

        // Turn Off the update for Bullet
        BulletIsShooting = false;

        // Decide what eye should the ghost show
        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 1;

        // Sound
        makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);

        // Spawn The Effects on the bullet we are currently firing
        SpawnEffectsOnBullet();

        // Throw the Bullet outside of the Screen, removing sprites is not possible.
        BulletPosition[0] = -20;
        move_sprite(4, BulletPosition[0], BulletPosition[1]);
    }
    else if (BulletPosition[0] <= 36 && BulletPosition[0] >= 0 || BulletPosition[0] >= -127 && BulletPosition[0] <= 0)
    {

        // How much the Effects Y position should add when the they Spawn
        EffectYMover = -2;

        // Turn Off the update for Bullet
        BulletIsShooting = false;

        // Decide what eye should the ghost show
        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 1;

        // Sound
        makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);

        // Spawn The Effects on the bullet we are currently firing
        SpawnEffectsOnBullet();

        // Throw the Bullet outside of the Screen, removing sprites is not possible.
        BulletPosition[0] = -20;
        move_sprite(4, BulletPosition[0], BulletPosition[1]);
    }
    else
    {
        for (int8_t i = 0; i <= 10; i++)
        {
            if (collisionCheck(BulletPosition[0], BulletPosition[1], 5, 8, Objects[i].x, Objects[i].y, Objects[i].width, Objects[i].height))
            {
                if (NextLevelHasStarted)
                {
                    for (int8_t j = 0; j < 10; j++)
                    {
                        Objects[j].ishit = false;
                        if (Objects[j].type == Wall || Objects[j].type == Arrow)
                        {
                            Objects[j].ishit = true;
                        }
                    }
                    NextLevelHasStarted = false;
                }

                // The
                switch (Objects[i].type)
                {
                case Small:

                    // How much the Effects Y position should add when the they Spawn
                    EffectYMover = 1;

                    if (Objects[i].ishit)
                    {
                        makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    }
                    else
                    {
                        makeSound(0x3D, 0xFF, 0xF3, 0xE1, 0x87);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
                        DestroySmallTarget(Objects[i].oamStart);
                    }

                    break;

                case Big:

                    // How much the Effects Y position should add when the they Spawn
                    EffectYMover = 1;

                    if (Objects[i].ishit)
                    {
                        makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    }
                    else
                    {
                        makeSound(0x3D, 0xE3, 0xF3, 0xFF, 0x87);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
                        DestroyBigTarget(Objects[i].oamStart, Objects[i].oamEnd);
                    }
                    break;

                case Long:

                    EffectYMover = 1;

                    if (Objects[i].ishit)
                    {
                        makeSound(0x4A, 0x00, 0xF3, 0x00, 0x98);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    }
                    else
                    {
                        makeSound(0x1F, 0xE9, 0xF4, 0xFF, 0x87);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
                        DestroyLongTarget(Objects[i].oamStart, Objects[i].oamEnd);
                    }
                    break;

                case Wall:
                    EffectYMover = 0;
                    makeSound(0x4A, 0x20, 0xF3, 0x00, 0x98);
                    WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    break;

                case Switch:
                    if (!Objects[i].ishit)
                    {
                        makeSound(0x50, 0xF2, 0xF4, 0xA8, 0x87);
                        set_bkg_tile_xy((Objects[i].x / 8), (Objects[i].y / 8) - 2, 44);
                        EffectYMover = 2;

                        for (int8_t j = 0; j < 3; j++)
                        {
                            if (Objects[i].switch_number == Switches[j].switch_number)
                            {
                                for (int8_t t = 0; t < Switches[j].box_width; t++)
                                {
                                    for (int8_t b = 0; b < Switches[j].box_height; b++)
                                    {
                                        set_bkg_tile_xy((Switches[j].box_X + t), (Switches[j].box_y + b), 0);
                                    }

                                    Objects[Switches[j].object_number].x = 0;
                                    Objects[Switches[j].object_number].y = 0;
                                    Objects[Switches[j].object_number].width = 0;
                                    Objects[Switches[j].object_number].height = 0;
                                }
                            }
                        }
                    }
                    else
                    {
                        EffectYMover = 2;
                        makeSound(0x4A, 0x20, 0xF3, 0xA0, 0x9A);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    }

                    Objects[i].ishit = true;

                    break;

                case Arrow:

                    for (int8_t j = 0; j < 3; j++)
                    {
                        if (Objects[i].arrow_number == Arrows[j].arrow_number)
                        {
                            switch (Arrows[j].direction)
                            {
                            case Up:
                                BulletCurrentDirection = Up;
                                break;
                            case Down:
                                BulletCurrentDirection = Down;
                                break;
                            case Left:
                                BulletCurrentDirection = Left;
                                break;
                            case Right:
                                BulletCurrentDirection = Right;
                                break;
                            }

                            makeSound(0x3A, 0xE4, 0xF3, 0x50, 0x94);
                        }
                    }

                    break;

                case Tall:

                    if (Objects[i].ishit)
                    {
                        makeSound(0x3E, 0x00, 0xF3, 0x00, 0x98);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 3;
                    }
                    else
                    {
                        makeSound(0x8D, 0xA6, 0xF3, 0xC9, 0x91);
                        WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao = 2;
                        set_sprite_tile(Objects[i].oamStart, 20);
                        set_sprite_tile(Objects[i].oamStart, 19);
                    }

                    break;

                default:
                    printf("Bullet Type not found");
                    break;
                }

                if (Objects[i].type == Arrow)
                {
                    return;
                }

                // Turn Off the update for Bullet
                BulletIsShooting = false;

                if (!Objects[i].ishit)
                {
                    removeTargetfromList();
                }

                Objects[i].ishit = (!true) ? true : true;

                // Spawn The Effects on the bullet we are currently firing

                SpawnEffectsOnBullet();

                BulletPosition[0] = -20;
                move_sprite(4, BulletPosition[0], BulletPosition[1]);
            }
        }
    }
}

void UpdateTargetMove()
{
    if (NextLevelHasStarted)
    {
        for (int8_t i = 0; i < 10; i++)
        {
            Objects[i].ishit = false;
        }
    }

    for (int8_t i = 0; i < 10; i++)
    {

        if (Objects[i].canMove)
        {

            for (int8_t j = 0; j < 5; j++)
            {
                if (Objects[i].move_number == MovingObjects[j].move_number && !Objects[i].ishit)
                {

                    switch (MovingObjects[j].type)
                    {
                    case Horizontal:
                        if (Objects[i].x >= MovingObjects[j].max_x)
                        {
                            MovingObjects[j].speed = -MovingObjects[j].speed;
                        }
                        else if (Objects[i].x <= MovingObjects[j].min_x)
                        {
                            MovingObjects[j].speed = -MovingObjects[j].speed;
                        }

                        Objects[i].x += MovingObjects[j].speed;
                        break;
                    case Vertical:

                        if (Objects[i].y >= MovingObjects[j].max_y)
                        {
                            MovingObjects[j].speed = -MovingObjects[j].speed;
                        }
                        else if (Objects[i].y <= MovingObjects[j].min_y)
                        {
                            MovingObjects[j].speed = -MovingObjects[j].speed;
                        }

                        Objects[i].y += MovingObjects[j].speed;

                        break;
                    }
                }
            }

            switch (Objects[i].type)
            {
            case Big:

                MoveBigTarget(Objects[i].oamStart, Objects[i].x, Objects[i].y);

                break;

            case Small:

                move_sprite(Objects[i].oamStart, Objects[i].x, Objects[i].y);

                break;

            case Tall:

                move_sprite(Objects[i].oamStart, Objects[i].x, Objects[i].y);
                move_sprite(Objects[i].oamStart + 1, Objects[i].x, Objects[i].y + 8);

                break;

            case Long:

                MoveLongTarget(Objects[i].oamStart, Objects[i].x, Objects[i].y);

                break;

            default:

                printf("%d", Objects[i].type);

                printf("type not found lmao");

                break;
            }
        }
    }
}

void init() // INIT
{
    set_sprite_data(0, 8, Ghost);
    set_sprite_data(8, 3, Bullet);
    set_sprite_data(11, 10, TargetSprites);
    set_bkg_data(0, 22, LevelTiles);
    set_bkg_tiles(0, 0, 20, 18, LevelMap);
    set_bkg_data(22, 14, WindowTileset);
    set_bkg_data(36, 13, BackgroundObjects);
    set_bkg_data(49, 26, Font);
    setupPlayer();

    set_win_tiles(0, 0, 20, 1, WindowMap);
    move_win(7, 136);

    UpdateHealth(Lives);

    NR52_REG = 0x80;
    NR50_REG = 0x77;
    NR51_REG = 0xFF;

    DISPLAY_ON;
    SHOW_SPRITES;
    SHOW_BKG;
    SHOW_WIN;
}

void main() // MAIN CODE EXECUTION
{

    init();

    switchLevel(Levels);

    while (1) // GAME LOOP
    {

        // Check for Player Input
        switch (joypad())
        {
        case J_LEFT:
            if (PlayerPosition[0] <= 36)
            {
                PlayerPosition[0] -= 0;
                Playerframespeed = 15;
                SwitchPlayerEyeFrames(2);
            }
            else
            {
                PlayerPosition[0]--;
                Playerframespeed = 5;
            }

            break;
        case J_RIGHT:
            if (PlayerPosition[0] >= 124)
            {
                PlayerPosition[0] += 0;
                Playerframespeed = 15;
                SwitchPlayerEyeFrames(2);
            }
            else
            {
                PlayerPosition[0]++;
                Playerframespeed = 5;
            }

            break;
        case J_A:
            if (Abletoshoot && Ammo > 0 && !AisPressed)
            {
                BulletCurrentDirection = Up;
                SpawnBullet();
                AisPressed = true;
            }
            break;
        case J_B:
            if (!BisPressed)
            {
                BisPressed = true;
                Levels++;
                switchLevel(Levels);
            }

            break;
        default:
            Playerframespeed = 7; // set the speed of the Ghost Animation
            BisPressed = false;
            AisPressed = false;
            SwitchPlayerEyeFrames(0);
            break;
        }

        if (BulletIsShooting)
        {
            // Update the Bullet
            CheckIfBulletColliding();

            set_sprite_prop(4, get_sprite_prop(4) & ~S_FLIPX);
            set_sprite_prop(4, get_sprite_prop(4) & ~S_FLIPY);

            switch (BulletCurrentDirection)
            {
            case Up:
                BulletPosition[1] -= 2;
                set_sprite_tile(4, 8);
                break;
            case Down:
                set_sprite_tile(4, 8);
                BulletPosition[1] += 2;
                set_sprite_prop(4, S_FLIPY);
                break;
            case Left:
                BulletPosition[0] -= 2;
                set_sprite_prop(4, S_FLIPX);
                set_sprite_tile(4, 10);
                break;

            case Right:
                set_sprite_tile(4, 10);
                BulletPosition[0] += 2;
                break;
            }

            // printf("%d\n", BulletPosition[1]);
            move_sprite(4, BulletPosition[0], BulletPosition[1]);
        }
        else if (BulletEffectChecker)
        {

            SwitchPlayerEyeFrames(WhatKindofEyeshouldthegoofyahhGhostShowfortheEffectFunctionLmao);
            for (int8_t i = 5; i < 7; i++)
            {
                CheckIfEffectsIsOutofScreenX();

                EffectMoveCheck = (i > 5) ? 1 : 0;
                EffectMover = (i > 5) ? 2 : -2;
                EffectCurrentY += EffectYMover;

                move_sprite(i, EffectPosition[i - (i - EffectMoveCheck)] += EffectMover, EffectCurrentY);

                EffectMoveCheck = 0;
            }
        }

        // Update the Player Animation
        UpdatePlayerAnimation();

        UpdateTargetMove();

        // Update Player Position
        movePlayer(PlayerPosition[0], PlayerPosition[1]);

        // Wait until Vertical Blank is Done
        wait_vbl_done();
    }
}
