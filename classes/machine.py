from classes.state import State

class Machine: # AFD = (Q, Σ, δ, q0, F)
    def __init__(self, q: State, w: str, n_tapes: int = 1, blank: str = '_'):
        self.q = q
        self.w = w
        self.n_tapes = n_tapes
        self.blank = blank
        
        self.tapes: list[list[str]] = []
        self.positions: list[int] = []

        # Ideia para Turing Machine abaixo, onde size * 2 e o tamanho da fita da maquina:
        
        self.create_tapes()
        
        # print(self)

    def __repr__(self):
        return f'Machine[Q={self.q}, F={"".join(self.fita)}, C={self.current}, M={self.max}]'

    def create_tapes(self):
        for i in range(self.n_tapes):
            if i == 0 and len(self.w) > 0:
                self.tapes.append([c for c in self.w])
            else:
                self.tapes.append([self.blank])
    
            self.positions.append(0)

    def run(self):
        if self.q is None or self.w is None:
            return False
        
        while True:        
            r = [tape[position] for tape, position in zip(self.tapes, self.positions)]
            transition = self.q.transition(r)
            
            if transition is None:
                break
            
            else:
                self.q = transition.state
                
                for i in range(self.n_tapes):
                    self.tapes[i][self.positions[i]] = transition.edge.w[i]
                
                    if transition.edge.d[i] in ('D', '>'):
                        if len(self.tapes[i]) <= self.positions[i] + 1:
                            self.tapes[i].append(self.blank)
                        
                        self.positions[i] += 1
                    elif transition.edge.d[i] in ('E', '<'):
                        if self.positions[i] == 0:
                            self.tapes[i].insert(0, self.blank)
                        else:
                            self.positions[i] -= 1
            
        return self.print_result()

    def run_step(self):
        ''' Roda um passo da maquina e retorna se existe um proximo passo '''
        
        if self.q is None or self.w is None:
            return False
        
        c = [tape[position] for tape, position in zip(self.tapes, self.positions)]
            
        transition = self.q.transition(c)
        
        if transition is None:
            return False
        
        else:
            self.q = transition.state
            
            for i in range(self.n_tapes):
                self.tapes[i][self.positions[i]] = transition.edge.w[i]
                
                if transition.edge.d[i] in ('D', '>'):
                    if len(self.tapes[i]) <= self.positions[i] + 1:
                        self.tapes[i].append(self.blank)
                    
                    self.positions[i] += 1
                elif transition.edge.d[i] in ('E', '<'):
                    if self.positions[i] == 0:
                        self.tapes[i].insert(0, self.blank)
                    else:
                        self.positions[i] -= 1
            
        return True

    def print_result(self):
        ''' Print and Return True (ok) or False (no ok) '''
        
        if self.q.isFinal:
            print(f'reconheceu: {self.w}')            
            
        else:
            print(f'Não reconheceu: {self.w}')
        
        print(f'Fitas: {self.tapes}')
            
        return self.q.isFinal
    
