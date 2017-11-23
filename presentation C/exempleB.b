infact (n)
{
  auto f, i, j;                     /* no initialization for auto variables */
  extrn fact;                       /* "What would I do differently if designing
                                    *  UNIX today?  I'd spell creat() with an e."
                                    *  -- Ken Thompson, approx. wording */

  f = 1.;                           /* floating point constant */
  j = 0.;
  for (i = 0; i <= n; ++i) {
    fact[i] = f =#* j;              /* note spelling =#* not #*= */
    j =#+ 1.;                       /* #+ for floating add */
  }

  return (f);                       /* at least, I think the () were required */
}

TOPFACT = 10;                       /* equivalent of #define, allows numeric values only */
fact[TOPFACT];