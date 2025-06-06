# CHECA0
tape 0101010100110100010010001011100000aAB 

init qStart
accept qAccept

# Preprocessing

qStart,0,_,_,qStart,0,_,_,>,-,-
qStart,1,_,_,qStart1,1,_,_,>,-,-
qStart1,0,_,_,qStart,0,_,_,>,-,-
qStart1,1,_,_,qStart11,1,_,_,>,-,-
qStart11,0,_,_,qStart,0,_,_,>,-,-
qStart11,1,_,_,qStartCopy,1,_,_,>,-,-

qStartCopy,&_,_,_,qStartCopy,&_,&_,_,>,>,-
qStartCopy,_,_,_,qStartClear,_,_,_,<,<,-

qStartClear,&_,&_,_,qStartClear,_,&_,_,<,<,-

qStartClear,1,_,_,qStartClear1,_,_,_,<,-,-
qStartClear1,1,_,_,qStartClear11,_,_,_,<,-,-
qStartClear11,1,_,_,qStartBack,_,_,_,<,-,-

qStartBack,0,_,_,qStartBack,0,_,_,<,-,-
qStartBack,1,_,_,qStartBack,1,_,_,<,-,-
qStartBack,_,_,_,qFind,_,_,0,>,>,-

# Try to find an available transition

qFind,0,@,0,qFind,0,@,0,>,-,>
qFind,0,@,_,qFindNext,0,@,_,>,-,-
qFind,1,@,0,qFindEnd,1,@,0,>,-,>
qFind,1,@,_,qFindRead,1,@,_,>,-,-

qFindEnd,0,@,0,qFindEnd,0,@,0,-,-,>
qFindEnd,0,@,_,qFindNext,0,@,_,-,-,-

qFindRead,0,@,_,qFindRead0,0,@,_,>,-,-

###########

