from classes.state import State
from classes.machine import Machine

from classes.UI import UI

from sys import argv
from string import printable

chars = [char for char in printable.strip() if char not in ('@', '&', ',')]

def read(instance: str, mode: str): # Lê de arquivo
    print(f" Instancia {instance} ".center(50, '*'))
    
    q = None
    tape = ''
    
    states: dict[str, State] = {}
    
    n_tapes = -1
    
    with open(instance) as file:
        for line in file.readlines():
            if line.strip() == '' or line.strip().startswith('#'):
                continue
            
            data = line.strip().split(' ')
            
            if data[0] == 'tape':
                tape = data[1] if len(data) > 1 else ''
            elif data[0] == 'init':
                states[data[1]] = State(data[1])
                q = states[data[1]]
            elif data[0] == 'accept':
                if data[1] not in states:
                    states[data[1]] = State(data[1])
                states[data[1]].setIsFinal()
            else:
                values = data[0].split(',')
                
                if n_tapes == -1:
                    n_tapes = (len(values) - 2) // 3
                elif n_tapes != (len(values) - 2) // 3:
                    raise Exception(f'Invalid instance or inconsistent: {line.strip()}')
                
                qi = values[0]
                r = values[1:n_tapes + 1]
                qj = values[n_tapes + 1]
                w = values[n_tapes + 2:n_tapes * 2 + 2]
                d = values[n_tapes * 2 + 2:]
                
                if qi not in states:
                    states[qi] = State(qi)
                    
                if qj not in states:
                    states[qj] = State(qj)
                
                rw = f"{' '.join(r)} {' '.join(w)}"
                
                if '@' in rw:
                    for c in chars:            
                        states[qi].addTransition(
                            states[qj], 
                            [c if i == '@' else i for i in r],
                            [c if i == '@' else i for i in w],
                            d
                        )
                        
                elif '&' in rw:
                    exclude = [value.split('&')[1] for value in rw.split(' ') if '&' in value][0]
                    
                    for c in chars:
                        if c == exclude:
                            continue
                        
                        states[qi].addTransition(
                            states[qj], 
                            [c if i == f'&{exclude}' else i for i in r],
                            [c if i == f'&{exclude}' else i for i in w],
                            d
                        )
                else:
                    states[qi].addTransition(states[qj], r, w, d)
    
    if mode == '':
        Machine(q, tape, n_tapes=n_tapes).run()
    else:
        UI(Machine(q, tape, n_tapes=n_tapes), mode=mode).run()

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

    mt = Machine(q0, w)
    
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

    mt = Machine(q0, w)
    mt.run()

if __name__ == "__main__":
    if len(argv) > 1:
        read(argv[1], argv[2] if len(argv) >= 3 else '')
    else:
        teste_anbn('')
        teste_anbn('ab')
        teste_anbn('aabb')
        teste_anbn('aaabbb')
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