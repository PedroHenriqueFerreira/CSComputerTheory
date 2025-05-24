@Programa Fonte UFC
# Coloca a^nb^n na palavra
fita aaabbb
init q0
accept qf

q0,a,q1,A,>
q0,_,q3,_,<
q0,B,q4,B,>
q1,a,q1,a,>
q1,B,q1,B,>
q1,b,q2,B,<
q2,a,q2,a,<
q2,B,q2,B,<
q2,A,q0,A,>
q4,B,q4,B,>
q4,_,q3,_,<
q3,A,q3,A,<
q3,B,q3,B,<
q3,_,qf,_,>