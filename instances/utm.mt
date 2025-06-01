tape 010101001001101001010100110100010010001001111001

init qStart
accept qAccept

# Copy the input to second tape
qStart,0,_,_,qStart,0,_,_,>,-,-
qStart,1,_,_,qAfter1,1,_,_,>,-,-
qAfter1,0,_,_,qStart,0,_,_,>,-,-
qAfter1,1,_,_,qAfter11,1,_,_,>,-,-
qAfter11,0,_,_,qStart,0,_,_,>,-,-
qAfter11,1,_,_,qAfter111,1,_,_,>,-,-
qAfter111,0,_,_,qAfter111,0,0,_,>,>,-
qAfter111,1,_,_,qAfter111,1,1,_,>,>,-
qAfter111,_,_,_,qClearInput,_,_,_,<,<,-

# Clear the input in the first tape
qClearInput,0,0,_,qClearInput,_,0,_,<,<,-
qClearInput,1,1,_,qClearInput,_,1,_,<,<,-
qClearInput,1,_,_,qClearInput1,_,_,_,<,-,-
qClearInput1,1,_,_,qClearInput11,_,_,_,<,-,-
qClearInput11,1,_,_,qBack,_,_,_,<,-,-

# Move back to the start of the three tapes
qBack,0,_,_,qBack,0,_,_,<,-,-
qBack,1,_,_,qBack,1,_,_,<,-,-
qBack,_,_,_,qFindState,_,_,0,>,>,-

# Try to find the state of the second tape
qFindState,0,1,0,qFindState,0,1,0,>,-,>
qFindState,0,0,0,qFindState,0,0,0,>,-,>
qFindState,0,_,0,qFindState,0,_,0,>,-,>

qFindState,1,0,_,qStateFound,1,0,_,>,-,<
qFindState,1,1,_,qStateFound,1,1,_,>,-,<
qFindState,1,_,_,qStateFound,1,_,_,>,-,<

qStateFound,0,0,0,qStateFound,0,0,0,-,-,<
qStateFound,1,0,0,qStateFound,1,0,0,-,-,<
qStateFound,0,1,0,qStateFound,0,1,0,-,-,<
qStateFound,1,1,0,qStateFound,1,1,0,-,-,<
qStateFound,0,_,0,qStateFound,0,_,0,-,-,<
qStateFound,1,_,0,qStateFound,1,_,0,-,-,<

qStateFound,0,0,_,qReading0,0,0,_,>,-,-
qStateFound,0,1,_,qReading0,0,1,_,>,-,-
qStateFound,0,_,_,qReading0,0,_,_,>,-,-

qReading0,0,0,_,qReading00,0,0,_,>,-,-
qReading0,0,1,_,qReading00,0,1,_,>,-,-
qReading0,0,_,_,qReading00,0,_,_,>,-,-

qReading0,1,_,_,qBackState,1,_,_,>,-,-
qReading0,1,0,_,qWrightState,1,0,_,>,-,-
qReading0,1,1,_,qBackState,1,1,_,>,-,-

qReading00,0,0,_,qReading000,0,0,_,>,-,-
qReading00,0,1,_,qReading000,0,1,_,>,-,-
qReading00,0,_,_,qReading000,0,_,_,>,-,-

qReading00,1,_,_,qBackState,1,_,_,>,-,-
qReading00,1,0,_,qBackState,1,0,_,>,-,-
qReading00,1,1,_,qWrightState,1,1,_,>,-,-

qReading000,1,_,_,qWrightState,1,_,_,>,-,-
qReading000,1,0,_,qBackState,1,0,_,>,-,-
qReading000,1,1,_,qBackState,1,1,_,>,-,-

qWrightState,0,0,_,qClearState,0,0,_,-,-,>
qWrightState,0,1,_,qClearState,0,1,_,-,-,>
qWrightState,0,_,_,qClearState,0,_,_,-,-,>

qClearState,0,0,0,qClearState,0,0,0,-,-,>
qClearState,0,1,0,qClearState,0,1,0,-,-,>
qClearState,0,_,0,qClearState,0,_,0,-,-,>

qClearState,0,0,_,qCleaningState,0,0,_,-,-,<
qClearState,0,1,_,qCleaningState,0,1,_,-,-,<
qClearState,0,_,_,qCleaningState,0,_,_,-,-,<

qCleaningState,0,0,0,qCleaningState,0,0,_,-,-,<
qCleaningState,0,1,0,qCleaningState,0,1,_,-,-,<
qCleaningState,0,_,0,qCleaningState,0,_,_,-,-,<

qCleaningState,0,0,_,qWrightingState,0,0,_,-,-,>
qCleaningState,0,1,_,qWrightingState,0,1,_,-,-,>
qCleaningState,0,_,_,qWrightingState,0,_,_,-,-,>

qWrightingState,0,1,_,qWrightingState,0,1,0,>,-,>
qWrightingState,0,0,_,qWrightingState,0,0,0,>,-,>
qWrightingState,0,_,_,qWrightingState,0,_,0,>,-,>

qWrightingState,1,0,_,qWrightTape,1,0,_,>,-,-
qWrightingState,1,1,_,qWrightTape,1,1,_,>,-,-
qWrightingState,1,_,_,qWrightTape,1,_,_,>,-,-

qWrightTape,0,0,_,qWrightTape0,0,0,_,>,-,-
qWrightTape,0,1,_,qWrightTape0,0,1,_,>,-,-
qWrightTape,0,_,_,qWrightTape0,0,_,_,>,-,-

qWrightTape0,0,0,_,qWrightTape00,0,0,_,>,-,-
qWrightTape0,0,1,_,qWrightTape00,0,1,_,>,-,-
qWrightTape0,0,_,_,qWrightTape00,0,_,_,>,-,-

