# GamePlatform

This is a simple program to give cool looking paterns. It does not depend on any graphics librairy.

## How to run?

Open `libless.exe`, it is the main excutable. (windows only)

## How to compile?

Run `make all`. If you changed anything in the makefile or settings, you probably want to run `make clean` first.

## How to play with the settinngs?

The settings are defined in `settings.hpp`.
The varibles to change are:

* foreground: The colour of the centermost pixel that all other are derrived from.
* background: The background colour, it cannot be equal to foreground and is reccomened to be very different from it in all chanels.
* variance: How much the r, g and b chancels can change per pixel. In 2 ^ (x-1), it must not be 0.
* bias: A static correction to variance, setting this to a negative value will result in an image that gets progressively darker from the centre.
