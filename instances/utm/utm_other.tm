# CHECA0
# tape 0101010100110100010010001011100000 

# COMPLEMENTO
# tape 010101001001101001010100110100010010001011110101 

# INCREMENTO
# tape 01010101001101001010010011010001000100010110001001000101011000101001001011000100010010010011111111 

# DECREMENTO
# tape 010101010011010010100100110100010001000101100010100010101100010010000101001100001010000100100110000100010010001011110000 

# MULTIPLOS3
# tape 0101000101011010010001001011000100010010001001100101001010011001001000010010011000010010010010011000010100000101001100000100100000100100110000010100001010011111110 

# PALINDROMO
# tape 0100100010001001101010000000100010011010001001000101100010100001010011000100100001001001100010001001000101100001010000101001100001001000010010011000010001000001000101100000100100000010001011000000101000000101011000000100100000010010110000001000101000100110000000101000000001010011000000010010000000010010011000000010001001000101100000000101000000001010011000000001001000000001001001100000000100010000000001000101100000000010100000010001011101011 

# ANBN
# tape 01000000000000100010000000000000000000000000000000000000010011010001000001000101101000000000000000000000000000000000000000100000010000000000000000000000000000000000000001001100010000000000001000100000000000010011000100000000000000000000000000000000000000010001000000000000000000000000000000000000000100110001000000000000010000100000000000000000000000000000000000000010110000100000000000010000100000000000010110000100000000000000000000000000000000000000010000100000000000000000000000000000000000000010110000100000000000000000000000000000000000000101000000000000000000000000000000000000001001100000010000000000000000000000000000000000000001000000100000000000000000000000000000000000000010011000000100010000010001011000001000000000000000000000000000000000000001000001000000000000000000000000000000000000001011000001000000000000000000000000000000000000000100000100000000000000000000000000000000000000010110000010001001000100111aaabbb

# DUPLICADO
# tape 01010001010011010010001001001100010100010100110001001000100100110001000100001000101100001010000010000000000000000000000000010011000010010000000100000000000000000000100110000010000000000000000000010000010000000000000000000010011000001000000000000000000000000001000001000000000000000000000000001001100000100010000001000000000000000000000000001011000000100000000000000000000100000010000000000000000000010110000001000000000000000000000000001000000100000000000000000000000000101100000010100000100000000000000000000000000100110000001001000000010000000000000000000010011000000010000000000000000000010000000100000000000000000000100110000000100000000000000000000000000100000001000000000000000000000000001001100000001000100000000100000000000000000000101100000000100000000000000000000100000000100000000000000000000101100000000100000000000000000000000000100000000100000000000000000000000000101100000000101000001000000000000000000000000001001100000000100100000001000000000000000000001001100000010001001000100110000000010001001000100110010000000000000000000000000010010100110010000000000000000000010010010011110010

# XY
# tape 010010100100110101010100110100010001000000000000000000000000000000000000101100010100010101100010010001001011000100010010000000000000000000000000000000000010011110101

# ANBNCN

tape 010000000000001000100000000000000000000000000000000000000100110100010000010001011010000000000000000000000000000000000000001000000100000000000000000000000000000000000000010011000100000000000010001000000000000100110001000000000000000000000000000000000000000100010000000000000000000000000000000000000001001100010000000000000100000001000000000000000000000000000000000000000100110000000100000000000001000000010000000000000100110000000100000000000000000000000000000000000000001000000010000000000000000000000000000000000000000100110000000100000000000000100001000000000000000000000000000000000000000010110000100000000000010000100000000000010110000100000000000000000000000000000000000000010000100000000000000000000000000000000000000010110000100000000000001000010000000000000101100001000000000000000000000000000000000000000010000100000000000000000000000000000000000000001011000010000000000000000000000000000000000000010100000000000000000000000000000000000000100110000001000000000000000000000000000000000000000100000010000000000000000000000000000000000000001001100000010000000000000000000000000000000000000000100000010000000000000000000000000000000000000000100110000001000100000100010110000010000000000000000000000000000000000000010000010000000000000000000000000000000000000010110000010000000000000000000000000000000000000001000001000000000000000000000000000000000000000101100000100000000000000000000000000000000000000001000001000000000000000000000000000000000000000010110000010001001000100111aabbcc


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

