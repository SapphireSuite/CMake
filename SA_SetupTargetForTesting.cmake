# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.


include(SA_SetSanitizer.cmake)
include(SA_SetMaxWarningLevel.cmake)

# Setup target for testing.
#
# USAGE:
#	SA_SetupTargetForTesting(
#		TARGET		<target>
#		LINK		<link_opt>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the target to set sanitizer.
#
#	LINK
#		Target link option (PUBLIC | PRIVATE | INTERFACE).
#		Default is PUBLIC.
#
function(SA_SetupTargetForTesting)

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

	SA_SetMaxWarningLevel(TARGET ${PARGS_TARGET} LINK ${PARGS_LINK})
	SA_SetSanitizers(TARGET ${PARGS_TARGET} LINK ${PARGS_LINK})

endfunction()
