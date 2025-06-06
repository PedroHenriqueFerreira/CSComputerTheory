from tkinter import Tk, Canvas

from Machine import Machine

CANVAS_WIDTH = 800
CANVAS_HEIGHT = 200
CANVAS_COLOR = '#d8dee9'

BLOCK_SIZE = 60
BLOCK_PADDING = 6
BLOCK_FONT = ('Arial', 20)
BLOCK_COLOR = '#4c566a'
BLOCK_FONT_COLOR = '#d8dee9'
BLOCK_FAIL_COLOR = '#d07087'
BLOCK_SUCESS_COLOR = '#8fbcbb'

MODE = {
    'fast': {
        'MOVE_SIZE': 66, # Pixels que sera movido a cada passo
        'MOVE_DELAY': 0, # Delay em milissegundos
        'STEP_DELAY': 8, # Delay entre cada passo da maquina
        'INITIAL_DELAY': 1000 # Delay inicial antes de comecar a rodar a maquina 
    },
    'normal': {
        'MOVE_SIZE': 6, # Pixels que sera movido a cada passo   
        'MOVE_DELAY': 16, # Delay em milissegundos
        'STEP_DELAY': 16, # Delay entre cada passo da maquina
        'INITIAL_DELAY': 1000 # Delay inicial antes de comecar a rodar a maquina 
    },
    'slow': {
        'MOVE_SIZE': 6, # Pixels que sera movido a cada passo
        'MOVE_DELAY': 32, # Delay em milissegundos
        'STEP_DELAY': 96, # Delay entre cada passo da maquina
        'INITIAL_DELAY': 1000 # Delay inicial antes de comecar a rodar a maquina 
    }
}

POINTER_WIDTH = BLOCK_SIZE / 2
POINTER_HEIGHT = BLOCK_SIZE / 3
POINTER_PADDING = 6
POINTER_COLOR = '#4c566a'

STATE_FONT = ('Arial', 12, 'bold')
STATE_FONT_COLOR = '#4c566a'

class Block: 
    def __init__(self, canvas: Canvas, x: int, y: int, value: str):
        self.canvas = canvas
        self.x = x
        self.y = y
        self.value = value
        
        self.rectangle: int = -1
        self.text: int = -1
        
        self.draw()
    
    def draw(self):
        self.rectangle = self.canvas.create_rectangle(
            self.x, 
            self.y, 
            self.x + BLOCK_SIZE, 
            self.y + BLOCK_SIZE, 
            width=0,
            fill=BLOCK_COLOR
        )
        
        self.text = self.canvas.create_text(
            self.x + BLOCK_SIZE / 2, 
            self.y + BLOCK_SIZE / 2, 
            text=self.value, 
            font=BLOCK_FONT,
            fill=BLOCK_FONT_COLOR
        )
        
    def move(self, direction: int):
        self.canvas.move(self.rectangle, direction, 0)
        self.canvas.move(self.text, direction, 0)
        
    def rename(self, value: str):
        self.value = value
        self.canvas.itemconfig(self.text, text=self.value)

class Pointer:
    def __init__(self, canvas: Canvas, x: int, y: int):
        self.canvas = canvas
        self.x = x
        self.y = y
        
        self.polygon: int = -1
        
        self.draw()
    
    def draw(self):
        self.polygon = self.canvas.create_polygon(
            self.x, self.y + POINTER_PADDING, 
            self.x - POINTER_WIDTH / 2, self.y + POINTER_HEIGHT + POINTER_PADDING,
            self.x + POINTER_WIDTH / 2, self.y + POINTER_HEIGHT + POINTER_PADDING, 
            fill=POINTER_COLOR, 
            width=0
        )

class State:
    def __init__(self, canvas: Canvas, name: str, x: int = 0, y: int = 0):
        self.canvas = canvas
        self.name = name
        self.x = x
        self.y = y
        
        self.text: int = -1
        
        self.draw()
        
    def draw(self):
        self.text = self.canvas.create_text(
            self.x, 
            self.y + POINTER_PADDING, 
            text=self.name, 
            font=STATE_FONT,
            fill=STATE_FONT_COLOR
        )
        
    def rename(self, name: str):
        self.name = name
        
        self.canvas.itemconfig(self.text, text=self.name)

