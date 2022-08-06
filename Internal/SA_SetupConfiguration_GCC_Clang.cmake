# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Internal helper macro to setup configurations for GCC and Clang.
macro(__SA_SetupConfiguration_GCC_Clang)

	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;AddrSan;ThreadSan;MemorySan")

	# -Wall: Enable all compiler warnings.
	# -Wextra: Enable compiler extra warnings.
	# -fno-rtti: Disable RTTI generation.
	# -g: Generate debug info.
	# -O[0, 1, 2, 3]: Code optimization level (d = disabled).

	set(SA_BASE_FLAGS 					"-Wall -Wextra -fno-rtti")
	set(CMAKE_CXX_FLAGS_DEBUG 			"${SA_BASE_FLAGS} -g -fsanitize=undefined")
	set(CMAKE_CXX_FLAGS_RELEASE			"${SA_BASE_FLAGS} -O3 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_RELWITHDEBINFO	"${SA_BASE_FLAGS} -g -O2 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_ADDRSAN			"${SA_BASE_FLAGS} -g -O1 -fsanitize=address -fsanitize=leak -fno-omit-frame-pointer")
	set(CMAKE_CXX_FLAGS_THREADSAN		"${SA_BASE_FLAGS} -g -O1 -fsanitize=thread -fno-omit-frame-pointer")
	set(CMAKE_CXX_FLAGS_MEMORYSAN		"${SA_BASE_FLAGS} -g -O1 -fsanitize=memory -fno-omit-frame-pointer")

	
	# set(SA_COMPILE_OPTIONS
	# 	-Wall -Wextra -fno-rtti															# All configs
	# 	$<$<CONFIG:Debug>: 			-g	-O0 -fsanitize=undefined>
	# 	$<$<CONFIG:Release>: 			-O3>
	# 	$<$<CONFIG:RelWithDebInfo>: -g	-O3>
	# 	$<$<CONFIG:AddrSan>: 		-g	-O1 -fsanitize=address -fno-omit-frame-pointer>
	# 	$<$<CONFIG:ThreadSan>: 		-g	-O1 -fsanitize=thread -fno-omit-frame-pointer>
	# 	$<$<CONFIG:MemorySan>: 		-g	-O1 -fsanitize=memory -fno-omit-frame-pointer>
	# )

	# set(SA_LINK_OPTIONS
	# 																					# All configs
	# 	$<$<CONFIG:Debug>: 			-g -fsanitize=undefined>
	# 	$<$<CONFIG:Release>:>
	# 	$<$<CONFIG:RelWithDebInfo>: -g>
	# 	$<$<CONFIG:AddrSan>: 		-g -fsanitize=address>
	# 	$<$<CONFIG:ThreadSan>: 		-g -fsanitize=thread>
	# 	$<$<CONFIG:MemorySan>: 		-g -fsanitize=memory>
	# )

endmacro(__SA_SetupConfiguration_GCC_Clang)
