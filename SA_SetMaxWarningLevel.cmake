# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.



# Set maximum compilation Warning level for target.
#
# USAGE:
#	SA_SetMaxWarningLevel(
#		TARGET		<target>
#		LINK		<link_opt>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the target to set max warning level.
#
#	LINK
#		Target link option (PUBLIC | PRIVATE | INTERFACE). Default is PUBLIC.
#
function(SA_SetMaxWarningLevel)

#{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;LINK"
		""
		${ARGN}
	)


	if(NOT PARGS_TARGET)
		message(FATAL_ERROR "Missing TARGET argument")
	endif()


	# Default PUBLIC.
	if(NOT PARGS_LINK)
		set(PARGS_LINK PUBLIC)
	endif()

#}


	if(MSVC)

		if(${CMAKE_CXX_COMPILER_ID} MATCHES "Clang") # ClangCl

			target_compile_options(${PARGS_TARGET} ${PARGS_LINK} -W4)

		else() # MSVC

			target_compile_options(${PARGS_TARGET} ${PARGS_LINK} /W4)

		endif()

	else() # GNU / Clang

		target_compile_options(${PARGS_TARGET} ${PARGS_LINK} -Wall -Wextra)

	endif()

endfunction()
