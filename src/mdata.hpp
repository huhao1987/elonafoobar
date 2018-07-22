#pragma once

#define mdata_map_width                 mdata(0)
#define mdata_map_height                mdata(1)
#define mdata_map_atlas_number          mdata(2)
#define mdata_map_next_regenerate_date  mdata(3)
#define mdata_map_stair_down_pos        mdata(4)
#define mdata_map_stair_up_pos          mdata(5)
#define mdata_map_type                  mdata(6)
#define mdata_map_refresh_type          mdata(7)
#define mdata_map_designated_spawns     mdata(8)
#define mdata_map_turn_cost             mdata(9)
#define mdata_map_max_crowd_density     mdata(10)
#define mdata_map_current_dungeon_level mdata(11)
#define mdata_map_tileset               mdata(12)
#define mdata_map_bgm                   mdata(13)
#define mdata_map_indoors_flag          mdata(14)
#define mdata_map_user_map_flag         mdata(15)
#define mdata_map_next_restock_date     mdata(16)
#define mdata_map_should_regenerate     mdata(17)
#define mdata_map_max_item_count        mdata(18)
#define mdata_map_regenerate_count      mdata(19)
#define mdata_map_play_campfire_sound   mdata(20)
#define mdata_map_mefs_loaded_flag      mdata(21)

namespace elona
{

enum map_type_t
{
    world_map = 1,
    guild = 2,
    town = 3,
    field = 4,
    your_home = 5,
    shelter = 6,
    escort_ambush = 7,
    dungeon_a = 20,
    dungeon_b = 21,
    dungeon_c = 22,
    dungeon_d = 23,
};

} // namespace elona
