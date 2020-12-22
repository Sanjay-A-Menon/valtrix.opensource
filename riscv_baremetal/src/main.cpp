int mult(int a,int b)
{

	return(a*b);
}



extern "C" int hang(int a, int b)
{
	//while(1){}
	//return (a+b);

	return(mult(a,b));
}
