from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from classes.state import State
    from classes.edge import Edge

class Transition:
    def __init__(self, state: 'State', edge: 'Edge'):
        self.state = state
        self.edge = edge
    
    def __repr__(self):
        return f'{self.edge} -> {self.state}'
    
    def __eq__(self, t: 'Transition'):
        if isinstance(t, Transition):
            return self.state == t.state and self.edge == t.edge
        
        return False

