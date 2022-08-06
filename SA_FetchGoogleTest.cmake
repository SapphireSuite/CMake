# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

include(FetchContent)

# Clone GoogleTest repository at config time and add it to ThirdParty/.
# Automatically init git submodules.
#
# USAGE:
#	SA_FetchGoogleTest()
#
function(SA_FetchGoogleTest)

	if(NOT TARGET gtest)

		message("Fetching Google Test...")

		FetchContent_Declare(
			googletest
			GIT_REPOSITORY https://github.com/google/googletest.git
			GIT_TAG        release-1.11.0
			SOURCE_DIR		${CMAKE_SOURCE_DIR}/ThirdParty/googletest
		)

		FetchContent_MakeAvailable(googletest)

	endif()

endfunction(SA_FetchGoogleTest)
