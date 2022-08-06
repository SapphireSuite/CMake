# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Configure a target from Sapphire Suite's config.
# Set standard to C11/C++20
# Add public module proprocessor: <UPPER_MODULE_NAME>_IMPL (ex: SA_LOGGER_IMPL).
#
# USAGE:
#	SA_ConfigureTarget(
#		TARGET	<target>
#		LINK	<link_opt>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the target to configure.
#
#	LINK
#		Target link option (PUBLIC | PRIVATE | INTERFACE).
#		Default is PUBLIC.
function(SA_ConfigureTarget)

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


	# Standard
	target_compile_features(${PARGS_TARGET} ${PARGS_LINK} c_std_11)
	target_compile_features(${PARGS_TARGET} ${PARGS_LINK} cxx_std_20)


	# Module implementation preprocessor.
	string(TOUPPER ${PARGS_TARGET} SA_UPPER_TARGET)
	target_compile_definitions(${PARGS_TARGET} ${PARGS_LINK} ${SA_UPPER_TARGET}_IMPL)


	if(MSVC)

		# Sanitizer required link.
		target_link_libraries(${PARGS_TARGET} ${PARGS_LINK} $<$<CONFIG:AddrSan>: clang_rt.asan_dynamic-x86_64.lib clang_rt.asan_dynamic_runtime_thunk-x86_64.lib>)
	
	endif()

	# CI option preprocessor.
	if(SA_CI)
		target_compile_definitions(${PARGS_TARGET} ${PARGS_LINK} SA_CI)
	endif()

endfunction(SA_ConfigureTarget)
