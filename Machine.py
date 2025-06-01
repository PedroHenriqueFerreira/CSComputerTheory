from State import State

class Machine: # AFD = (Q, Σ, δ, q0, F)
    def __init__(self, q: State, w: str, n_tapes: int = 1, size: int = 100, blank: str = '_'):
        self.q = q
        self.w = w
        self.n_tapes = n_tapes
        self.size = size
        self.blank = blank
        
        self.tapes: list[list[str]] = []
        self.positions: list[int] = []
        
        self.max: int = -1

        # Ideia para Turing Machine abaixo, onde size * 2 e o tamanho da fita da maquina:
        
        self.create_tapes()
        
        # print(self)

    def __repr__(self):
        return f'Machine[Q={self.q}, F={"".join(self.fita)}, C={self.current}, M={self.max}]'

    def create_tapes(self):
        self.max = self.size * 2 + 1
        
        # Cada fita fica com 2 * range + 2 elementos
        # Positions indicam exatamente o meio da fita
        for _ in range(self.n_tapes):
            self.tapes.append(['#'])
            
            for _ in range(self.max):
                self.tapes[-1].append(self.blank)
                
            self.positions.append(self.size + 1)

        for c in self.w:
            self.tapes[0][self.positions[0]] = c
            self.positions[0] += 1    
            
        self.positions[0] = self.size + 1

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
                        self.positions[i] += 1
                    elif transition.edge.d[i] in ('E', '<'):
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
                    self.positions[i] += 1
                elif transition.edge.d[i] in ('E', '<'):
                    self.positions[i] -= 1
            
        return True

    def print_result(self):
        ''' Print and Return True (ok) or False (no ok) '''
        
        if self.q.isFinal:
            print(f'reconheceu: {self.w}')
            
        else:
            print(f'Não reconheceu: {self.w}')
            
        return self.q.isFinal
    
