# tape 0101010100110100010010001011100000 # CHECA0
# tape 010101001001101001010100110100010010001011110101 # COMPLEMENTO
# tape 01010101001101001010010011010001000100010110001001000101011000101001001011000100010010010011111111 # INCREMENTO
# tape 010101010011010010100100110100010001000101100010100010101100010010000101001100001010000100100110000100010010001011110000 # DECREMENTO
tape 0101000101011010010001001011000100010010001001100101001010011001001000010010011000010010010010011000010100000101001100000100100000100100110000010100001010011111110 # MULTIPLOS3
tape 0100100010001001101010000000100010011010001001000101100010100001010011000100100001001001100010001001000101100001010000101001100001001000010010011000010001000001000101100000100100000010001011000000101000000101011000000100100000010010110000001000101000100110000000101000000001010011000000010010000000010010011000000010001001000101100000000101000000001010011000000001001000000001001001100000000100010000000001000101100000000010100000010001011101011 # PALINDROMO


init qStart
accept qAccept

# Preprocessing

qStart,0,_,_,qStart,0,_,_,>,-,-
qStart,1,_,_,qStart1,1,_,_,>,-,-
qStart1,0,_,_,qStart,0,_,_,>,-,-
qStart1,1,_,_,qStart11,1,_,_,>,-,-
qStart11,0,_,_,qStart,0,_,_,>,-,-
qStart11,1,_,_,qStartCopy,1,_,_,>,-,-

qStartCopy,0,_,_,qStartCopy,0,0,_,>,>,-
qStartCopy,1,_,_,qStartCopy,1,1,_,>,>,-
qStartCopy,_,_,_,qStartClear,_,_,_,<,<,-

qStartClear,0,0,_,qStartClear,_,0,_,<,<,-
qStartClear,1,1,_,qStartClear,_,1,_,<,<,-
qStartClear,1,_,_,qStartClear1,_,_,_,<,-,-
qStartClear1,1,_,_,qStartClear11,_,_,_,<,-,-
qStartClear11,1,_,_,qStartBack,_,_,_,<,-,-

qStartBack,0,_,_,qStartBack,0,_,_,<,-,-
qStartBack,1,_,_,qStartBack,1,_,_,<,-,-
qStartBack,_,_,_,qFind,_,_,0,>,>,-

# Try to find an available transition

qFind,0,_,0,qFind,0,_,0,>,-,>
qFind,0,0,0,qFind,0,0,0,>,-,>
qFind,0,1,0,qFind,0,1,0,>,-,>
qFind,0,_,_,qFindNext,0,_,_,>,-,-
qFind,0,0,_,qFindNext,0,0,_,>,-,-
qFind,0,1,_,qFindNext,0,1,_,>,-,-
qFind,1,_,0,qFindEnd,1,_,0,>,-,>
qFind,1,0,0,qFindEnd,1,0,0,>,-,>
qFind,1,1,0,qFindEnd,1,1,0,>,-,>
qFind,1,_,_,qFindRead,1,_,_,>,-,-
qFind,1,0,_,qFindRead,1,0,_,>,-,-
qFind,1,1,_,qFindRead,1,1,_,>,-,-

qFindEnd,0,_,0,qFindEnd,0,_,0,-,-,>
qFindEnd,0,0,0,qFindEnd,0,0,0,-,-,>
qFindEnd,0,1,0,qFindEnd,0,1,0,-,-,>
qFindEnd,0,_,_,qFindNext,0,_,_,-,-,-
qFindEnd,0,0,_,qFindNext,0,0,_,-,-,-
qFindEnd,0,1,_,qFindNext,0,1,_,-,-,-

