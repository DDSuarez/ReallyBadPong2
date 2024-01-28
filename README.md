Really Bad Pong 2
-
Eventually playable in browser at https://metasaval.itch.io/really-bad-pong-2

Made for Global Game Jam 2024. Also game one of my 20 game challenge. Also also my first complete game!
https://20_games_challenge.gitlab.io/

Don't ask about Really Bad Pong 1. We don't talk about Really Bad Pong 1.


Da Rules
-
P1 uses WASD and starts on the left side

P2 uses Arrow Keys and starts on right side

W/Up: moves your paddle up

S/Down: moves your paddle down

A/D/Left/Right: jam

First to 10 wins


Credits
-
Made in the Godot Engine v4.2: https://godotengine.org/

jingles-steel_00.ogg graciously in use from Kenney's royalty free assets: https://kenney.nl/

Basis for Pong code was from this tutorial I followed from Coding With Russ on YouTube: https://youtu.be/Xq9AyhX8HUc

Used Pixelorama to make the icon: https://orama-interactive.itch.io/pixelorama

Used lmms to create the collision sound using sfxr:  https://lmms.io/

The project files for the above two are also in the assets folder.

Learnings
-
I should have made a top level 2D node called Balls and instantiated all the balls under there. It would have been way easier to keep track of, and then I could upgrade the CPU AI to be able move torwards the ball closest it. As is, the AI can only follow the first Ball and breaks with multiple balls.

At first, I was trying to use RigidBody for the ball and CharacterBody for the player paddle. This made dealing with gravity difficult for a newbie. After watching Russ' tutorial, using CharacterBody for the Ball and a regular StaticBody for the Player was much easier.