qWrightTape0,1,0,_,qDirectionTape,1,0,_,>,-,-
qWrightTape0,1,1,_,qDirectionTape,1,0,_,>,-,-
qWrightTape0,1,_,_,qDirectionTape,1,0,_,>,-,-

qWrightTape00,0,0,_,qWrightTape000,0,0,_,>,-,-
qWrightTape00,0,1,_,qWrightTape000,0,1,_,>,-,-
qWrightTape00,0,_,_,qWrightTape000,0,_,_,>,-,-

qWrightTape00,1,0,_,qDirectionTape,1,1,_,>,-,-
qWrightTape00,1,1,_,qDirectionTape,1,1,_,>,-,-
qWrightTape00,1,_,_,qDirectionTape,1,1,_,>,-,-

qWrightTape000,1,0,_,qDirectionTape,1,_,_,>,-,-
qWrightTape000,1,1,_,qDirectionTape,1,_,_,>,-,-
qWrightTape000,1,_,_,qDirectionTape,1,_,_,>,-,-

qDirectionTape,0,0,_,qDirectionTape0,0,0,_,>,-,-
qDirectionTape,0,1,_,qDirectionTape0,0,1,_,>,-,-
qDirectionTape,0,_,_,qDirectionTape0,0,_,_,>,-,-

qDirectionTape0,0,0,_,qDirectionTape00,0,0,_,>,-,-
qDirectionTape0,0,1,_,qDirectionTape00,0,1,_,>,-,-
qDirectionTape0,0,_,_,qDirectionTape00,0,_,_,>,-,-

qDirectionTape0,1,0,_,qDirectionTape1,1,0,_,>,<,-
qDirectionTape0,1,1,_,qDirectionTape1,1,1,_,>,<,-
qDirectionTape0,1,_,_,qDirectionTape1,1,_,_,>,<,-

qDirectionTape00,1,0,_,qRestartMachine,1,0,_,>,>,-
qDirectionTape00,1,1,_,qRestartMachine,1,1,_,>,>,-
qDirectionTape00,1,_,_,qRestartMachine,1,_,_,>,>,-

qRestartMachine,0,0,_,qRestartMachine,0,0,_,<,-,-
qRestartMachine,0,1,_,qRestartMachine,0,1,_,<,-,-
qRestartMachine,0,_,_,qRestartMachine,0,_,_,<,-,-
qRestartMachine,1,0,_,qRestartMachine,1,0,_,<,-,-
qRestartMachine,1,1,_,qRestartMachine,1,1,_,<,-,-
qRestartMachine,1,_,_,qRestartMachine,1,_,_,<,-,-

qRestartMachine,_,0,_,qRestartState,_,0,_,-,-,<
qRestartMachine,_,1,_,qRestartState,_,1,_,-,-,<
qRestartMachine,_,_,_,qRestartState,_,1,_,-,-,<

qRestartState,_,0,0,qRestartState,_,0,0,-,-,<
qRestartState,_,1,0,qRestartState,_,1,0,-,-,<
qRestartState,_,_,0,qRestartState,_,_,0,-,-,<

qRestartState,_,0,_,qFindState,_,0,_,>,-,>
qRestartState,_,1,_,qFindState,_,1,_,>,-,>
qRestartState,_,_,_,qFindState,_,_,_,>,-,>

# Not found, so we need to go back the third tape
qFindState,1,0,0,qBackState,1,0,0,-,-,<
qFindState,0,0,_,qBackState,0,0,_,-,-,<
qFindState,1,1,0,qBackState,1,1,0,-,-,<
qFindState,0,1,_,qBackState,0,1,_,-,-,<
qFindState,1,_,0,qBackState,1,_,0,-,-,<
qFindState,0,_,_,qBackState,0,_,_,-,-,<

qBackState,0,0,0,qBackState,0,0,0,-,-,<
qBackState,1,0,0,qBackState,1,0,0,-,-,<
qBackState,0,1,0,qBackState,0,1,0,-,-,<
qBackState,1,1,0,qBackState,1,1,0,-,-,<
qBackState,0,_,0,qBackState,0,_,0,-,-,<
qBackState,1,_,0,qBackState,1,_,0,-,-,<

# Now we can find the next state
qBackState,0,0,_,qFindNextState,0,0,_,-,-,>
qBackState,1,0,_,qFindNextState,1,0,_,-,-,>
qBackState,0,1,_,qFindNextState,0,1,_,-,-,>
qBackState,1,1,_,qFindNextState,1,1,_,-,-,>
qBackState,0,_,_,qFindNextState,0,_,_,-,-,>
qBackState,1,_,_,qFindNextState,1,_,_,-,-,>

qFindNextState,0,0,0,qFindNextState,0,0,0,>,-,-
qFindNextState,0,1,0,qFindNextState,0,1,0,>,-,-
qFindNextState,0,_,0,qFindNextState,0,_,0,>,-,-

qFindNextState,1,0,0,qFind1,1,0,0,>,-,-
qFindNextState,1,1,0,qFind1,1,1,0,>,-,-
qFindNextState,1,_,0,qFind1,1,_,0,>,-,-

qFindNextState,_,0,_,qFinalize,_,0,_,-,-,-
qFindNextState,_,1,_,qFinalize,_,1,_,-,-,-
qFindNextState,_,_,_,qFinalize,_,_,_,-,-,-

qFind1,0,0,0,qFindNextState,0,0,0,>,-,-
qFind1,0,1,0,qFindNextState,0,1,0,>,-,-
qFind1,0,_,0,qFindNextState,0,_,0,>,-,-

qFind1,1,0,0,qFindState,1,0,0,>,-,-
qFind1,1,1,0,qFindState,1,1,0,>,-,-
qFind1,1,_,0,qFindState,1,_,0,>,-,-