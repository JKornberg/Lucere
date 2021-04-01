class Settings:
    def __init__(self, brightness,contrast,sharpness,iso,shutter_speed):
        self.brightness=brightness
        self.contrast = contrast
        self.sharpness=sharpness
        self.iso=iso
        self.shutter_speed = shutter_speed

    def format_settings(self):
        return f"Brightness: {self.brightness}, Contrast: {self.contrast}, Sharpness: {self.sharpness}, ISO: {self.iso}, Shutter_Speed: {self.shutter_speed}"