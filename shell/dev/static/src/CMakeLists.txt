cmake_minimum_required(VERSION 2.8)
project(dummy_static)

set(SRC
	main.cpp
)

set(INC
)

set(COMPILER_FLAGS)
set(LINKER_FLAGS)

include_directories(${INC})
add_library(${PROJECT_NAME} STATIC ${SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES
    COMPILE_FAGS "${COMPILER_FLAGS}" LINK_FLAGS "${LINKER_FLAGS}")

