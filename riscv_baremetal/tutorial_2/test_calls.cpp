/*

test_calls.cpp
A simple C++ program to test calls from assembly(test_calls.s) to C++ code

*/

//A function to multiply two integers and return the value as an integer
int mult(int a,int b)
{

	return(a*b);
}

//The main function which is called from Assembly
extern "C" int test(int a, int b)
{

	return(mult(a,b));
}
