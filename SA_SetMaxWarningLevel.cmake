# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Set mmaximum compilation Warning level for target.
#
# USAGE:
#	SA_SetMaxWarningLevel(
#		<target_name>
#	)
#
# ARGUMENTS:
#	TARGET_NAME
#		Name of the target to set max warning level.
#
function(SA_SetMaxWarningLevel TARGET_NAME)

	if(MSVC)

		if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang") # ClangCl

			target_compile_options(${TARGET_NAME} PUBLIC -W4)

		else() # MSVC

			target_compile_options(${TARGET_NAME} PUBLIC /W4)

		endif()

	else() # GNU / Clang

		target_compile_options(${TARGET_NAME} PUBLIC -Wall -Wextra)

	endif()

endfunction()
