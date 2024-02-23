module InitLoadableStruct

export InitableLoadable

abstract type InitableLoadable end

# To make this work, you have to have the "default" constructor for your type without the "data" part (so having empty data part)
init(t::Type{TYPE}, args...; kw_args...)      where TYPE = TYPE(args...; kw_args...)


# When the object is inited/configured, this is the function that have to able to download the right data. So you have to overload this as your data query expect!
load_data(t::Type{TYPE}, args...; kw_args...) where TYPE = load_data!(init(t, args...; kw_args...))
load_data!(obj::TYPE)                         where TYPE = throw("Implement load_data(...)")

unique_args(obj::TYPE)                        where TYPE = throw("We need the fields that specify the data for caching")


end # module InitLoadableStruct
