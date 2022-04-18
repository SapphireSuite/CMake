# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.



include(FetchContent)


# Clone a git repository from Sapphire Suite (module) at config time and add it to ThirdParty/SA/<repo_name>.
# Automatically init git submodules.
#
# USAGE:
#	SA_FetchModule(
#		<module_name>
#	)
#
# ARGUMENTS:
#	MODULE_NAME
#		Name of the Sapphire Suite's module to clone (name of the repository).
#
function(SA_FetchModule MODULE_NAME)

	set(SA_MODULE_NAME "SA_${MODULE_NAME}")

	if(NOT TARGET ${SA_MODULE_NAME})

		message("Fetching ${SA_MODULE_NAME}...")

		set(SA_MODULE_TARGET_SOURCE_DIR ${CMAKE_SOURCE_DIR}/ThirdParty/SA/${MODULE_NAME})

		FetchContent_Declare(
			${SA_MODULE_NAME}
			GIT_REPOSITORY	https://github.com/SapphireSuite/${MODULE_NAME}.git
			GIT_TAG			main
			SOURCE_DIR		${SA_MODULE_TARGET_SOURCE_DIR}
		)

		FetchContent_MakeAvailable(${SA_MODULE_NAME})

	endif()

endfunction()
