float infact (n) int n;
{
  float f = 1;
  int i;
  extern float fact[];

  for (i = 0; i <= n; ++i)
    fact[i] = f *= i;

    return f;
  }

#define TOPFACT 10
float fact[TOPFACT+1];