# All possible atoms to read

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
qFindRead%,0,@,_,qFindRead',0,@,_,>,-,-
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
qFindRead_,1,&_,_,qFindNext,1,&_,_,>,-,-
qFindRead_,1,_,_,qUpdateState,1,_,_,>,-,<
qFindRead2,1,&2,_,qFindNext,1,&2,_,>,-,-
qFindRead2,1,2,_,qUpdateState,1,2,_,>,-,<
qFindRead3,1,&3,_,qFindNext,1,&3,_,>,-,-
qFindRead3,1,3,_,qUpdateState,1,3,_,>,-,<
qFindRead4,1,&4,_,qFindNext,1,&4,_,>,-,-
qFindRead4,1,4,_,qUpdateState,1,4,_,>,-,<
qFindRead5,1,&5,_,qFindNext,1,&5,_,>,-,-
qFindRead5,1,5,_,qUpdateState,1,5,_,>,-,<
qFindRead6,1,&6,_,qFindNext,1,&6,_,>,-,-
qFindRead6,1,6,_,qUpdateState,1,6,_,>,-,<
qFindRead7,1,&7,_,qFindNext,1,&7,_,>,-,-
qFindRead7,1,7,_,qUpdateState,1,7,_,>,-,<
qFindRead8,1,&8,_,qFindNext,1,&8,_,>,-,-
qFindRead8,1,8,_,qUpdateState,1,8,_,>,-,<
qFindRead9,1,&9,_,qFindNext,1,&9,_,>,-,-
qFindRead9,1,9,_,qUpdateState,1,9,_,>,-,<
qFindReada,1,&a,_,qFindNext,1,&a,_,>,-,-
qFindReada,1,a,_,qUpdateState,1,a,_,>,-,<
qFindReadb,1,&b,_,qFindNext,1,&b,_,>,-,-
qFindReadb,1,b,_,qUpdateState,1,b,_,>,-,<
qFindReadc,1,&c,_,qFindNext,1,&c,_,>,-,-
qFindReadc,1,c,_,qUpdateState,1,c,_,>,-,<
qFindReadd,1,&d,_,qFindNext,1,&d,_,>,-,-
qFindReadd,1,d,_,qUpdateState,1,d,_,>,-,<
qFindReade,1,&e,_,qFindNext,1,&e,_,>,-,-
qFindReade,1,e,_,qUpdateState,1,e,_,>,-,<
qFindReadf,1,&f,_,qFindNext,1,&f,_,>,-,-
qFindReadf,1,f,_,qUpdateState,1,f,_,>,-,<
qFindReadg,1,&g,_,qFindNext,1,&g,_,>,-,-
qFindReadg,1,g,_,qUpdateState,1,g,_,>,-,<
qFindReadh,1,&h,_,qFindNext,1,&h,_,>,-,-
qFindReadh,1,h,_,qUpdateState,1,h,_,>,-,<
qFindReadi,1,&i,_,qFindNext,1,&i,_,>,-,-
qFindReadi,1,i,_,qUpdateState,1,i,_,>,-,<
qFindReadj,1,&j,_,qFindNext,1,&j,_,>,-,-
qFindReadj,1,j,_,qUpdateState,1,j,_,>,-,<
qFindReadk,1,&k,_,qFindNext,1,&k,_,>,-,-
qFindReadk,1,k,_,qUpdateState,1,k,_,>,-,<
qFindReadl,1,&l,_,qFindNext,1,&l,_,>,-,-
qFindReadl,1,l,_,qUpdateState,1,l,_,>,-,<
qFindReadm,1,&m,_,qFindNext,1,&m,_,>,-,-
qFindReadm,1,m,_,qUpdateState,1,m,_,>,-,<
qFindReadn,,1,&n,_,qFindNext,1,&n,_,>,-,-
qFindReadn,1,n,_,qUpdateState,1,n,_,>,-,<
qFindReado,1,&o,_,qFindNext,1,&o,_,>,-,-
qFindReado,1,o,_,qUpdateState,1,o,_,>,-,<
qFindReadp,1,&p,_,qFindNext,1,&p,_,>,-,-
qFindReadp,1,p,_,qUpdateState,1,p,_,>,-,<
qFindReadq,1,&q,_,qFindNext,1,&q,_,>,-,-
qFindReadq,1,q,_,qUpdateState,1,q,_,>,-,<
qFindReadr,1,&r,_,qFindNext,1,&r,_,>,-,-
qFindReadr,1,r,_,qUpdateState,1,r,_,>,-,<
qFindReads,1,&s,_,qFindNext,1,&s,_,>,-,-
qFindReads,1,s,_,qUpdateState,1,s,_,>,-,<
qFindReadt,1,&e,_,qFindNext,1,&t,_,>,-,-
qFindReadt,1,e,_,qUpdateState,1,t,_,>,-,<
qFindReadu,1,&u,_,qFindNext,1,&u,_,>,-,-
qFindReadu,1,u,_,qUpdateState,1,u,_,>,-,<
qFindReadv,1,&e,_,qFindNext,1,&v,_,>,-,-
qFindReadv,1,e,_,qUpdateState,1,v,_,>,-,<
qFindReadw,1,&e,_,qFindNext,1,&w,_,>,-,-
qFindReadw,1,e,_,qUpdateState,1,w,_,>,-,<
qFindReadx,1,&x,_,qFindNext,1,&x,_,>,-,-
qFindReadx,1,x,_,qUpdateState,1,x,_,>,-,<
qFindReady,1,&y,_,qFindNext,1,&y,_,>,-,-
qFindReady,1,y,_,qUpdateState,1,y,_,>,-,<
qFindReadz,1,&z,_,qFindNext,1,&z,_,>,-,-
qFindReadz,1,z,_,qUpdateState,1,z,_,>,-,<
qFindReadA,1,&A,_,qFindNext,1,&A,_,>,-,-
qFindReadA,1,A,_,qUpdateState,1,A,_,>,-,<
qFindReadB,1,&B,_,qFindNext,1,&B,_,>,-,-
qFindReadB,1,B,_,qUpdateState,1,B,_,>,-,<
qFindReadC,1,&C,_,qFindNext,1,&C,_,>,-,-
qFindReadC,1,C,_,qUpdateState,1,C,_,>,-,<
qFindReadD,1,&D,_,qFindNext,1,&D,_,>,-,-
qFindReadD,1,D,_,qUpdateState,1,D,_,>,-,<
qFindReadE,1,&E,_,qFindNext,1,&E,_,>,-,-
qFindReadE,1,E,_,qUpdateState,1,E,_,>,-,<
qFindReadF,1,&F,_,qFindNext,1,&F,_,>,-,-
qFindReadF,1,F,_,qUpdateState,1,F,_,>,-,<
qFindReadG,1,&G,_,qFindNext,1,&G,_,>,-,-
qFindReadG,1,G,_,qUpdateState,1,G,_,>,-,<
qFindReadH,1,&H,_,qFindNext,1,&H,_,>,-,-
qFindReadH,1,H,_,qUpdateState,1,H,_,>,-,<
qFindReadI,1,&I,_,qFindNext,1,&I,_,>,-,-
qFindReadI,1,I,_,qUpdateState,1,I,_,>,-,<
qFindReadJ,1,&J,_,qFindNext,1,&J,_,>,-,-
qFindReadJ,1,J,_,qUpdateState,1,J,_,>,-,<
qFindReadK,1,&K,_,qFindNext,1,&K,_,>,-,-
qFindReadK,1,K,_,qUpdateState,1,K,_,>,-,<
qFindReadL,1,&L,_,qFindNext,1,&L,_,>,-,-
qFindReadL,1,L,_,qUpdateState,1,L,_,>,-,<
qFindReadM,1,&M,_,qFindNext,1,&M,_,>,-,-
qFindReadM,1,M,_,qUpdateState,1,M,_,>,-,<
qFindReadN,,1,Nn,_,qFindNext,1,Nn,_,>,-,-
qFindReadN,1,N,_,qUpdateState,1,N,_,>,-,<
qFindReadO,1,&O,_,qFindNext,1,&O,_,>,-,-
qFindReadO,1,O,_,qUpdateState,1,O,_,>,-,<
qFindReadP,1,&P,_,qFindNext,1,&P,_,>,-,-
qFindReadP,1,P,_,qUpdateState,1,P,_,>,-,<
qFindReadQ,1,&Q,_,qFindNext,1,&Q,_,>,-,-
qFindReadQ,1,Q,_,qUpdateState,1,Q,_,>,-,<
qFindReadR,1,&R,_,qFindNext,1,&R,_,>,-,-
qFindReadR,1,R,_,qUpdateState,1,R,_,>,-,<
qFindReadS,1,&S,_,qFindNext,1,&S,_,>,-,-
qFindReadS,1,S,_,qUpdateState,1,S,_,>,-,<
qFindReadT,1,&T,_,qFindNext,1,&T,_,>,-,-
qFindReadT,1,T,_,qUpdateState,1,T,_,>,-,<
qFindReadU,1,&U,_,qFindNext,1,&U,_,>,-,-
qFindReadU,1,U,_,qUpdateState,1,U,_,>,-,<
qFindReadV,1,&V,_,qFindNext,1,&V,_,>,-,-
qFindReadV,1,V,_,qUpdateState,1,V,_,>,-,<
qFindReadW,1,&W,_,qFindNext,1,&W,_,>,-,-
qFindReadW,1,W,_,qUpdateState,1,W,_,>,-,<
qFindReadX,1,&X,_,qFindNext,1,&X,_,>,-,-
qFindReadX,1,X,_,qUpdateState,1,X,_,>,-,<
qFindReadY,1,&Y,_,qFindNext,1,&Y,_,>,-,-
qFindReadY,1,Y,_,qUpdateState,1,Y,_,>,-,<
qFindReadZ,1,&Z,_,qFindNext,1,&Z,_,>,-,-
qFindReadZ,1,Z,_,qUpdateState,1,Z,_,>,-,<
qFindRead!,1,&!,_,qFindNext,1,&!,_,>,-,-
qFindRead!,1,!,_,qUpdateState,1,!,_,>,-,<
qFindRead",1,&",_,qFindNext,1,&",_,>,-,-
qFindRead",1,",_,qUpdateState,1,",_,>,-,<
qFindRead#,1,&#,_,qFindNext,1,&#,_,>,-,-
qFindRead#,1,#,_,qUpdateState,1,#,_,>,-,<
qFindRead$,1,&$,_,qFindNext,1,&$,_,>,-,-
qFindRead$,1,$,_,qUpdateState,1,$,_,>,-,<
qFindRead%,1,&%,_,qFindNext,1,&%,_,>,-,-
qFindRead%,1,%,_,qUpdateState,1,%,_,>,-,<
qFindRead',1,&',_,qFindNext,1,&',_,>,-,-
qFindRead',1,',_,qUpdateState,1,',_,>,-,<
qFindRead(,1,&(,_,qFindNext,1,&(,_,>,-,-
qFindRead(,1,(,_,qUpdateState,1,(,_,>,-,<
qFindRead),1,&),_,qFindNext,1,&),_,>,-,-
qFindRead),1,),_,qUpdateState,1,),_,>,-,<
qFindRead*,1,&*,_,qFindNext,1,&*,_,>,-,-
qFindRead*,1,*,_,qUpdateState,1,*,_,>,-,<
qFindRead+,1,&+,_,qFindNext,1,&+,_,>,-,-
qFindRead+,1,+,_,qUpdateState,1,+,_,>,-,<
qFindRead-,1,&-,_,qFindNext,1,&-,_,>,-,-
qFindRead-,1,-,_,qUpdateState,1,-,_,>,-,<
qFindRead.,1,&.,_,qFindNext,1,&.,_,>,-,-
qFindRead.,1,.,_,qUpdateState,1,.,_,>,-,<
qFindRead/,1,&/,_,qFindNext,1,&/,_,>,-,-
qFindRead/,1,/,_,qUpdateState,1,/,_,>,-,<
qFindRead:,1,&:,_,qFindNext,1,&:,_,>,-,-
qFindRead:,1,:,_,qUpdateState,1,:,_,>,-,<
qFindRead;,1,&;,_,qFindNext,1,&;,_,>,-,-
qFindRead;,1,;,_,qUpdateState,1,;,_,>,-,<
qFindRead<,1,&<,_,qFindNext,1,&<,_,>,-,-
qFindRead<,1,<,_,qUpdateState,1,<,_,>,-,<
qFindRead=,1,&=,_,qFindNext,1,&=,_,>,-,-
qFindRead=,1,=,_,qUpdateState,1,=,_,>,-,<
qFindRead>,1,&>,_,qFindNext,1,&>,_,>,-,-
qFindRead>,1,>,_,qUpdateState,1,>,_,>,-,<
qFindRead?,1,&?,_,qFindNext,1,&?,_,>,-,-
qFindRead?,1,?,_,qUpdateState,1,?,_,>,-,<
qFindRead[,1,&[,_,qFindNext,1,&[,_,>,-,-
qFindRead[,1,[,_,qUpdateState,1,[,_,>,-,<
qFindRead],1,&],_,qFindNext,1,&],_,>,-,-
qFindRead],1,],_,qUpdateState,1,],_,>,-,<
qFindRead^,1,&^,_,qFindNext,1,&^,_,>,-,-
qFindRead^,1,^,_,qUpdateState,1,^,_,>,-,<
qFindRead`,1,&`,_,qFindNext,1,&`,_,>,-,-
qFindRead`,1,`,_,qUpdateState,1,`,_,>,-,<
qFindRead{,1,&{,_,qFindNext,1,&{,_,>,-,-
qFindRead{,1,{,_,qUpdateState,1,{,_,>,-,<
qFindRead|,1,&|,_,qFindNext,1,&|,_,>,-,-
qFindRead|,1,|,_,qUpdateState,1,|,_,>,-,<
qFindRead},1,&},_,qFindNext,1,&},_,>,-,-
qFindRead},1,},_,qUpdateState,1,},_,>,-,<

