# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Internal helper macro to setup configurations for MSVC.
macro(__SA_SetupConfiguration_MSVC)

	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;AddrSan")
	# set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;AddrSan;ThreadSan;MemorySan") # Not supported yet.

	# /MP: Build with multiple processes.
	# /W[0, 1, 2, 3, 4]: Set compiler warning level.
	# /GR-: Disable RTTI generation.
	# /Zi: Generate debug info in .pdb.
	# /Zo: Enhanced debugging information for optimized code in non-debug.
	# /O[d, 1, 2, 3]: Code optimization level (d = disabled).
	# /Oy-: Disable frame pointer omission.

	set(SA_BASE_FLAGS 					"/MP /W4 /GR-")
	set(CMAKE_CXX_FLAGS_DEBUG 			"${SA_BASE_FLAGS} /Zi") # /fsanitize=undefined not supported yet.
	set(CMAKE_CXX_FLAGS_RELEASE			"${SA_BASE_FLAGS} /O2 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO	"${SA_BASE_FLAGS} /Zi /Zo /O2 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_ADDRSAN			"${SA_BASE_FLAGS} /Zi /Zo /O1 /fsanitize=address /Oy-") # /fsanitize=leak not supported yet.
	# set(CMAKE_CXX_FLAGS_THREADSAN		"${SA_BASE_FLAGS} /Zi /Zo /O1 /fsanitize=thread /Oy-") # Not supported yet.
	# set(CMAKE_CXX_FLAGS_MEMORYSAN		"${SA_BASE_FLAGS} /Zi /Zo /O1 /fsanitize=memory /Oy-") # Not supported yet.


	# set(CMAKE_EXE_LINKER_FLAGS_DEBUG)
	# set(CMAKE_EXE_LINKER_FLAGS_RELEASE)
	# set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO)
	set(CMAKE_EXE_LINKER_FLAGS_ADDRSAN "/DEBUG /INCREMENTAL:NO")
	set(CMAKE_EXE_LINKER_FLAGS_THREADSAN "/DEBUG /INCREMENTAL:NO")
	set(CMAKE_EXE_LINKER_FLAGS_MEMORYSAN "/DEBUG /INCREMENTAL:NO")


	# set(SA_COMPILE_OPTIONS
	# 	/MP /W4 /GR-									# All configs
	# 	$<$<CONFIG:Debug>: 			/Zi 	/Od>
	# 	$<$<CONFIG:Release>: 				/O3>
	# 	$<$<CONFIG:RelWithDebInfo>: /Zi /Zo /O2>
	# 	$<$<CONFIG:AddrSan>: 		/Zi /Zo /O1 /Oy->
	# 	$<$<CONFIG:ThreadSan>: 		/Zi /Zo /O1 /Oy->
	# 	$<$<CONFIG:MemorySan>: 		/Zi /Zo /O1 /Oy->
	# )

	# set(SA_LINK_OPTIONS
	# )

endmacro(__SA_SetupConfiguration_MSVC)
