# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Internal helper macro to setup configurations for MSVC.
macro(__SA_SetupConfiguration_MSVC)

	# /MP: Build with multiple processes.
	# /W[0, 1, 2, 3, 4]: Set compiler warning level.
	# /GR-: Disable RTTI generation.
	# /Zi: Generate debug info in .pdb.
	# /Zo: Enhanced debugging information for optimized code in non-debug.
	# /O[d, 1, 2, 3]: Code optimization level (d = disabled).
	# /Oy-: Disable frame pointer omission.

	set(SA_BASE_FLAGS 					"/MP /W4 /GR-")
	set(CMAKE_CXX_FLAGS_DEBUG 			"${SA_BASE_FLAGS} /Zi -fsanitize=undefined")
	set(CMAKE_CXX_FLAGS_RELEASE			"${SA_BASE_FLAGS} /O3 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO	"${SA_BASE_FLAGS} /Zi /Zo /O2 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_ADDRSAN			"${SA_BASE_FLAGS} /Zi /Zo /O1 -fsanitize=address /Oy-")
	set(CMAKE_CXX_FLAGS_THREADSAN		"${SA_BASE_FLAGS} /Zi /Zo /O1 -fsanitize=thread /Oy-")
	set(CMAKE_CXX_FLAGS_MEMORYSAN		"${SA_BASE_FLAGS} /Zi /Zo /O1 -fsanitize=memory /Oy-")


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