#

qUpdateState,0,@,0,qUpdateState,0,@,_,-,-,<
qUpdateState,0,@,_,qStateCopy,0,@,_,-,-,>

qStateCopy,0,@,_,qStateCopy,0,@,0,>,-,>
qStateCopy,1,@,_,qUpdateValue,1,@,_,>,-,-

# All possible atoms to update

qUpdateValue,0,@,_,qUpdateValue0,0,@,_,>,-,-
qUpdateValue0,0,@,_,qUpdateValue1,0,@,_,>,-,-
qUpdateValue1,0,@,_,qUpdateValue_,0,@,_,>,-,-
qUpdateValue_,0,@,_,qUpdateValue2,0,@,_,>,-,-
qUpdateValue2,0,@,_,qUpdateValue3,0,@,_,>,-,-
qUpdateValue3,0,@,_,qUpdateValue4,0,@,_,>,-,-
qUpdateValue4,0,@,_,qUpdateValue5,0,@,_,>,-,-
qUpdateValue5,0,@,_,qUpdateValue6,0,@,_,>,-,-
qUpdateValue6,0,@,_,qUpdateValue7,0,@,_,>,-,-
qUpdateValue7,0,@,_,qUpdateValue8,0,@,_,>,-,-
qUpdateValue8,0,@,_,qUpdateValue9,0,@,_,>,-,-
qUpdateValue9,0,@,_,qUpdateValuea,0,@,_,>,-,-
qUpdateValuea,0,@,_,qUpdateValueb,0,@,_,>,-,-
qUpdateValueb,0,@,_,qUpdateValuec,0,@,_,>,-,-
qUpdateValuec,0,@,_,qUpdateValued,0,@,_,>,-,-
qUpdateValued,0,@,_,qUpdateValuee,0,@,_,>,-,-
qUpdateValuee,0,@,_,qUpdateValuef,0,@,_,>,-,-
qUpdateValuef,0,@,_,qUpdateValueg,0,@,_,>,-,-
qUpdateValueg,0,@,_,qUpdateValueh,0,@,_,>,-,-
qUpdateValueh,0,@,_,qUpdateValuei,0,@,_,>,-,-
qUpdateValuei,0,@,_,qUpdateValuej,0,@,_,>,-,-
qUpdateValuej,0,@,_,qUpdateValuek,0,@,_,>,-,-
qUpdateValuek,0,@,_,qUpdateValuel,0,@,_,>,-,-
qUpdateValuel,0,@,_,qUpdateValuem,0,@,_,>,-,-
qUpdateValuem,0,@,_,qUpdateValuen,0,@,_,>,-,-
qUpdateValuen,0,@,_,qUpdateValueo,0,@,_,>,-,-
qUpdateValueo,0,@,_,qUpdateValuep,0,@,_,>,-,-
qUpdateValuep,0,@,_,qUpdateValueq,0,@,_,>,-,-
qUpdateValueq,0,@,_,qUpdateValuer,0,@,_,>,-,-
qUpdateValuer,0,@,_,qUpdateValues,0,@,_,>,-,-
qUpdateValues,0,@,_,qUpdateValuet,0,@,_,>,-,-
qUpdateValuet,0,@,_,qUpdateValueu,0,@,_,>,-,-
qUpdateValueu,0,@,_,qUpdateValuev,0,@,_,>,-,-
qUpdateValuev,0,@,_,qUpdateValuew,0,@,_,>,-,-
qUpdateValuew,0,@,_,qUpdateValuex,0,@,_,>,-,-
qUpdateValuex,0,@,_,qUpdateValuey,0,@,_,>,-,-
qUpdateValuey,0,@,_,qUpdateValuez,0,@,_,>,-,-
qUpdateValuez,0,@,_,qUpdateValueA,0,@,_,>,-,-
qUpdateValueA,0,@,_,qUpdateValueB,0,@,_,>,-,-
qUpdateValueB,0,@,_,qUpdateValueC,0,@,_,>,-,-
qUpdateValueC,0,@,_,qUpdateValueD,0,@,_,>,-,-
qUpdateValueD,0,@,_,qUpdateValueE,0,@,_,>,-,-
qUpdateValueE,0,@,_,qUpdateValueF,0,@,_,>,-,-
qUpdateValueF,0,@,_,qUpdateValueG,0,@,_,>,-,-
qUpdateValueG,0,@,_,qUpdateValueH,0,@,_,>,-,-
qUpdateValueH,0,@,_,qUpdateValueI,0,@,_,>,-,-
qUpdateValueI,0,@,_,qUpdateValueJ,0,@,_,>,-,-
qUpdateValueJ,0,@,_,qUpdateValueK,0,@,_,>,-,-
qUpdateValueK,0,@,_,qUpdateValueL,0,@,_,>,-,-
qUpdateValueL,0,@,_,qUpdateValueM,0,@,_,>,-,-
qUpdateValueM,0,@,_,qUpdateValueN,0,@,_,>,-,-
qUpdateValueN,0,@,_,qUpdateValueO,0,@,_,>,-,-
qUpdateValueO,0,@,_,qUpdateValueP,0,@,_,>,-,-
qUpdateValueP,0,@,_,qUpdateValueQ,0,@,_,>,-,-
qUpdateValueQ,0,@,_,qUpdateValueR,0,@,_,>,-,-
qUpdateValueR,0,@,_,qUpdateValueS,0,@,_,>,-,-
qUpdateValueS,0,@,_,qUpdateValueT,0,@,_,>,-,-
qUpdateValueT,0,@,_,qUpdateValueU,0,@,_,>,-,-
qUpdateValueU,0,@,_,qUpdateValueV,0,@,_,>,-,-
qUpdateValueV,0,@,_,qUpdateValueW,0,@,_,>,-,-
qUpdateValueW,0,@,_,qUpdateValueX,0,@,_,>,-,-
qUpdateValueX,0,@,_,qUpdateValueY,0,@,_,>,-,-
qUpdateValueY,0,@,_,qUpdateValueZ,0,@,_,>,-,-
qUpdateValueZ,0,@,_,qUpdateValue!,0,@,_,>,-,-
qUpdateValue!,0,@,_,qUpdateValue",0,@,_,>,-,-
qUpdateValue",0,@,_,qUpdateValue#,0,@,_,>,-,-
qUpdateValue#,0,@,_,qUpdateValue$,0,@,_,>,-,-
qUpdateValue$,0,@,_,qUpdateValue%,0,@,_,>,-,-
qUpdateValue%,0,@,_,qUpdateValue',0,@,_,>,-,-
qUpdateValue',0,@,_,qUpdateValue(,0,@,_,>,-,-
qUpdateValue(,0,@,_,qUpdateValue),0,@,_,>,-,-
qUpdateValue),0,@,_,qUpdateValue*,0,@,_,>,-,-
qUpdateValue*,0,@,_,qUpdateValue+,0,@,_,>,-,-
qUpdateValue+,0,@,_,qUpdateValue-,0,@,_,>,-,-
qUpdateValue-,0,@,_,qUpdateValue.,0,@,_,>,-,-
qUpdateValue.,0,@,_,qUpdateValue/,0,@,_,>,-,-
qUpdateValue/,0,@,_,qUpdateValue:,0,@,_,>,-,-
qUpdateValue:,0,@,_,qUpdateValue;,0,@,_,>,-,-
qUpdateValue;,0,@,_,qUpdateValue<,0,@,_,>,-,-
qUpdateValue<,0,@,_,qUpdateValue=,0,@,_,>,-,-
qUpdateValue=,0,@,_,qUpdateValue>,0,@,_,>,-,-
qUpdateValue>,0,@,_,qUpdateValue?,0,@,_,>,-,-
qUpdateValue?,0,@,_,qUpdateValue[,0,@,_,>,-,-
qUpdateValue[,0,@,_,qUpdateValue],0,@,_,>,-,-
qUpdateValue],0,@,_,qUpdateValue^,0,@,_,>,-,-
qUpdateValue^,0,@,_,qUpdateValue`,0,@,_,>,-,-
qUpdateValue`,0,@,_,qUpdateValue{,0,@,_,>,-,-
qUpdateValue{,0,@,_,qUpdateValue|,0,@,_,>,-,-
qUpdateValue|,0,@,_,qUpdateValue},0,@,_,>,-,-

qUpdateValue0,1,@,_,qMove,1,0,_,>,-,-
qUpdateValue1,1,@,_,qMove,1,1,_,>,-,-
qUpdateValue_,1,@,_,qMove,1,_,_,>,-,-
qUpdateValue2,1,@,_,qMove,1,2,_,>,-,-
qUpdateValue3,1,@,_,qMove,1,3,_,>,-,-
qUpdateValue4,1,@,_,qMove,1,4,_,>,-,-
qUpdateValue5,1,@,_,qMove,1,5,_,>,-,-
qUpdateValue6,1,@,_,qMove,1,6,_,>,-,-
qUpdateValue7,1,@,_,qMove,1,7,_,>,-,-
qUpdateValue8,1,@,_,qMove,1,8,_,>,-,-
qUpdateValue9,1,@,_,qMove,1,9,_,>,-,-
qUpdateValuea,1,@,_,qMove,1,a,_,>,-,-
qUpdateValueb,1,@,_,qMove,1,b,_,>,-,-
qUpdateValuec,1,@,_,qMove,1,c,_,>,-,-
qUpdateValued,1,@,_,qMove,1,d,_,>,-,-
qUpdateValuee,1,@,_,qMove,1,e,_,>,-,-
qUpdateValuef,1,@,_,qMove,1,f,_,>,-,-
qUpdateValueg,1,@,_,qMove,1,g,_,>,-,-
qUpdateValueh,1,@,_,qMove,1,h,_,>,-,-
qUpdateValuei,1,@,_,qMove,1,i,_,>,-,-
qUpdateValuej,1,@,_,qMove,1,j,_,>,-,-
qUpdateValuek,1,@,_,qMove,1,k,_,>,-,-
qUpdateValuel,1,@,_,qMove,1,l,_,>,-,-
qUpdateValuem,1,@,_,qMove,1,m,_,>,-,-
qUpdateValuen,1,@,_,qMove,1,n,_,>,-,-
qUpdateValueo,1,@,_,qMove,1,o,_,>,-,-
qUpdateValuep,1,@,_,qMove,1,p,_,>,-,-
qUpdateValueq,1,@,_,qMove,1,q,_,>,-,-
qUpdateValuer,1,@,_,qMove,1,r,_,>,-,-
qUpdateValues,1,@,_,qMove,1,s,_,>,-,-
qUpdateValuet,1,@,_,qMove,1,t,_,>,-,-
qUpdateValueu,1,@,_,qMove,1,u,_,>,-,-
qUpdateValuev,1,@,_,qMove,1,v,_,>,-,-
qUpdateValuew,1,@,_,qMove,1,w,_,>,-,-
qUpdateValuex,1,@,_,qMove,1,x,_,>,-,-
qUpdateValuey,1,@,_,qMove,1,y,_,>,-,-
qUpdateValuez,1,@,_,qMove,1,z,_,>,-,-
qUpdateValueA,1,@,_,qMove,1,A,_,>,-,-
qUpdateValueB,1,@,_,qMove,1,B,_,>,-,-
qUpdateValueC,1,@,_,qMove,1,C,_,>,-,-
qUpdateValueD,1,@,_,qMove,1,D,_,>,-,-
qUpdateValueE,1,@,_,qMove,1,E,_,>,-,-
qUpdateValueF,1,@,_,qMove,1,F,_,>,-,-
qUpdateValueG,1,@,_,qMove,1,G,_,>,-,-
qUpdateValueH,1,@,_,qMove,1,H,_,>,-,-
qUpdateValueI,1,@,_,qMove,1,I,_,>,-,-
qUpdateValueJ,1,@,_,qMove,1,J,_,>,-,-
qUpdateValueK,1,@,_,qMove,1,K,_,>,-,-
qUpdateValueL,1,@,_,qMove,1,L,_,>,-,-
qUpdateValueM,1,@,_,qMove,1,M,_,>,-,-
qUpdateValueN,1,@,_,qMove,1,N,_,>,-,-
qUpdateValueO,1,@,_,qMove,1,O,_,>,-,-
qUpdateValueP,1,@,_,qMove,1,P,_,>,-,-
qUpdateValueQ,1,@,_,qMove,1,Q,_,>,-,-
qUpdateValueR,1,@,_,qMove,1,R,_,>,-,-
qUpdateValueS,1,@,_,qMove,1,S,_,>,-,-
qUpdateValueT,1,@,_,qMove,1,T,_,>,-,-
qUpdateValueU,1,@,_,qMove,1,U,_,>,-,-
qUpdateValueV,1,@,_,qMove,1,V,_,>,-,-
qUpdateValueW,1,@,_,qMove,1,W,_,>,-,-
qUpdateValueX,1,@,_,qMove,1,X,_,>,-,-
qUpdateValueY,1,@,_,qMove,1,Y,_,>,-,-
qUpdateValueZ,1,@,_,qMove,1,Z,_,>,-,-
qUpdateValue!,1,@,_,qMove,1,!,_,>,-,-
qUpdateValue",1,@,_,qMove,1,",_,>,-,-
qUpdateValue#,1,@,_,qMove,1,#,_,>,-,-
qUpdateValue$,1,@,_,qMove,1,$,_,>,-,-
qUpdateValue%,1,@,_,qMove,1,%,_,>,-,-
qUpdateValue',1,@,_,qMove,1,',_,>,-,-
qUpdateValue(,1,@,_,qMove,1,(,_,>,-,-
qUpdateValue),1,@,_,qMove,1,),_,>,-,-
qUpdateValue*,1,@,_,qMove,1,*,_,>,-,-
qUpdateValue+,1,@,_,qMove,1,+,_,>,-,-
qUpdateValue-,1,@,_,qMove,1,-,_,>,-,-
qUpdateValue.,1,@,_,qMove,1,.,_,>,-,-
qUpdateValue/,1,@,_,qMove,1,/,_,>,-,-
qUpdateValue:,1,@,_,qMove,1,:,_,>,-,-
qUpdateValue;,1,@,_,qMove,1,;,_,>,-,-
qUpdateValue<,1,@,_,qMove,1,<,_,>,-,-
qUpdateValue=,1,@,_,qMove,1,=,_,>,-,-
qUpdateValue>,1,@,_,qMove,1,>,_,>,-,-
qUpdateValue?,1,@,_,qMove,1,?,_,>,-,-
qUpdateValue[,1,@,_,qMove,1,[,_,>,-,-
qUpdateValue],1,@,_,qMove,1,],_,>,-,-
qUpdateValue^,1,@,_,qMove,1,^,_,>,-,-
qUpdateValue`,1,@,_,qMove,1,`,_,>,-,-
qUpdateValue{,1,@,_,qMove,1,{,_,>,-,-
qUpdateValue|,1,@,_,qMove,1,|,_,>,-,-
qUpdateValue},1,@,_,qMove,1,},_,>,-,-

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
