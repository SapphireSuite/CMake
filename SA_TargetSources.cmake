# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

# Add *public* sources and include directory to a target (using target_sources and target_include_directories).
#
# USAGE:
#	SA_TargetPublicSources(
#		TARGET		<target>
#		FOLDER		<public_folder>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the cmake target.
#
#	FOLDER
#		Public source folder.
#		Default is "Include".
function(SA_TargetPublicSources)
	
  #{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;FOLDER"
		""
		${ARGN}
	)


	if(NOT PARGS_TARGET)
		message(FATAL_ERROR "Missing TARGET argument")
	endif()


	# Default "Include".
	if(NOT PARGS_FOLDER)
		set(PARGS_FOLDER Include)
	endif()

  #}

	# Remove SA_ from target name to get folder name.
	string(REPLACE "SA_" "" MODULE_NAME ${PARGS_TARGET})

	file(GLOB_RECURSE SA_SOURCES_PUBLIC "${PARGS_FOLDER}/*.hpp")
	message(VERBOSE "[SA] ${PARGS_TARGET} public sources: ${SA_SOURCES_PUBLIC}")

	source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/${PARGS_FOLDER}/SA/${MODULE_NAME} PREFIX Public FILES ${SA_SOURCES_PUBLIC})
	target_sources(${PARGS_TARGET} PUBLIC ${SA_SOURCES_PUBLIC})

	# Public include directory (access from project's outside).
	target_include_directories(${PARGS_TARGET} PUBLIC ${PARGS_FOLDER})

	# Private include directory (access from project's inside).
	target_include_directories(${PARGS_TARGET} PRIVATE ${PARGS_FOLDER}/SA/${MODULE_NAME})

endfunction(SA_TargetPublicSources)



# Add *private* sources and include directory to a target (using target_sources and target_include_directories).
#
# USAGE:
#	SA_TargetPublicSources(
#		TARGET		<target>
#		FOLDER		<private_folder>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the cmake target.
#
#	FOLDER
#		Private source folder.
#		Default is "Source".
function(SA_TargetPrivateSources)
	
  #{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;FOLDER"
		""
		${ARGN}
	)


	if(NOT PARGS_TARGET)
		message(FATAL_ERROR "Missing TARGET argument")
	endif()


	# Default "Source".
	if(NOT PARGS_FOLDER)
		set(PARGS_FOLDER Source)
	endif()

  #}

  	# Remove SA_ from target name to get folder name.
	string(REPLACE "SA_" "" MODULE_NAME ${PARGS_TARGET})

	file(GLOB_RECURSE SA_SOURCES_PRIVATE "${PARGS_FOLDER}/*.hpp" "${PARGS_FOLDER}/*.cpp")
	message(VERBOSE "[SA] ${PARGS_TARGET} private sources: ${SA_SOURCES_PRIVATE}")

	source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/${PARGS_FOLDER}/SA/${MODULE_NAME} PREFIX Private FILES ${SA_SOURCES_PRIVATE})
	target_sources(${PARGS_TARGET} PRIVATE ${SA_SOURCES_PRIVATE})

endfunction(SA_TargetPrivateSources)



# Add *interface* sources and include directory to a target (using target_sources and target_include_directories).
#
# USAGE:
#	SA_TargetInterfaceSources(
#		TARGET		<target>
#		FOLDER		<interface_folder>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the cmake target.
#
#	FOLDER
#		Interface source folder.
#		Default is "Include".
function(SA_TargetInterfaceSources)
	
  #{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;FOLDER"
		""
		${ARGN}
	)


	if(NOT PARGS_TARGET)
		message(FATAL_ERROR "Missing TARGET argument")
	endif()


	# Default "Include".
	if(NOT PARGS_FOLDER)
		set(PARGS_FOLDER Include)
	endif()

  #}

	# Remove SA_ from target name to get folder name.
	string(REPLACE "SA_" "" MODULE_NAME ${PARGS_TARGET})

	file(GLOB_RECURSE SA_SOURCES_INTERFACE "${PARGS_FOLDER}/*.hpp")
	message(VERBOSE "[SA] ${PARGS_TARGET} interface sources: ${SA_SOURCES_INTERFACE}")

	source_group(TREE ${CMAKE_CURRENT_SOURCE_DIR}/${PARGS_FOLDER}/SA/${MODULE_NAME} PREFIX Public FILES ${SA_SOURCES_INTERFACE})
	target_sources(${PARGS_TARGET} INTERFACE ${SA_SOURCES_INTERFACE})

	# Interface include directory (access from project's outside).
	target_include_directories(${PARGS_TARGET} INTERFACE ${PARGS_FOLDER})

endfunction(SA_TargetInterfaceSources)


# Add sources and include directories to a target (using target_sources and target_include_directories).
#
# USAGE:
#	SA_TargetPublicSources(
#		TARGET				<target>
#		PUBLIC_FOLDER		<public_folder>
#		PRIVATE_FOLDER		<private_folder>
#	)
#
# ARGUMENTS:
#	TARGET
#		Name of the cmake target.
#
#	PUBLIC_FOLDER
#		Public source folder.
#		Default is "Include".
#	PRIVATE_FOLDER
#		Private source folder.
#		Default is "Source".
function(SA_TargetSources)
	
  #{ Args

	cmake_parse_arguments(
		PARGS
		""
		"TARGET;PUBLIC_FOLDER;PRIVATE_FOLDER"
		""
		${ARGN}
	)


	if(NOT PARGS_TARGET)
		message(FATAL_ERROR "Missing TARGET argument")
	endif()

  #}


	SA_TargetPublicSources(TARGET ${PARGS_TARGET} FOLDER ${PARGS_PUBLIC_FOLDER})
	SA_TargetPrivateSources(TARGET ${PARGS_TARGET} FOLDER ${PARGS_PRIVATE_FOLDER})

endfunction(SA_TargetSources)
