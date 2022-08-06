# Copyright (c) 2022 Sapphire's Suite. All Rights Reserved.

include(Internal/SA_SetupConfiguration.cmake)

# Setup project with Sapphire Suite's requirements.
#
# USAGE:
#	SA_ConfigureProject(
#		<project>
#	)
#
# ARGUMENTS:
#	PROJECT
#		Name of the cmake project.
macro(SA_ConfigureProject PROJECT)

	message("[SA] ${PROJECT} Main directory: ${CMAKE_CURRENT_SOURCE_DIR}")

	# Organize targets (and nesting targets) in IDE.
	set_property(GLOBAL PROPERTY USE_FOLDERS ON)

	__SA_SetupConfiguration()

endmacro(SA_ConfigureProject)
