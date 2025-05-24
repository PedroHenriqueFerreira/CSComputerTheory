from State import State
from Machine import Machine

from UI import UI

from sys import argv

def read(f: str): # Lê de arquivo
    print(f" arquivo {f} ".center(50, '*'))
    
    q0 = None
    fita = ''
    
    estados: dict[str, State] = {}
    
    with open(f) as file:
        for line in file.readlines():
            if line.strip() == '' or line.startswith(('@', '#', '//')):
                continue
            
            data = line.strip().split(' ')
            
            if data[0] == 'fita':
                fita = data[1] if len(data) > 1 else ''
            elif data[0] == 'init':
                estados[data[1]] = State(data[1])
                q0 = estados[data[1]]
            elif data[0] == 'accept':
                if data[1] not in estados:
                    estados[data[1]] = State(data[1])
                estados[data[1]].setIsFinal()
            else:
                qi, r, qj, w, d = data[0].split(',')
                
                if qi not in estados:
                    estados[qi] = State(qi)
                    
                if qj not in estados:
                    estados[qj] = State(qj)
                    
                estados[qi].addTransition(estados[qj], r, w, d)
    
    UI(Machine(q0, fita, 100))

def teste_anbn(w: str): # Livre de contexto
    print("{ a^nb^n | n>=0 }")
    
    q0 = State('q0')
    q1 = State('q1')
    q2 = State('q2')
    q3 = State('q3')
    q4 = State('q4')
    qf = State('qf')
    qf.setIsFinal()

    q0.addTransition(q1, 'a', 'A', 'D')
    q0.addTransition(q3, '_', '_', 'E')
    q0.addTransition(q4, 'B', 'B', 'D')

    q1.addTransition(q1, 'a', 'a', 'D')
    q1.addTransition(q1, 'B', 'B', 'D')
    q1.addTransition(q2, 'b', 'B', 'E')

    q2.addTransition(q2, 'a', 'a', 'E')
    q2.addTransition(q2, 'B', 'B', 'E')
    q2.addTransition(q0, 'A', 'A', 'D')

    q4.addTransition(q4, 'B', 'B', 'D')
    q4.addTransition(q3, '_', '_', 'E')

    q3.addTransition(q3, 'A', 'A', 'E')
    q3.addTransition(q3, 'B', 'B', 'E')
    q3.addTransition(qf, '_', '_', 'D')

    mt = Machine(q0, w, 20)
    mt.run()

def teste_y_x(w: str): # Regular
    print("{ w in Σ^* | w é um número binario multiplo de 3}")
    
    q0 = State('q0')
    q1 = State('q1')
    q2 = State('q2')
    q0.setIsFinal()

    q0.addTransition(q0, '0', 'a', 'D')
    q0.addTransition(q1, '1', 'b', 'D')

    q1.addTransition(q0, '1', 'b', 'D')
    q1.addTransition(q2, '0', 'a', 'D')

    q2.addTransition(q2, '1', 'b', 'D')
    q2.addTransition(q1, '0', 'a', 'D')

    mt = Machine(q0, w, 20)
    mt.run()

if __name__ == "__main__":
    if len(argv) > 1:
        read(argv[1])
    else:
        teste_anbn('')
        teste_anbn('ab')
        teste_anbn('aabb')
        teste_anbn('aaaabbb')
        teste_anbn('aaaabbbbb')
        teste_anbn('ababab')
        teste_anbn('aaaaaa')
        teste_anbn('bbbbbb')
        
        teste_y_x('')
        teste_y_x('0')
        teste_y_x('1')
        teste_y_x('10')
        teste_y_x('11')
        teste_y_x('100')
        teste_y_x('101')
        teste_y_x('110')