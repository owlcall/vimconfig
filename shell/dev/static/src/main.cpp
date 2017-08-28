//
// main.cpp
//
// Copyright © 2017. All rights reserved.
//

#include <dummy_header.h>
#include <iostream>

extern "C++"
{
	void dummy_header()
	{
		using namespace std;
		cout << "Hello world from static lib \"dummy_header\"!" << endl;
	}
}
