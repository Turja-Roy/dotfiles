import os
from PIL import ImageGrab

img = ImageGrab.grabclipboard()

# Save image to the directory from where the script is running
if img:
    # Check if Untitled_n.png already exists
    i = 0
    while os.path.exists(os.path.join(os.getcwd(), 'Untitled_{}.png'.format(i))):
        i += 1
    img.save(os.path.join(os.getcwd(), 'Untitled_{}.png'.format(i)), 'PNG')
else:
    pass
