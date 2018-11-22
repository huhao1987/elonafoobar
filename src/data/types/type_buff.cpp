#include "type_buff.hpp"
#include "../../lua_env/enums/enums.hpp"

namespace elona
{

BuffDB the_buff_db;
const constexpr char* data::LuaLazyCacheTraits<BuffDB>::type_id;


BuffData BuffDB::convert(const lua::ConfigTable& data, const std::string& id)
{
    auto legacy_id = data.required<int>("id");
    DATA_ENUM(buff_type, BuffType, BuffTypeTable, BuffType::buff);

    DATA_REQ(duration, sol::protected_function);
    DATA_REQ(on_refresh, sol::protected_function);
    DATA_REQ(description, sol::protected_function);

    return BuffData{
        legacy_id,
        data.storage,
        buff_type,
        lua::WrappedFunction(id, duration),
        lua::WrappedFunction(id, on_refresh),
        lua::WrappedFunction(id, description),
    };
}

} // namespace elona