qFindRead0,0,@,_,qFindRead1,0,@,_,>,-,-
qFindRead1,0,@,_,qFindRead_,0,@,_,>,-,-
qFindRead_,0,@,_,qFindRead2,0,@,_,>,-,-
qFindRead2,0,@,_,qFindRead3,0,@,_,>,-,-
qFindRead3,0,@,_,qFindRead4,0,@,_,>,-,-
qFindRead4,0,@,_,qFindRead5,0,@,_,>,-,-
qFindRead5,0,@,_,qFindRead6,0,@,_,>,-,-
qFindRead6,0,@,_,qFindRead7,0,@,_,>,-,-
qFindRead7,0,@,_,qFindRead8,0,@,_,>,-,-
qFindRead8,0,@,_,qFindRead9,0,@,_,>,-,-
qFindRead9,0,@,_,qFindReada,0,@,_,>,-,-
qFindReada,0,@,_,qFindReadb,0,@,_,>,-,-
qFindReadb,0,@,_,qFindReadc,0,@,_,>,-,-
qFindReadc,0,@,_,qFindReadd,0,@,_,>,-,-
qFindReadd,0,@,_,qFindReade,0,@,_,>,-,-
qFindReade,0,@,_,qFindReadf,0,@,_,>,-,-
qFindReadf,0,@,_,qFindReadg,0,@,_,>,-,-
qFindReadg,0,@,_,qFindReadh,0,@,_,>,-,-
qFindReadh,0,@,_,qFindReadi,0,@,_,>,-,-
qFindReadi,0,@,_,qFindReadj,0,@,_,>,-,-
qFindReadj,0,@,_,qFindReadk,0,@,_,>,-,-
qFindReadk,0,@,_,qFindReadl,0,@,_,>,-,-
qFindReadl,0,@,_,qFindReadm,0,@,_,>,-,-
qFindReadm,0,@,_,qFindReadn,0,@,_,>,-,-
qFindReadn,0,@,_,qFindReado,0,@,_,>,-,-
qFindReado,0,@,_,qFindReadp,0,@,_,>,-,-
qFindReadp,0,@,_,qFindReadq,0,@,_,>,-,-
qFindReadq,0,@,_,qFindReadr,0,@,_,>,-,-
qFindReadr,0,@,_,qFindReads,0,@,_,>,-,-
qFindReads,0,@,_,qFindReadt,0,@,_,>,-,-
qFindReadt,0,@,_,qFindReadu,0,@,_,>,-,-
qFindReadu,0,@,_,qFindReadv,0,@,_,>,-,-
qFindReadv,0,@,_,qFindReadw,0,@,_,>,-,-
qFindReadw,0,@,_,qFindReadx,0,@,_,>,-,-
qFindReadx,0,@,_,qFindReady,0,@,_,>,-,-
qFindReady,0,@,_,qFindReadz,0,@,_,>,-,-
qFindReadz,0,@,_,qFindReadA,0,@,_,>,-,-
qFindReadA,0,@,_,qFindReadB,0,@,_,>,-,-
qFindReadB,0,@,_,qFindReadC,0,@,_,>,-,-
qFindReadC,0,@,_,qFindReadD,0,@,_,>,-,-
qFindReadD,0,@,_,qFindReadE,0,@,_,>,-,-
qFindReadE,0,@,_,qFindReadF,0,@,_,>,-,-
qFindReadF,0,@,_,qFindReadG,0,@,_,>,-,-
qFindReadG,0,@,_,qFindReadH,0,@,_,>,-,-
qFindReadH,0,@,_,qFindReadI,0,@,_,>,-,-
qFindReadI,0,@,_,qFindReadJ,0,@,_,>,-,-
qFindReadJ,0,@,_,qFindReadK,0,@,_,>,-,-
qFindReadK,0,@,_,qFindReadL,0,@,_,>,-,-
qFindReadL,0,@,_,qFindReadM,0,@,_,>,-,-
qFindReadM,0,@,_,qFindReadN,0,@,_,>,-,-
qFindReadN,0,@,_,qFindReadO,0,@,_,>,-,-
qFindReadO,0,@,_,qFindReadP,0,@,_,>,-,-
qFindReadP,0,@,_,qFindReadQ,0,@,_,>,-,-
qFindReadQ,0,@,_,qFindReadR,0,@,_,>,-,-
qFindReadR,0,@,_,qFindReadS,0,@,_,>,-,-
qFindReadS,0,@,_,qFindReadT,0,@,_,>,-,-
qFindReadT,0,@,_,qFindReadU,0,@,_,>,-,-
qFindReadU,0,@,_,qFindReadV,0,@,_,>,-,-
qFindReadV,0,@,_,qFindReadW,0,@,_,>,-,-
qFindReadW,0,@,_,qFindReadX,0,@,_,>,-,-
qFindReadX,0,@,_,qFindReadY,0,@,_,>,-,-
qFindReadY,0,@,_,qFindReadZ,0,@,_,>,-,-
qFindReadZ,0,@,_,qFindRead!,0,@,_,>,-,-
qFindRead!,0,@,_,qFindRead",0,@,_,>,-,-
qFindRead",0,@,_,qFindRead#,0,@,_,>,-,-
qFindRead#,0,@,_,qFindRead$,0,@,_,>,-,-
qFindRead$,0,@,_,qFindRead%,0,@,_,>,-,-
qFindRead%,0,@,_,qFindRead\,0,@,_,>,-,-
qFindRead\,0,@,_,qFindRead',0,@,_,>,-,-
qFindRead',0,@,_,qFindRead(,0,@,_,>,-,-
qFindRead(,0,@,_,qFindRead),0,@,_,>,-,-
qFindRead),0,@,_,qFindRead*,0,@,_,>,-,-
qFindRead*,0,@,_,qFindRead+,0,@,_,>,-,-
qFindRead+,0,@,_,qFindRead-,0,@,_,>,-,-
qFindRead-,0,@,_,qFindRead.,0,@,_,>,-,-
qFindRead.,0,@,_,qFindRead/,0,@,_,>,-,-
qFindRead/,0,@,_,qFindRead:,0,@,_,>,-,-
qFindRead:,0,@,_,qFindRead;,0,@,_,>,-,-
qFindRead;,0,@,_,qFindRead<,0,@,_,>,-,-
qFindRead<,0,@,_,qFindRead=,0,@,_,>,-,-
qFindRead=,0,@,_,qFindRead>,0,@,_,>,-,-
qFindRead>,0,@,_,qFindRead?,0,@,_,>,-,-
qFindRead?,0,@,_,qFindRead[,0,@,_,>,-,-
qFindRead[,0,@,_,qFindRead],0,@,_,>,-,-
qFindRead],0,@,_,qFindRead^,0,@,_,>,-,-
qFindRead^,0,@,_,qFindRead`,0,@,_,>,-,-
qFindRead`,0,@,_,qFindRead{,0,@,_,>,-,-
qFindRead{,0,@,_,qFindRead|,0,@,_,>,-,-
qFindRead|,0,@,_,qFindRead},0,@,_,>,-,-
qFindRead},0,@,_,qFindRead~,0,@,_,>,-,-