qFindRead,0,_,_,qFindRead0,0,_,_,>,-,-
qFindRead,0,0,_,qFindRead0,0,0,_,>,-,-
qFindRead,0,1,_,qFindRead0,0,1,_,>,-,-
qFindRead0,0,_,_,qFindRead00,0,_,_,>,-,-
qFindRead0,0,0,_,qFindRead00,0,0,_,>,-,-
qFindRead0,0,1,_,qFindRead00,0,1,_,>,-,-
qFindRead0,1,_,_,qFindNext,1,_,_,>,-,-
qFindRead0,1,0,_,qUpdateState,1,0,_,>,-,<
qFindRead0,1,1,_,qFindNext,1,1,_,>,-,-
qFindRead00,0,_,_,qFindRead000,0,_,_,>,-,-
qFindRead00,0,0,_,qFindRead000,0,0,_,>,-,-
qFindRead00,0,1,_,qFindRead000,0,1,_,>,-,-
qFindRead00,1,_,_,qFindNext,1,_,_,>,-,-
qFindRead00,1,0,_,qFindNext,1,0,_,>,-,-
qFindRead00,1,1,_,qUpdateState,1,1,_,>,-,<
qFindRead000,1,_,_,qUpdateState,1,_,_,>,-,<
qFindRead000,1,0,_,qFindNext,1,0,_,>,-,-
qFindRead000,1,1,_,qFindNext,1,1,_,>,-,-

qUpdateState,0,_,0,qUpdateState,0,_,_,-,-,<
qUpdateState,0,0,0,qUpdateState,0,0,_,-,-,<
qUpdateState,0,1,0,qUpdateState,0,1,_,-,-,<
qUpdateState,0,_,_,qStateCopy,0,_,_,-,-,>
qUpdateState,0,0,_,qStateCopy,0,0,_,-,-,>
qUpdateState,0,1,_,qStateCopy,0,1,_,-,-,>

qStateCopy,0,_,_,qStateCopy,0,_,0,>,-,>
qStateCopy,0,0,_,qStateCopy,0,0,0,>,-,>
qStateCopy,0,1,_,qStateCopy,0,1,0,>,-,>
qStateCopy,1,_,_,qUpdateValue,1,_,_,>,-,-
qStateCopy,1,0,_,qUpdateValue,1,0,_,>,-,-
qStateCopy,1,1,_,qUpdateValue,1,1,_,>,-,-

qUpdateValue,0,_,_,qUpdateValue0,0,_,_,>,-,-
qUpdateValue,0,0,_,qUpdateValue0,0,0,_,>,-,-
qUpdateValue,0,1,_,qUpdateValue0,0,1,_,>,-,-
qUpdateValue0,0,_,_,qUpdateValue00,0,_,_,>,-,-
qUpdateValue0,0,0,_,qUpdateValue00,0,0,_,>,-,-
qUpdateValue0,0,1,_,qUpdateValue00,0,1,_,>,-,-
qUpdateValue0,1,_,_,qMove,1,0,_,>,-,-
qUpdateValue0,1,0,_,qMove,1,0,_,>,-,-
qUpdateValue0,1,1,_,qMove,1,0,_,>,-,-
qUpdateValue00,0,_,_,qUpdateValue000,0,_,_,>,-,-
qUpdateValue00,0,0,_,qUpdateValue000,0,0,_,>,-,-
qUpdateValue00,0,1,_,qUpdateValue000,0,1,_,>,-,-
qUpdateValue00,1,_,_,qMove,1,1,_,>,-,-
qUpdateValue00,1,0,_,qMove,1,1,_,>,-,-
qUpdateValue00,1,1,_,qMove,1,1,_,>,-,-
qUpdateValue000,1,_,_,qMove,1,_,_,>,-,-
qUpdateValue000,1,0,_,qMove,1,_,_,>,-,-
qUpdateValue000,1,1,_,qMove,1,_,_,>,-,-

qMove,0,_,_,qMove0,0,_,_,>,-,-
qMove,0,0,_,qMove0,0,0,_,>,-,-
qMove,0,1,_,qMove0,0,1,_,>,-,-
qMove0,0,_,_,qMove00,0,_,_,>,-,-
qMove0,0,0,_,qMove00,0,0,_,>,-,-
qMove0,0,1,_,qMove00,0,1,_,>,-,-
qMove0,1,_,_,qMoveBack,1,_,_,>,<,-
qMove0,1,0,_,qMoveBack,1,0,_,>,<,-
qMove0,1,1,_,qMoveBack,1,1,_,>,<,-
qMove0,_,_,_,qMoveBack,_,_,_,<,<,-
qMove0,_,0,_,qMoveBack,_,0,_,<,<,-
qMove0,_,1,_,qMoveBack,_,1,_,<,<,-
qMove00,1,_,_,qMoveBack,1,_,_,>,>,-
qMove00,1,0,_,qMoveBack,1,0,_,>,>,-
qMove00,1,1,_,qMoveBack,1,1,_,>,>,-
qMove00,_,_,_,qMoveBack,_,_,_,<,>,-
qMove00,_,0,_,qMoveBack,_,0,_,<,>,-
qMove00,_,1,_,qMoveBack,_,1,_,<,>,-

