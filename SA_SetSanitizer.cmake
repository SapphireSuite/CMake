# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.



# Set compilation flags and link for sanitizer.
#
# USAGE:
#	SA_SetSanitizerFlag(
#		TARGET		<target>
#		LINK		<link_opt>
#		SAN_FLAG	<sanitizer_flag>
#		SAN_LINK	<sanitizer_link>
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
#	SAN_FLAG
#		Sanitizer compile flag (address, thread, leak...).
#
#	SAN_LINK
#		Additionnal Sanitizer link flags.
#
function(SA_SetSanitizerFlag)

#{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;LINK;SAN_FLAG;SAN_LINK"
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
	
	if(NOT PARGS_SAN_FLAG)
		message(FATAL_ERROR "Missing SAN_FLAG argument")
	endif()

#}


	if(MSVC)

		target_compile_options(${PARGS_TARGET} ${PARGS_LINK} /fsanitize=${PARGS_SAN_FLAG})

	else()

		target_compile_options(${PARGS_TARGET} ${PARGS_LINK} -fsanitize=${PARGS_SAN_FLAG})
		target_link_options(${PARGS_TARGET} ${PARGS_LINK} -fsanitize=${PARGS_SAN_FLAG} ${PARGS_SAN_LINK})

	endif()
endfunction()



option(SA_SANITIZER_OPT "Build target with Sanitizer option. Can be any of fsanitize value (address, thread, leak...)." OFF)

# Set sanitizers to target from option.
#
# USAGE:
#	SA_SetSanitizers(
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
function(SA_SetSanitizers)

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

	if(SA_SANITIZER_OPT)

		if(${SA_SANITIZER_OPT} STREQUAL "thread")
			set(SAN_LINK -fno-omit-frame-pointer)
		endif()

		SA_SetSanitizerFlag(TARGET ${PARGS_TARGET} LINK ${PARGS_LINK} SAN_FLAG ${SA_SANITIZER_OPT} SAN_LINK ${SAN_LINK})

	endif()

endfunction()
