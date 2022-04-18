# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.



include(FetchContent)


function(SA_FetchModule _MODULE_NAME)

	set(SA_MODULE_NAME "SA_${_MODULE_NAME}")

	if(NOT TARGET ${SA_MODULE_NAME})

		message("Fetching ${SA_MODULE_NAME}...")

		set(SA_MODULE_TARGET_SOURCE_DIR ${CMAKE_SOURCE_DIR}/ThirdParty/SA/${_MODULE_NAME})

		FetchContent_Declare(
			${SA_MODULE_NAME}
			GIT_REPOSITORY	https://github.com/SapphireSuite/${_MODULE_NAME}.git
			GIT_TAG			main
			SOURCE_DIR		${SA_MODULE_TARGET_SOURCE_DIR}
		)

		FetchContent_MakeAvailable(${SA_MODULE_NAME})

	endif()

endfunction()
