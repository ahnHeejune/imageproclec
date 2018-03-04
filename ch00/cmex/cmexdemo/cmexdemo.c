#include "mex.h"

void mexFunction(int ds, mxArray *d[], int ss, const mxArray *s[])
{
	mexPrintf("CMEX: %d, %d", ds, ss);		  
}