cmake_minimum_required(VERSION 2.8)
project(dummy_dynamic)

set(SRC
	main.cpp
)

set(INC
)

set(LIBS
    )

set(CMAKE_SKIP_BUILD_RPATH FALSE)
set(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE)
set(CMAKE_INSTALL_RPATH "\$ORIGIN")

set(COMPILER_FLAGS)
set(LINKER_FLAGS)

include_directories(${INC})
add_library(${PROJECT_NAME} SHARED ${SRC})
set_target_properties(${PROJECT_NAME} PROPERTIES
    COMPILE_FAGS "${COMPILER_FLAGS}" LINK_FLAGS "${LINKER_FLAGS}")
target_link_libraries(${PROJECT_NAME} PRIVATE ${LIBS})