class Tape:
    def __init__(self, canvas: Canvas, machine: Machine, i: int):
        self.canvas = canvas
        self.machine = machine
        self.i = i
        
        self.blocks: list[Block] = []
        self.pointer: Pointer = None
        self.state: State = None
        
        self.start()
        self.draw()
        
    def start(self):
        tape = self.machine.tapes[self.i]
        position = self.machine.positions[self.i]
        
        total_width = len(tape) * BLOCK_SIZE + (len(tape) - 1) * BLOCK_PADDING
    
        self.x = (CANVAS_WIDTH - total_width) / 2
        self.y = (CANVAS_HEIGHT - BLOCK_SIZE) / 2
        
        self.x0 = self.x + position * (BLOCK_SIZE + BLOCK_PADDING) + BLOCK_SIZE / 2
        
        self.pointer_y = self.y + BLOCK_SIZE
        self.state_y = self.pointer_y + POINTER_HEIGHT + 2 * POINTER_PADDING

    def draw(self):
        tape = self.machine.tapes[self.i]
        
        for i, value in enumerate(tape):
            self.blocks.append(
                Block(
                    self.canvas, 
                    self.x + i * (BLOCK_SIZE + BLOCK_PADDING), 
                    self.y, 
                    value
                )
            )
            
        self.pointer = Pointer(self.canvas, self.x0, self.pointer_y)
        self.state = State(self.canvas, self.machine.q.name, self.x0, self.state_y)

    def success(self):
        for block in self.blocks:
            self.canvas.itemconfig(block.rectangle, fill=BLOCK_SUCESS_COLOR)
        
        self.canvas.itemconfig(self.pointer.polygon, fill=BLOCK_SUCESS_COLOR)
        
        self.state.rename(f'{self.machine.q.name} (aceito)')
        
    def fail(self):
        for block in self.blocks:
            self.canvas.itemconfig(block.rectangle, fill=BLOCK_FAIL_COLOR)
            
        self.canvas.itemconfig(self.pointer.polygon, fill=BLOCK_FAIL_COLOR)
        
        self.state.rename(f'{self.machine.q.name} (rejeitado)')
    
    def move(self, direction: int):
        for block in self.blocks:
            block.move(direction) 
    
class UI:
    def __init__(self, machine: Machine, mode: str = 'fast'):
        self.machine = machine
        self.mode = mode
        
        self.root = Tk()
        self.root.resizable(False, False)
        self.root.title('Máquina de Turing')
        
        self.tapes: list[Tape] = []
        
        for i in range(self.machine.n_tapes):
            canvas = Canvas(self.root, width=CANVAS_WIDTH, height=CANVAS_HEIGHT, bg=CANVAS_COLOR)
            canvas.pack()
            
            self.tapes.append(Tape(canvas, self.machine, i))
    
        self.root.after(MODE[mode]['INITIAL_DELAY'], self.step)
        self.root.mainloop()
    
    def success(self):
        for tape in self.tapes:
            tape.success()
        
    def fail(self):
        for tape in self.tapes:
            tape.fail()
    
    def step(self):
        prev_positions = self.machine.positions.copy()
        has_next = self.machine.run_step()
        next_positions = self.machine.positions.copy()
        
        directions = [prev - next for prev, next in zip(prev_positions, next_positions)]
            
        for tape in self.tapes:
            tape.state.rename(self.machine.q.name)
            
        for i in range(self.machine.n_tapes):
            self.tapes[i].blocks[prev_positions[i]].rename(self.machine.tapes[i][prev_positions[i]])
        
        if not has_next:
            if self.machine.q.isFinal:
                self.success()
            else:
                self.fail()
        else:
            for tape, direction in zip(self.tapes, directions):
                if direction == 0:
                    continue
                
                for i in range((BLOCK_SIZE + BLOCK_PADDING) // MODE[self.mode]['MOVE_SIZE']):
                    tape.canvas.after((i + 1) * MODE[self.mode]['MOVE_DELAY'], tape.move, MODE[self.mode]['MOVE_SIZE'] * direction)
                
            self.root.after((i + 1) * MODE[self.mode]['MOVE_DELAY'] + MODE[self.mode]['STEP_DELAY'], self.step)
    