from classes.edge import Edge
from classes.transition import Transition

class State:
    def __init__(self, name: str):
        self.name = name
        
        self.isFinal = False
        self.transitions: list[Transition] = []

    def __repr__(self):
        return f'State[N={self.name}, F={self.isFinal}]'
 
    def __eq__(self, s: 'State'):
        if isinstance(s, State):
            return self.name == s.name
        
        return False
 
    def setIsFinal(self): 
        self.isFinal = True

    def addTransition(self, state: 'State', r: str | list[str], w: str | list[str], d: str | list[str]):
        return self.addTransitions(state, Edge(list(r), list(w), list(d)))

    def addTransitions(self, state: 'State', *edges: Edge):
        for edge in edges:
            transition = Transition(state, edge)
            
            if transition not in self.transitions:
                self.transitions.append(transition)
            
        return self

    def transition(self, r: list[str]) -> Transition:
        for t in self.transitions:
            if t.edge.r == r:
                return t
            
        return None