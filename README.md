# vector-vault

A Godot 4.3 game where you pilot a rocket that moves in diagonal directions.

## Prerequisites

- [Godot 4.3](https://godotengine.org/download/) – download and install the standard (non-.NET) build for your platform.

## Running locally

1. Clone the repository:
   ```sh
   git clone https://github.com/kaiza/vector-vault.git
   cd vector-vault
   ```

2. Open the project in Godot:
   - Launch the Godot editor and click **Import**, then select the `project.godot` file in the cloned directory.
   - Alternatively, run from the command line:
     ```sh
     godot project.godot
     ```

3. Press **F5** (or the **Play** button in the toolbar) to run the game.

## Controls

| Input | Direction |
|-------|-----------|
| `W` or tap top half of screen | North-East |
| `D` or tap right half of screen | South-East |
| `S` or tap bottom half of screen | South-West |
| `A` or tap left half of screen | North-West |

## Building for the web

The project is configured to export to a static web build (see `export_presets.cfg`). To build manually:

1. Install the Godot export templates via **Editor → Manage Export Templates** in the Godot editor.
2. Run:
   ```sh
   mkdir -p build/web
   godot --headless --export-release "Web" build/web/index.html
   ```
3. Serve the `build/web` directory with any static file server, for example:
   ```sh
   npx serve build/web
   ```

The CI pipeline builds and deploys the web export to GitHub Pages automatically on every push to `main`.