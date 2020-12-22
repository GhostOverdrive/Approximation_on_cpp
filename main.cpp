#include <iostream>
#include <graphics.h>
#include <conio.h>
#include <math.h>

using namespace std;

int main()
{
	const double n = 6, x[6] = {1, 2, 3, 4, 5, 6}, y[6] = {2, -9, 5, -99, 6, -30};
	double sx = 0, sy = 0, sxx = 0, sxy = 0;
	for (int i = 0; i < n; i++)
	{
		sx += x[i];
		sy += y[i];
		sxx += x[i] * x[i];
		sxy += x[i] * y[i];
	}
	double d = n * sxx - sx * sx;
	double dk = n * sxy - sy * sx;
	double db = sxx * sy - sx * sxy;
	double k = dk / d;
	double b = db / d;
	cout << k << ' ' << b;
}
