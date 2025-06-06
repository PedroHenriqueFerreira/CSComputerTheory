tape 10010
init q0
accept q0
accept qf

q0,0,q1,0,>
q0,1,q1,1,>
q1,0,q1,0,>
q1,1,q1,1,>
q1,_,q2,_,<
q2,0,q3,o,>
q2,1,q5,i,>
q3,i,q3,i,>
q3,o,q3,o,>
q3,_,q4,o,<
q4,i,q4,i,<
q4,o,q4,o,<
q4,0,q3,o,>
q4,1,q5,i,>
q5,i,q5,i,>
q5,o,q5,o,>
q5,_,q6,i,<
q6,i,q6,i,<
q6,o,q6,o,<
q6,0,q3,o,>
q6,1,q5,i,>
q4,_,qf,_,>
q6,_,qf,_,>
qf,o,qf,0,>
qf,i,qf,1,>