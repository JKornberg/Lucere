class CaptureModelTemp:
    def __init__(self):
        self.tempCaptures = []
    
    # Add new items
    def add(self, path):
        self.tempCaptures.append(path)

    # Clear items
    def clear(self):
        self.tempCaptures.clear()