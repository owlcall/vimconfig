cmake_minimum_required(VERSION 2.8)
project(dummy_binary)

set(SRC
	main.cpp
)

set(LIBS
)

set(INC
)

set(COMPILER_FLAGS)
set(LINKER_FLAGS)

include_directories(${INC})
add_executable(${PROJECT_NAME} ${SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES
    COMPILE_FAGS "${COMPILER_FLAGS}" LINK_FLAGS "${LINKER_FLAGS}")
target_link_libraries(${PROJECT_NAME} PRIVATE ${LIBS})

