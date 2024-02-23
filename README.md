# InitLoadableStruct.jl
Initable &amp; loadable datastructure pattern (interface)

If your struct support:
Init/configure the space you want to query -> load_data that queries the data, which is configured/inited.

*Use this with:* [UltimateStruct.jl](https://github.com/Cvikli/UniversalStruct.jl)

## To use:
```julia
# To make this work, you have to have the "default" constructor for your type without the "data" part (so having empty data part)
init(t::Type{TYPE}, args...; kw_args...)      where TYPE <: InitableLoadable = TYPE(args...; kw_args...)

# When the object is inited/configured, this is the function that have to able to download the right data. So you have to overload this as your data query expect!
load_data(obj::TYPE)                          where TYPE <: InitableLoadable = throw("Implement load_data(...)")
```

## TODO
- Think about the pattern, when we don't need to construct /init the struct, just having the "load_data" to do the work.

