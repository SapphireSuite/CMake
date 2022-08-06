# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Set compilation intrinsics flags for target.
#
# USAGE:
#	SA_SetIntrinsicsFlags(
#		TARGET		<target>
#		LINK		<link_opt>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the target to set intrinsics flags.
#
#	LINK
#		Target link option (PUBLIC | PRIVATE | INTERFACE).
#		Default is PUBLIC.
function(SA_SetIntrinsicsFlags)

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


	if("${CMAKE_CXX_COMPILER_ID}" MATCHES "MSVC") # MSVC only (no ClangCl)

		target_compile_options(${PARGS_TARGET} ${PARGS_LINK} /arch:AVX2)

	else()

		target_compile_options(${PARGS_TARGET} ${PARGS_LINK} -mavx -mavx2)

	endif()

endfunction(SA_SetIntrinsicsFlags)
