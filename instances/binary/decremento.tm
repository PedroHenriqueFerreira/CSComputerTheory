tape 10000
init q0
accept qf

q0,0,q0,0,>
q0,1,q0,1,>
q0,_,q1,_,<

q1,0,q1,0,<
q1,1,q2,0,>

q2,0,q2,1,>
q2,_,qf,_,<