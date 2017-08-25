cmake_minimum_required(VERSION 2.8)
project(placeholder_project)

set(SRC
	main.cpp
)

set(LIBS
)

set(INC
)

include_directories(${INC})
add_executable(${PROJECT_NAME} ${SRC})
target_link_libraries(${PROJECT_NAME} PRIVATE ${LIBS})