qMoveBack,1,_,_,qMoveBack,1,_,_,<,-,-
qMoveBack,1,0,_,qMoveBack,1,0,_,<,-,-
qMoveBack,1,1,_,qMoveBack,1,1,_,<,-,-
qMoveBack,0,_,_,qMoveBack,0,_,_,<,-,-
qMoveBack,0,0,_,qMoveBack,0,0,_,<,-,-
qMoveBack,0,1,_,qMoveBack,0,1,_,<,-,-
qMoveBack,_,_,_,qMoveBackState,_,_,_,-,-,<
qMoveBack,_,0,_,qMoveBackState,_,0,_,-,-,<
qMoveBack,_,1,_,qMoveBackState,_,1,_,-,-,<

qMoveBackState,_,_,0,qMoveBackState,_,_,0,-,-,<
qMoveBackState,_,0,0,qMoveBackState,_,0,0,-,-,<
qMoveBackState,_,1,0,qMoveBackState,_,1,0,-,-,<
qMoveBackState,_,_,_,qFind,_,_,_,>,-,>
qMoveBackState,_,0,_,qFind,_,0,_,>,-,>
qMoveBackState,_,1,_,qFind,_,1,_,>,-,>

qFindNext,0,_,_,qFindNext,0,_,_,>,-,-
qFindNext,0,0,_,qFindNext,0,0,_,>,-,-
qFindNext,0,1,_,qFindNext,0,1,_,>,-,-
qFindNext,1,_,_,qFindNext1,1,_,_,>,-,-
qFindNext,1,0,_,qFindNext1,1,0,_,>,-,-
qFindNext,1,1,_,qFindNext1,1,1,_,>,-,-
qFindNext,_,_,_,qEnd,_,_,_,-,-,<
qFindNext,_,0,_,qEnd,_,0,_,-,-,<
qFindNext,_,1,_,qEnd,_,1,_,-,-,<
qFindNext1,0,_,_,qFindNext,0,_,_,>,-,-
qFindNext1,0,0,_,qFindNext,0,0,_,>,-,-
qFindNext1,0,1,_,qFindNext,0,1,_,>,-,-
qFindNext1,1,_,_,qFindBack,1,_,_,-,-,<
qFindNext1,1,0,_,qFindBack,1,0,_,-,-,<
qFindNext1,1,1,_,qFindBack,1,1,_,-,-,<

qFindBack,1,_,0,qFindBack,1,_,0,-,-,<
qFindBack,1,0,0,qFindBack,1,0,0,-,-,<
qFindBack,1,1,0,qFindBack,1,1,0,-,-,<
qFindBack,1,_,_,qFind,1,_,_,>,-,>
qFindBack,1,0,_,qFind,1,0,_,>,-,>
qFindBack,1,1,_,qFind,1,1,_,>,-,>

# Posprocessing

qEnd,_,_,0,qEnd0,_,_,0,-,-,<
qEnd,_,0,0,qEnd0,_,0,0,-,-,<
qEnd,_,1,0,qEnd0,_,1,0,-,-,<

qEnd0,_,_,0,qEnd00,_,_,0,-,-,<
qEnd0,_,0,0,qEnd00,_,0,0,-,-,<
qEnd0,_,1,0,qEnd00,_,1,0,-,-,<

qEnd00,_,_,_,qAccept,_,_,_,-,-,-
qEnd00,_,0,_,qAccept,_,0,_,-,-,-
qEnd00,_,1,_,qAccept,_,1,_,-,-,-
