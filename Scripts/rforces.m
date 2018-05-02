function Tau = rforces(L,thing_to_diff)
 syms dummy
 syms t
 % ZA DA SE KORISTI FUNKCIJAVA MORA DA SE DEFINIRAAT 
 % PROMENLIVITE KAKO FUNKCII OD NEKOJA PROMENLIVA
 % PRIMER :d(t), O1(t) , h(t) ... 
 
 
 % thing_to_diff e po shto da diferenciram odnosno po koja promenliva
 % diff_of_thing_to_diff e diferencijal od promenlivata
 diff_of_thing_to_diff = diff(thing_to_diff);
 % zamena na diferencijalot so dummy var za da go diferenciram
 % i na kraj da ja vratam smenata
 % ova e delot d/dt(dl/dq*)
 
 L1=subs(L,diff_of_thing_to_diff,dummy);

 L1=diff(L1,dummy);

 L1=subs(L1,dummy,diff_of_thing_to_diff);

 L1=diff(L1,t);
 
 % ova e delot -dL/dq
 
 L2=subs(L,thing_to_diff,dummy);

 L2=diff(L2,dummy);

 L2=subs(L2,dummy,thing_to_diff);
 
 
 Tau=L1-L2;


end 