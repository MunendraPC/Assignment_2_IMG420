# Assignment_2_IMG420

Overview

This project implements an ExtendedSprite2D node in Godot Engine 4.x with two new features, signal communication, and an optional extra-credit TransformAnimatorSprite2D node.

The work is split into:

Core Features

Continuous motion with screen wrap.

A color pulse effect with adjustable speed and strength.

Signals

screen_wrapped(new_position: Vector2)

pulse_peak

Inter-Node Communication

Controller node sends signals to trigger ExtendedSprite2D.boost().

InfoLabel node updates UI when wrapping occurs.

Extra Credit

TransformAnimatorSprite2D node to animate transforms (play, pause, stop).

Project Structure
Assignment2_Package/
│── project/                # Godot project folder
│   ├── project.godot
│   ├── scenes/
│   │   ├── Demo.tscn        # Main demo scene
│   │   └── AnimDemo.tscn    # Extra credit animation demo
│   ├── scripts/
│   │   ├── ExtendedSprite2D.gd
│   │   ├── Controller.gd
│   │   ├── InfoLabel.gd
│   │   └── TransformAnimatorSprite2D.gd
│   └── assets/
│       └── blueorb.png      # Sample texture
└── README.md

How to Run

Install Godot Engine 4.x (tested on 4.1–4.2).

Open Godot → Import → Select the project/ folder.

Run scenes/Demo.tscn.

The orb moves, pulses, and wraps.

Press Space to trigger boost().

InfoLabel updates on wrap.

Run scenes/AnimDemo.tscn for the extra-credit animation demo.

Citations

Godot Documentation: https://docs.godotengine.org

(for API reference and best practices)

Class Reference: Used Sprite2D, Label, Node, and Input docs extensively.

Godot Tutorials: Community tutorials on signals, scene setup, and animations.

ChatGPT: Getting Help in Code generation and fixing issues like i had issues in Pulse it was helped by GPT

What I Did

Set up the project structure in Godot.

Created the scenes (Demo.tscn, AnimDemo.tscn).

Defined the ExtendedSprite2D node with exported variables and signals.

Implemented screen wrapping and pulse effect logic.

Added boost() method and wired signals across nodes.

Built UI feedback via InfoLabel.

Implemented and tested the extra-credit animator node.

Verified the project runs on Godot 4.x with no compilation required.

Notes

Project is self-contained: no compiling or external dependencies.

Code is fully in GDScript, ensuring compatibility and easy testing.
