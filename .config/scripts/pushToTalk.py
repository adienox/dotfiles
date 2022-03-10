from pynput import keyboard # For keyboard listen event
import os # For running system commands

# Keypress event
def onPress(key):
    # Checks if key is key.alt_r
    if key == keyboard.Key.alt_r:
        # Unmutes the microphone
        os.system('pactl set-source-mute @DEFAULT_SOURCE@ false')

# Key release event
def onRelease(key):
    # Checks if key is key.alt_r
    if key == keyboard.Key.alt_r:
        # Mutes the microphone
        os.system('pactl set-source-mute @DEFAULT_SOURCE@ true')

try:
    # Set the microphone to mute by default
    print('Setting source to mute by default...')
    os.system('notify-send "Microphone" "Setting source to mute by default..."')
    os.system('pactl set-source-mute @DEFAULT_SOURCE@ true')

    # Listen for key events
    with keyboard.Listener(on_press=onPress, on_release=onRelease) as listener:
        listener.join()

except:
    # Sets the microphone to unmute
    print('Reverting back...')
    os.system('notify-send "Microphone" "Reverting back..."')
    os.system('pactl set-source-mute @DEFAULT_SOURCE@ false')
    print('Goodbye!')
