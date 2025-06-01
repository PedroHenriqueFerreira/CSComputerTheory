tape 101010101001101001010010011010001001000101111001
#               ^	          ^               ^
#               |             |               |

init qStart
accept qAccept


qStart,0,_,_,qStart,0,_,_,>,-,-
qStart,1,_,_,qSearch1,1,_,_,>,-,-
qSearch1,0,_,_,qStart,0,_,_,>,-,-
qSearch1,1,_,_,qSearch11,1,_,_,>,-,-
qSearch11,0,_,_,qStart,0,_,_,>,-,-
qSearch11,1,_,_,qSearch111,1,_,_,>,-,-
qSearch111,0,_,_,qSearch111,0,0,_,>,>,-
qSearch111,1,_,_,qSearch111,1,1,_,>,>,-
qSearch111,_,_,_,qClearTape1,_,_,_,<,<,-
qClearTape1,0,0,_,qClearTape1,_,0,_,<,<,-
qClearTape1,1,1,_,qClearTape1,_,1,_,<,<,-
qClearTape1,0,_,_,qBackToStart,0,_,_,<,-,-
qClearTape1,1,_,_,qBackToStart,1,_,_,<,-,-
qBackToStart,0,_,_,qBackToStart,0,_,_,<,-,-
qBackToStart,1,_,_,qBackToStart,1,_,_,<,-,-
qBackToStart,_,_,_,qSetState,_,_,0,-,-,<
qSetState,_,_,_,qCompute,_,_,_,>,>,>
qCompute,1,1,0,qCompute,1,1,0,>,-,-