qFindRead0,1,&0,_,qFindNext,1,&0,_,>,-,-
qFindRead0,1,0,_,qUpdateState,1,0,_,>,-,<

qFindRead1,1,&1,_,qFindNext,1,&1,_,>,-,-
qFindRead1,1,1,_,qUpdateState,1,1,_,>,-,<

qFindRead000,1,&_,_,qFindNext,1,&_,_,>,-,-
qFindRead000,1,_,_,qUpdateState,1,_,_,>,-,<

qFindRead0000,1,&2,_,qFindNext,1,&2,_,>,-,-
qFindRead0000,1,2,_,qUpdateState,1,2,_,>,-,<

qFindRead00000,1,&3,_,qFindNext,1,&3,_,>,-,-
qFindRead00000,1,3,_,qUpdateState,1,3,_,>,-,<

###########

qUpdateState,0,@,0,qUpdateState,0,@,_,-,-,<
qUpdateState,0,@,_,qStateCopy,0,@,_,-,-,>

qStateCopy,0,@,_,qStateCopy,0,@,0,>,-,>
qStateCopy,1,@,_,qUpdateValue,1,@,_,>,-,-

qUpdateValue,0,@,_,qUpdateValue0,0,@,_,>,-,-
qUpdateValue0,0,@,_,qUpdateValue00,0,@,_,>,-,-

qUpdateValue0,1,@,_,qMove,1,0,_,>,-,-

qUpdateValue00,0,@,_,qUpdateValue000,0,@,_,>,-,-

qUpdateValue00,1,@,_,qMove,1,1,_,>,-,-

qUpdateValue000,1,@,_,qMove,1,_,_,>,-,-

qMove,0,@,_,qMove0,0,@,_,>,-,-

qMove0,0,@,_,qMove00,0,@,_,>,-,-
qMove0,1,@,_,qMoveBack,1,@,_,>,<,-
qMove0,_,@,_,qMoveBack,_,@,_,<,<,-

qMove00,1,@,_,qMoveBack,1,@,_,>,>,-
qMove00,_,@,_,qMoveBack,_,@,_,<,>,-

qMoveBack,1,@,_,qMoveBack,1,@,_,<,-,-
qMoveBack,0,@,_,qMoveBack,0,@,_,<,-,-
qMoveBack,_,@,_,qMoveBackState,_,@,_,-,-,<

qMoveBackState,_,@,0,qMoveBackState,_,@,0,-,-,<
qMoveBackState,_,@,_,qFind,_,@,_,>,-,>

qFindNext,0,@,_,qFindNext,0,@,_,>,-,-
qFindNext,1,@,_,qFindNext1,1,@,_,>,-,-

qFindNext,_,@,_,qEnd,_,@,_,-,-,<

qFindNext1,0,@,_,qFindNext,0,@,_,>,-,-
qFindNext1,1,@,_,qFindBack,1,@,_,-,-,<

qFindBack,1,@,0,qFindBack,1,@,0,-,-,<
qFindBack,1,@,_,qFind,1,@,_,>,-,>

# Posprocessing

qEnd,_,@,0,qEnd0,_,@,0,-,-,<
qEnd0,_,@,0,qEnd00,_,@,0,-,-,<
qEnd00,_,@,_,qAccept,_,@,_,-,-,-
