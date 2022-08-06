# CMake

Sapphire Suite's CMake tools.



# How to use

Include CMake directory to include all cmake files:

```cmake
add_subdirectory(CMake)
```

or include single function file:


```cmake
include(CMake/SA_TargetSources.cmake)
```



# Documentations


## SA_ConfigureProject

Helper macro to configure a cmake project to match Sapphire Suite's requirements.
Must be called after project() cmake function.

```cmake
SA_ConfigureProject(<project>)
```


## SA_ConfigureTarget

Helper function to configure a cmake target to match Sapphire Suite's requirements.
Should be called after add_library or add_executable target.

```cmake
SA_ConfigureProject(TARGET <target> LINK <link_opt>)
```

> Default values:
> <link_opt> = PUBLIC


## SA_FetchGoogleBenchmark

Helper function to clone [Google benchmark](https://github.com/google/benchmark) repository in ThirdParty/ folder at config time.

```cmake
SA_FetchGoogleBenchmark()
```


## SA_FetchGoogleTest

Helper function to clone [Google Test](https://github.com/google/googletest) repository in ThirdParty/ folder at config time.

```cmake
SA_FetchGoogleTest()
```


## SA_FetchModule

Helper function to clone a module from [Sapphire Suite](https://github.com/SapphireSuite) and add it to ThirdParty/SA/ folder at config time.
Automatically init git submodules.

```cmake
SA_FetchModule(<module_name>)
```


## SA_SetIntrinsicsFlags

Helper function to enable intrinsics compilation flags for a target.

```cmake
SA_SetIntrinsicsFlags(TARGET <target> LINK <link_opt>)
```

> Default values:
> <link_opt> = PUBLIC


## SA_SetRTTIFlags

Helper function to enable RTTI compilation flags for a target.

```cmake
SA_SetRTTIFlags(TARGET <target> LINK <link_opt> TOGGLE <on_off>)
```

> Default values:
> <link_opt> = PUBLIC
> <on_off> = ON


## SA_TargetSouces

Helper functions to add public and/or private sources and include directories to a target.

```cmake
SA_TargetSources(TARGET <target> PUBLIC_FOLDER <public_folder> PRIVATE_FOLDER <private_folder>)
SA_TargetPublicSources(TARGET <target> FOLDER <public_folder>)
SA_TargetPrivateSources(TARGET <target> FOLDER <private_folder>)
```

> Default values:
> <public_folder> = "Include"
> <private_folder> = "Source"



# Authors
**Maxime "mrouffet" ROUFFET** - main developer (maximerouffet@gmail.com)
