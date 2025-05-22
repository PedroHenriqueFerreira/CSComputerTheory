class Edge:
    def __init__(self, r: str, w: str, d: str):
        self.r = r
        self.w = w
        self.d = d

    def __repr__(self):
        return f'Edge[R={self.r}, W={self.w}, D={self.d}]'

    def __eq__(self, e: 'Edge'):
        if isinstance(e, Edge):
            return self.r == e.r and self.w == e.w and self.d == e.d
        
        return False
