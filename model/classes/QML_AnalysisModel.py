class AnalysisModel:
    def __init__(self):
        self.tempAnalysis = []
    
    # Add new items
    def add(self, path):
        self.tempAnalysis.append(path)

    # Clear items
    def clear(self):
        self.tempAnalysis.clear()