from State import State

class Machine: # AFD = (Q, Σ, δ, q0, F)
    def __init__(self, q: State, w: str, range: int):
        self.q = q
        self.w = w
        self.range = range
        
        self.fita: list[str] = []
        
        self.current: int = -1
        self.max: int = -1

        # Ideia para Turing Machine abaixo, onde range * 2 e o tamanho da fita da maquina:
        
        self.set_fita_space()
        self.init_fita()
        
        # print(self)

    def __repr__(self):
        return f'Machine[Q={self.q}, F={"".join(self.fita)}, C={self.current}, M={self.max}]'

    def set_fita_space(self):
        self.max = self.range * 2

        self.fita.append('#')
    
        for _ in range(self.max + 1):
            self.fita.append('_')

        # Fita fica com 2 * range + 2 elementos

        # Current indica exatamente o meio da fita
        self.current = self.range + 1
        # Max indica exatamente o ultimo elemento da fita
        self.max += 1

    # Ideia para Turing Machine abaixo:
    def init_fita(self):
        for a in list(self.w):
            self.fita[self.current] = a
            self.current += 1

        self.current = self.range + 1

        #print(f'{self.fita}\nLEN: {len(self.fita)}\nMAX: {self.max}')
        #print(f'current -> {self.fita[self.current]}')

    # OBS: a self.fita ja esta pronta com os dados.
    # Por exemplo, voce pode usar o self.current como o indice de self.fita[self.current]. Como ficaria?
    def run(self):
        if self.q is None or self.w is None:
            return False
        
        while True:            
            c = self.fita[self.current]
            
            transition = self.q.transition(c)
            
            if transition is None:
                # print(f'"{c}" nao pertence ao alfabeto ou nao possui transicao!!')
                break
            
            else:
                # print(f'{self.q.name} -> {transition.state.name} | {c} -> {transition.edge.w} | {self}')
                
                self.q = transition.state
                self.fita[self.current] = transition.edge.w
                
                if transition.edge.d in ('D', '>'):
                    self.current += 1
                elif transition.edge.d in ('E', '<'):
                    self.current -= 1
                else:
                    break
            
        return self.print_result()

    def run_step(self):
        ''' Roda um passo da maquina e retorna se existe um proximo passo '''
        
        if self.q is None or self.w is None:
            return False
        
        c = self.fita[self.current]
            
        transition = self.q.transition(c)
        
        if transition is None:
            return False
        
        else:
            self.q = transition.state
            self.fita[self.current] = transition.edge.w
            
            if transition.edge.d in ('D', '>'):
                self.current += 1
            elif transition.edge.d in ('E', '<'):
                self.current -= 1
            else:
                return False
            
        return True

    def print_result(self):
        ''' Print and Return True (ok) or False (no ok) '''
        
        if self.q.isFinal:
            print(f'reconheceu: {self.w}')
            
        else:
            print(f'Não reconheceu: {self.w}')
            
        return self.q.isFinal
    
