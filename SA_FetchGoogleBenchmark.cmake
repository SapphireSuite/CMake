# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

include(FetchContent)

# Clone Google Benchmark repository at config time and add it to ThirdParty/.
# Automatically init git submodules.
#
# USAGE:
#	SA_FetchGoogleBenchmark()
#
function(SA_FetchGoogleBenchmark)

	if(NOT TARGET benchmark)

		message("Fetching Google Benchmark...")

		FetchContent_Declare(
			googlebenchmark
			GIT_REPOSITORY https://github.com/google/benchmark.git
			GIT_TAG        v1.6.0
			SOURCE_DIR		${CMAKE_SOURCE_DIR}/ThirdParty/googlebenchmark
		)

		FetchContent_MakeAvailable(googlebenchmark)

	endif()

endfunction(SA_FetchGoogleBenchmark)
