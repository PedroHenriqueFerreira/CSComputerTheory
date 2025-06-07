tape 11110
init q0
accept qf

q0,0,q3,0,<
q0,1,q3,1,<
q3,_,qf,_,>

qf,0,qf,0,>
qf,1,q1,1,>
q1,1,qf,1,>
q1,0,q2,0,>
q2,1,q2,1,>
q2,0,q1,0,>