<!-- PROJECT LOGO -->
<br />
<div alig="center">
    <h1 align="center"> Technical Specification</h1>
    <p align="center">
        <strong> Frogger in FPGA - Team 5's project</strong>
        <br />

</div>
</br>

<!-- TABLE OF CONTENTS -->

<details>
<summary>
      <h4 style="display: inline-block">Table of Contents</h4>
</summary>

- [I. Audience](#i-audience)
- [II. Introduction](#ii-introduction)
  - [1. Overview](#1-overview)
  - [2. Context](#2-context)
  - [3. Goals and Objectives](#3-goals-and-objectives)
  - [4. Assumptions](#4-assumptions)
- [III. Hardware](#iii-hardware)
  - [1. Development Board](#1-development-board)
  - [2. Input Controls](#2-input-controls)
  - [3. Light Emitting Diodes (LEDs)](#3-light-emitting-diodes-leds)
  - [4. 7-Segment Display](#4-7-segment-display)
  - [5. VGA Connector](#5-vga-connector)
  - [6. Other Components](#6-other-components)
- [IV. Software Architecture](#iv-software-architecture)
  - [1. Overview of Software Modules](#1-overview-of-software-modules)
  - [2. Module Interactions](#2-module-interactions)
  - [3. Inputs and Outputs Mapping](#3-inputs-and-outputs-mapping)
    - [Input Controls to Game Actions](#input-controls-to-game-actions)
    - [Outputs to Display](#outputs-to-display)
  - [4. Data Structures](#4-data-structures)
  - [5. Memory Management](#5-memory-management)
  - [6. Clock Management](#6-clock-management)
    - [6.1 Clock Signal Distribution:](#61-clock-signal-distribution)
    - [6.2 Clock Division:](#62-clock-division)
    - [6.3 Game Timing:](#63-game-timing)
    - [6.4 Frame Rate Management:](#64-frame-rate-management)
- [V. Functional Requirements](#v-functional-requirements)
  - [1. Game Mechanics](#1-game-mechanics)
  - [2. User Input Handling](#2-user-input-handling)
  - [3. Display Requirements](#3-display-requirements)
  - [4. Game State Management](#4-game-state-management)
  - [5. Level Progression](#5-level-progression)
  - [6. Car Control Behavior](#6-car-control-behavior)
- [VI. Risks and Mitigation Strategies](#vi-risks-and-mitigation-strategies)
  - [1. Identified Risks](#1-identified-risks)
  - [2. Mitigation Strategies](#2-mitigation-strategies)
- [VII. Glossary](#vii-glossary)

</details>

---

### I. Audience

<h4>This document is primarily intended for:</h4>
<ul>
    <li><strong>Software Engineer</strong>: To gain insight into both user and technical needs, while assisting in decision-making and strategic planning. Provide clarity on risks, challenges, and the additional technical considerations.</li>
</ul>
<h4>The Secondary Audiences:</h4>
<ul>
    <li><strong>Program Manager</strong>: To ensure coherence with the Functional Specification.</li>
    <li><strong>Quality Assurance</strong>: To support the creation of the Test Plan Document and act as a guide during issue validation.</li>
    <li><strong>Project Manager</strong>: To help identify risks and dependencies at every stage of the project lifecycle.</li>
</ul>

---

### II. Introduction

#### 1. Overview
The project involves the development of a hardware-accelerated version of the Frogger arcade game on an [FPGA](#FPGA) using [Verilog](#Verilog). The game will run on a [VGA](#VGA) display and be controlled through integrated board switches, with a focus on optimizing performance and resource usage on the [FPGA](#FPGA).
#### 2. Context
This project leverages [FPGA](#FPGA) technology to implement the Frogger game in hardware, aiming to exploit the parallelism and real-time capabilities of the platform. The use of [Verilog](#Verilog) allows for direct control of the [FPGA](#FPGA)'s resources, ensuring precise timing and efficient logic design.

#### 3. Goals and Objectives
**Mandatory Requirements**

- FPGA-based Frogger game using Verilog with VGA output.
- VGA output with correct signal synchronization and real-time gameplay.
- Functional input via FPGA switches with reliable debouncing.
- Display a 1x1 frog sprite and at least one car on screen at all times.
- Game logic includes frog movement, car collision detection, and level progression.
- Efficient memory and clock management.

**Nice-to-Have Objectives**
- Detailed, colored frog sprite and up to 16 cars with varying speeds.
- Multiple levels (at least 8) with increasing difficulty.
- Scoring system and enhanced visual feedback via LEDs / 7-Segment Displays.
- Performance optimization and maintanibility for future features.

#### 4. Assumptions

- The development board has sufficient resources to implement the game logic and display requirements.
- The VGA display is compatible with the signal output from the FPGA.
- The input switches on the FPGA board are fully functional and responsive for user control.
- Power supply to the FPGA will be stable and sufficient for the game's hardware demands.
- The project will be developed and tested in an environment with access to necessary edevelopment tools (e.g., Verilog compiler, simulation software).
- No external systems or APIs will be required to complete the project.

---

### III. Hardware

#### 1. Development Board
<table>
  <tr>
      <td><b>Power Requirement</td>
      <td>Operating Voltage:</td>
      <td>Typically 5V supplied via USB.</td>
  </tr>
  <tr>
      <td><b>Environmental Specifications</td>
      <td>Operating Temperature Range:</td>
      <td>0°C to 70°C.</td>
  </tr>
  <tr>
      <td><b>Form Factor</td>
      <td>Dimensions:</td>
      <td>66 mm in width and 48 mm in height</td>
   </tr>
   <tr>
      <td><b>Educational Purpose</td>
      <td colspan="2">Designed for easy experimentation and prototyping without the need for additional breadboards or soldering.</td>
   </tr>
</table>

#### 2. Input Controls
<table>
   <tr>
         <td><b>Number of Switches:</td>
         <td colspan="6">4 (tactile pushbutton swicthes)</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Functionality:</td>
         <td rowspan="2"colspan="2">Allow the User to move the Frog in four direction :</td>
         <td>Switch 1:</td>
         <td>Switch 2:</td>
         <td>Switch 3:</td>
         <td>Switch 4:</td>
   </tr>
   <tr>
         <td>Up</td>
         <td>Left</td>
         <td>Right</td>
         <td>Down</td>
   </tr>

</table>

#### 3. Light Emitting Diodes (LEDs)
<!-- <table>
   <tr>
         <td><b>Number of LEDs :</td>
         <td colspan="3">4</td>
   </tr>
   <tr>
         <td><b>Functionality:</td>
         <td colspan="2">Provides visual feedback for board status and diagnostic information.</td>
      <td colspan="2"><b><i>WHAT THE LED DOING</td>
    </tr>
</table> -->

#### 4. 7-Segment Display
<table>
   <tr>
         <td><b>Number of Displays:</td>
         <td>2</td>
   </tr>
   <tr>
         <td><b>Functionality:</td>
         <td>Displays numeric and alphanumeric information such as the current level of the User's game.</td>
    </tr>
</table>

#### 5. VGA Connector
<table>
   <tr>
         <td><b>VGA Output</td>
         <td>Connector Type:</td>
         <td>15-pin D-sub connector (standard VGA)</td>
   </tr>
   <tr>
         <td><b>Supported Resolutions:</td>
         <td colspan="2"><b>640x480</b>, 800x600, 1024x768, 1280x1024</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Functionality:</td>
         <td colspan="2">Provides video output for displaying game graphics and user interface.</td>
   </tr>
      <tr>
         <td colspan="2">Access to horizontal and vertical sync signals for display timing.</td>
      </tr>
</table>


#### 6. Other Components
CLOCK
<!-- idk for now, maybe even not needed -->
---

### IV. Software Architecture

#### 1. Overview of Software Modules

<table>
      <tr>
            <th><b>Module Name</td>
            <th><b>Description</td>
      </tr>
      <tr>
            <td align="center"><pre><b>main.v</td>
            <td>This is the entry point of the game, responsible for initializing and orchestrating the other modules. It manages the clock signals and ensures proper sequencing of game functions.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>frog.v</td>
            <td>This module handles all the logic related to the frog’s movements on the screen. It manages user inputs to control the frog, ensuring it moves across the lanes while avoiding cars.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>car.v</td>
            <td>Defines the behavior of the cars that the frog must avoid. It manages car speed, direction, and position. Multiple cars can be controlled through this module, with varying speeds across different levels.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>game_controller.v</td>
            <td>Manages the game state, including start, play, game over, and level progression. This module ensures the game follows the intended flow, including tracking the player’s progress and adjusting difficulty.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>display_controller.v</td>
            <td>Responsible for interfacing with the VGA display, controlling what is shown on the screen. It manages the rendering of the frog, cars, game background, and any other visual elements.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>collision_detector.v</td>
            <td>Implements logic to detect when the frog collides with a car. This module ensures accurate hit detection, which is critical for determining when the player loses the game.</td>
      </tr>
      <tr>
            <td align="center"><pre><b>level_manager.v</td>
            <td>Manages the level increments and difficulty scaling. It handles transitions between levels, adjusting car speed and other parameters to make the game more challenging.</td>
      </tr>
</table>


#### 2. Module Interactions
```mermaid
graph TD;
      A[main.v]:::highlight -->B{Clock Signals}:::grey --> C[frog.v]:::highlight;
      B{Clock Signals}:::grey --> D[car.v]:::highlight;
      B{Clock Signals}:::grey --> E[game_controller.v]:::highlight;
      B{Clock Signals}:::grey --> F[display_controller.v]:::highlight;
      B{Clock Signals}:::grey --> G[collision_detector.v]:::highlight;
      B{Clock Signals}:::grey --> H[level_manager.v]:::highlight;

      C[frog.v]:::highlight -->J((User Inputs)):::small --> E[game_controller.v]:::highlight;
      D[car.v]:::highlight -->K((Car Positions)):::small --> G[collision_detector.v]:::highlight;
      C[frog.v]:::highlight -->L((Frog Position)):::small --> G[collision_detector.v]:::highlight;
      G[collision_detector.v]:::highlight -->M((Collision Status)):::small --> E[game_controller.v]:::highlight;
      E[game_controller.v]:::highlight -->N((Game State)):::small --> F[display_controller.v]:::highlight;
      E[game_controller.v]:::highlight -->P((Level Info)):::small --> H[level_manager.v]:::highlight;
      H[level_manager.v]:::highlight -->Q((Level Data)):::small --> D[car.v]:::highlight;
      F[display_controller.v]:::highlight -->R((Render Data)):::small -->I{VGA}:::vga;

classDef highlight fill:#5C955C,stroke:#333,stroke-width:3px,color:#fff;
classDef small fill:#333,font-size:10px,color:#fff;
classDef vga fill:#ff9,stroke:#333,stroke-width:2px;
classDef grey fill:#333,stroke:#333,stroke-width:3px,color:#fff;
```

#### 3. Inputs and Outputs Mapping

##### Input Controls to Game Actions

<table>
      <thead>
            <tr>
                  <th ><strong>Input Control</strong></th>
                  <th><strong>Game Action</strong></th>
                  <th><strong>Description</strong></th>
            </tr>
      </thead>
      <tbody>
            <tr>
                  <td align="center">Switch 1</td>
                  <td>Move Frog Up</td>
                  <td>Moves the frog one position up on the screen.</td>
            </tr>
            <tr>
                  <td align="center">Switch 2</td>
                  <td>Move Frog Left</td>
                  <td>Moves the frog one position to the left.</td>
            </tr>
            <tr>
                  <td align="center">Switch 3</td>
                  <td>Move Frog Right</td>
                  <td>Moves the frog one position to the right.</td>
            </tr>
            <tr>
                  <td align="center">Switch 4</td>
                  <td>Move Frog Down</td>
                  <td>Moves the frog one position down on the screen.</td>
            </tr>
            <tr>
                  <td align="center">All the Switch</td>
                  <td>Reset Game</td>
                  <td>Resets the game to the initial state.</td>
      </tbody>
</table>

##### Outputs to Display

<table>
      <thead>
            <tr>
                  <th><strong>Output</strong></th>
                  <th><strong>Display Element</strong></th>
                  <th><strong>Description</strong></th>
            </tr>
      </thead>
            <tr>
                  <td align="center">VGA Output</td>
                  <td>Frog Sprite</td>
                  <td>Displays the frog at its current position.</td>
            </tr>
            <tr>
                  <td align="center">VGA Output</td>
                  <td>Car Sprites</td>
                  <td>Displays cars moving across the screen.</td>
            </tr>
            <tr>
                  <td align="center">VGA Output</td>
                  <td>Background</td>
                  <td>Displays the game background (e.g., road, river).</td>
            </tr>
            <tr>
                  <td align="center">7-Segment Display</td>
                  <td>Current Level</td>
                  <td>Shows the current level of the game.</td>
            </tr>
</table>

#### 4. Data Structures
<table>
      <thead>
            <tr>
                  <th style="width:10%">Category</th>
                  <th>Variable</th>
                  <th>Description</th>
            </tr>
      </thead>
            <tr>
                  <td align="center"><b>Clock</td>
                  <td><code>i_Clk</code></td>
                  <td>System clock input</td>
            </tr>
            <tr>
                  <td rowspan="2" align="center"><b>7-Segment Display</td>
                  <td><code>o_Segment1</code></td>
                  <td>7-segment display output for digit 1</td>
            </tr>
            <tr>
                  <td><code>o_Segment2</code></td>
                  <td>7-segment display output for digit 2</td>
            </tr>
            <tr>
                  <td rowspan="4" align="center"><b>Switches</td>
                  <td><code>i_Switch_1</code></td>
                  <td>Up switch input</td>
            </tr>
            <tr>
                  <td><code>i_Switch_2</code></td>
                  <td>Left switch input</td>
            </tr>
            <tr>
                  <td><code>i_Switch_3</code></td>
                  <td>Right switch input</td>
            </tr>
            <tr>
                  <td><code>i_Switch_4</code></td>
                  <td>Down switch input</td>
            </tr>
            <tr>
                  <td rowspan="5" align="center"><b>VGA Output</td>
                  <td><code>o_VGA_HSync</code></td>
                  <td>VGA horizontal sync output</td>
            </tr>
            <tr>
                  <td><code>o_VGA_VSync</code></td>
                  <td>VGA vertical sync output</td>
            </tr>
            <tr>
                  <td><code>o_VGA_Red</code></td>
                  <td>VGA red component output</td>
            </tr>
            <tr>
                  <td><code>o_VGA_Grn</code></td>
                  <td>VGA green component output</td>
            </tr>
            <tr>
                  <td><code>o_VGA_Blu</code></td>
                  <td>VGA blue component output</td>
            </tr>
</table>

#### 5. Memory Management
<!-- In the Frogger FPGA project, memory is managed to optimize the limited resources of the FPGA. Key data such as the frog’s position, car positions, and game state are stored in registers for fast access. Larger data sets, like sprite information and display buffers, are stored in Block RAM (BRAM).

Memory optimization strategies include:

- Registers for small, frequently updated variables.
- BRAM for larger assets like sprites and backgrounds.
- Look-Up Tables (LUTs) to store fixed graphical elements. -->

---

#### 6. Clock Management

##### 6.1 Clock Signal Distribution:
The primary clock signal (`i_Clk`) is distributed to all modules to maintain synchronization. This ensures that all processes in the system operate in unison. For instance, the `i_Clk` signal drives the VGA controller, sprite renderers, and the game controller module.

>Example:  
>In `src/main.v`, the `i_Clk` signal is connected to the VGA controller and other modules:
>```verilog
>always @(posedge i_Clk) begin
>   // Clock-driven processes
>end
>```
---
##### 6.2 Clock Division: 
Certain modules require slower clock signals to function correctly, such as game elements with slower movement. Clock division is used to generate these lower-frequency clocks, ensuring that these modules operate at an appropriate rate. For example, the car movement in the game is controlled using a slower clock.

>Example:  
>In `src/sprites/car.v`, a clock divider is used to slow down the car’s movement:
>```verilog
>reg [N:0] counter;
>always @(posedge i_Clk) begin
>    if (counter == TARGET) begin
>        // Trigger movement at a slower rate
>        counter <= 0;
>    end else begin
>        counter <= counter + 1;
>    end
>end
>```
---
##### 6.3 Game Timing:
Game timing is managed by counting clock cycles, which ensures smooth gameplay and synchronized events like movement and level progression. By counting the clock pulses, the system can keep track of in-game time intervals, ensuring that actions like jumping, obstacles moving, or time limits are handled consistently.

>Example:  
>In `src/main.v`, clock cycles are counted to implement a timer that controls game events:
>```verilog
>reg [31:0] timer;
>always @(posedge i_Clk) begin
>    timer <= timer + 1;
>    if (timer == TIME_LIMIT) begin
>        // Trigger event (e.g., level progression)
>    end
>end
>```
---
##### 6.4 Frame Rate Management:
Synchronizing the frame rate with the VGA display’s refresh rate ensures that the graphics are updated smoothly, preventing issues like screen tearing. The system is designed to match the frame update frequency with the VGA display's 60Hz refresh rate.

>Example:  
>In the VGA controller within `src/main.v`, frame synchronization ensures smooth rendering:
>```verilog
>always @(posedge i_Clk) begin
>    if (vga_refresh_ready) begin
>        // Update frame data
>    end
>end
>```

---

### V. Functional Requirements

#### 1. Game Mechanics

The core gameplay revolves around guiding a frog safely across a perilous road filled with moving cars, leading to increasingly challenging levels. Key mechanics include:

- **Frog Movement**: The player controls a frog that moves up, down, left, and right across the screen.

> <ins>Example (from `player.v`):</ins>  
>The player's movement is controlled using switches for up, down, left, and right. The `player.v` module handles debouncing for smooth input and updates the player's x and y coordinates based on directional inputs:
>```verilog
>always @(posedge i_Clk) begin
>if (w_player_up == 1'b0 && r_player_up == 1'b1) begin
>      if (o_player_y > 1) begin
>            o_player_y <= o_player_y - 1;
>      end
>end else if (w_player_down == 1'b0 && r_player_down == 1'b1) begin
>      if (o_player_y < 15) begin
>            o_player_y <= o_player_y + 1;
>      end
>end
>// Similar logic for left and right...
>end
>```
---
- **Cars**: Vehicles of varying speeds move horizontally across the screen, posing obstacles for the frog.

> <ins>Example (from `car.v`):</ins>  
>The `car.v` module simulates the movement of cars across the screen, resetting their position after they pass the right side of the display:
>```verilog
>always @(posedge i_Clk) begin
>if (clock_tick < 12500000) begin
>      clock_tick <= clock_tick + 1;
>end else begin
>      clock_tick <= 0;
>      if (o_car_x < 20) begin
>            o_car_x <= o_car_x + 1;
>      end else begin
>            o_car_x <= 0;
>      end
>    end
>end
>```
---
- **Collision Detection**: If the frog collides with a car, the game ends in a "Game Over" state.

> <ins>Example (from `main.v`):</ins>  
>Collision detection checks whether the player's position matches that of any car:
>```verilog
>if ((car_x == player_x && car_y == player_y) || (car2_x == player_x && car2_y == player_y)) begin
>     o_VGA_Red = 3'b111; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Player hit by a car
>     i_reset <= 1;
>end
>```
---
- **Obstacles**: Alongside cars, elements like rivers or other hazards may be introduced to increase difficulty.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **Goal**: Each level has a designated goal area that the frog must reach to progress.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **Level Progression**: With each completed level, difficulty ramps up—cars move faster, lanes get narrower, and new obstacles appear.

> <ins>Example (from `main.v`):</ins>  
>The game keeps track of the current level and increments it when the frog reaches the top of the screen:
>```verilog
>if (player_y == 1) begin
>     if (level == 99) begin
>           level <= 0;
>     end else begin
>           evel <= level + 1;
>     end
>end
>```
---
- **Scoring System**: Players earn points for progress.

> <ins>Example (from `seven_segments.v`):</ins>  
>The player's score is displayed using a 7-segment display. The current level is divided into two digits for display:
>```verilog
>case (counter/10)
>      1: o_Segment1 = 7'b1111001; // 1
>      2: o_Segment1 = 7'b0100100; // 2
>      // Similar cases for other digits
>endcase
>```
---
- **Visual Feedback**: Clear visual cues for important game states like level transitions and game over.

> <ins>Example (from `main.v`):</ins>  
>The game manages colors on the VGA output to indicate the player's and cars' positions:
>```verilog
>if (cell_x == player_x && cell_y == player_y) begin
>      o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Player color
>end
>```
---
- **Reset Function**: A reset option allows players to restart the game at any point.

> <ins>Example (from `player.v`):</ins>  
>The player can reset their position when the reset signal is triggered:
>```verilog
>if (i_reset == 1) begin
>     o_player_x <= 10;
>     o_player_y <= 15;
>     o_reset <= 1;
>  end else begin
>     o_reset <= 0;
>end
>```
---
- **Smooth, Real-time Gameplay**: Gameplay should feel seamless, with smooth animations and precise, responsive controls to ensure an engaging experience.

  > The design of the modules (e.g., `debounce_switch.v`) ensures that user inputs are processed accurately, preventing any unintended actions and maintaining fluidity in player control.


---

### 2. User Input Handling

User input is critical to navigating the game world. The system will respond to:

- **Directional Movement**: The FPGA switches will control the frog’s movements in four directions—up, down, left, and right.

> Example (from `player.v`):  
>The player uses switches for directional control, with debounced inputs processed to ensure accurate movements:
>```verilog
>always @(posedge i_Clk) begin
>    r_player_up <= w_player_up;
>    r_player_down <= w_player_down;
>    // Logic for left and right movements...
>    if (w_player_up == 1'b0 && r_player_up == 1'b1) begin
>        if (o_player_y > 1) begin
>            o_player_y <= o_player_y - 1;
>        end
>    end
>    // Similarly for down, left, and right...
>end
>```
---
- **Game Reset**: Pressing all switches simultaneously will reset the game, restarting from the beginning.

> <ins>Example (from `player.v`):</ins>  
>The reset functionality resets the player's position and the game state:
>```verilog
>if (i_reset == 1) begin
>    o_player_x <= 10;
>    o_player_y <= 15;
>    o_reset <= 1;
>end
>```
---
- **Debounced Inputs**: Debouncing ensures reliable control, preventing unintended multiple actions from a single switch press.

> <ins>Example (from `debounce_switch.v`):</ins>  
>The debounce logic stabilizes the input switch state before passing it to the >player control module:
>```verilog
>always @(posedge i_Clk) begin
>    if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
>        r_Count <= r_Count + 1;
>    // Switch stabilization logic...
>end
>assign o_Switch = r_State;
>```

---

### 3. Display Requirements

To enhance the gaming experience, the visual display on the VGA screen should include:

- **Frog Sprite**: A clearly defined, smoothly moving frog that the player controls.

  > <ins>Example (from `main.v`):</ins>  
  >The output logic for the player sprite indicates its position:
  >```verilog
  >if (cell_x == player_x && cell_y == player_y) begin
  >    // Color the player
  >    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Blue for player
  >end
  >```
---
- **Moving Cars**: Vehicles of varying speeds and sizes that traverse the screen, presenting obstacles.

> <ins>Example (from `car.v`):</ins>  
>The car module controls the horizontal velocity of cars based on a clock:
>```verilog
>if (clock_tick < 12500000) begin
>    clock_tick <= clock_tick + 1;
>end else begin
>    // Logic to reset car position...
>end
>```
---
- **Background Elements**: A thematic background (road, river, etc.) that sets the game environment.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **7-Segment Display**: Displays the current level and other important game information.

> <ins>Example (from `seven_segments.v`):</ins>  
>The 7-segment display updates to show the current level:
>```verilog
>case (counter/10)
>    // Cases for segments display...
>endcase
>```
---
- **Visual Cues**: Transitions between game states (such as advancing levels or game over) should be obvious and immediate.

> Example (from `main.v`):  
>Color changes and resets signify important game events:
>```verilog
>if (collision_condition) begin
>    // Color change for game over or level transition...
>end
>```

---

### 4. Game State Management

The game will handle multiple states, ensuring smooth transitions and clear objectives at all times:

- **Start Screen**: Displays the game’s title and provides basic instructions for playing.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **Play State**: The core gameplay where the player controls the frog, attempting to cross the screen without hitting a car.

  > Example (from current code logic):  
  The primary game loop continuously checks for player input and updates the game state based on player movements and collisions.
---
- **Game Over State**: If a collision occurs, the game ends with a game over screen.

> <ins>Example (from `main.v`):</ins>  
>Collision detection triggers the game over state:
>```verilog
>if (collision_detected) begin
>    // Logic to display game over message and stop the game
>end
>```
---
- **Level Transitions**: As the player successfully completes levels, difficulty increases, and new obstacles are introduced.

> <ins>Example (from `main.v`):</ins>  
>The game can increment levels based on player position:
>```verilog
>if (player_y == 1) begin
>    // Logic to increment level...
>end
>```

---

### 5. Level Progression

Level progression is a key part of keeping players engaged and challenged. The game will feature:

- **Multiple Levels**: Each level ramps up in difficulty, with faster cars, more obstacles, and narrower lanes.

> <ins>Example (from `main.v`):</ins>  
>Levels are managed using a variable that increments and affects game mechanics:
>```verilog
>if (level_increased) begin
>    // Logic to adjust car speeds and obstacles based on new level
>end
>```
---
- **Level Transitions**: Visual feedback (such as animations or messages) will signal the player’s progression between levels.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **Level Information**: The 7-segment display will clearly indicate the current level, helping players track their progress.

> <ins>Example (from `seven_segments.v`):</ins>  
>The display shows level information as part of the score:
>```verilog
>o_Segment1 = level; // Display current level
>```
---
- **Scalability**: The game should allow for easy addition of new levels and obstacles for future updates or expansions.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]

---

### 6. Car Control Behavior

The cars are more than just obstacles; they introduce variability and challenge. Their behavior includes:

- **Horizontal Movement**: Cars move steadily across the screen from either left to right or right to left.

> <ins>Example (from `car.v`):</ins>  
>Cars reset their position after traveling a defined distance:
>```verilog
>if (o_car_x < 20) begin
>    o_car_x <= o_car_x + 1; // Move car horizontally
>end else begin
>    o_car_x <= 0; // Reset position
>end
>```
---
- **Lane Occupancy**: Only one car per lane at any given time, avoiding lane overcrowding.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]
---
- **Randomized Patterns**: Car speed and position are randomized for each level, adding an element of unpredictability.

  > [MISSING INFORMATIONS TO PROVIDE A CORRECT DESCRIPTION]


---

### VI. Risks and Mitigation Strategies

#### 1. Identified Risks  

#### 2. Mitigation Strategies

---

### VII. Glossary

|  Terms  |  Definitions  |  Source  |
|:---:|:---|:---:|
|  <a name="FPGA">FPGA</a>  |  Field-Programmable Gate Array, an integrated circuit designed to be configured by a customer or a designer after manufacturing.  |  [Wikipedia](https://en.wikipedia.org/wiki/Field-programmable_gate_array)  |
|  <a name="Verilog">Verilog</a>  |  A hardware description language used to model electronic systems.  |  [Wikipedia](https://en.wikipedia.org/wiki/Verilog)  |
|  <a name="VGA">VGA</a>  |  Video Graphics Array, a display standard for PC computers.  |  [Wikipedia](https://en.wikipedia.org/wiki/Video_Graphics_Array)  |
|  <a name="LED">LED</a>  |  Light-Emitting Diode, a semiconductor light source.  |  [Wikipedia](https://en.wikipedia.org/wiki/Light-emitting_diode)  |
|  <a name="7-Segment-Display">7-Segment Display</a>  |  A form of electronic display device for displaying decimal numerals.  |  [Wikipedia](https://en.wikipedia.org/wiki/Seven-segment_display)  |
|  <a name="Game-State">Game State</a>  |  The current state of the game, including the position of the player, obstacles, and other game elements.  |  [Wikipedia](https://en.wikipedia.org/wiki/Game_state)  |
|  <a name="Scoring-System">Scoring System</a>  |  A mechanism for tracking and rewarding player performance in a game.  |  [Wikipedia](https://en.wikipedia.org/wiki/Scoring_system)  |
|  <a name="Level-Progression">Level Progression</a>  |  The advancement of the player through different stages of the game, typically increasing in difficulty.  |  [Wikipedia](https://en.wikipedia.org/wiki/Level_(video_gaming))  |
|  <a name="Car-Control-Behavior">Car Control Behavior</a>  |  The movement and interaction of cars in the game, including speed, direction, and collision detection.  |  [Wikipedia](https://en.wikipedia.org/wiki/Car_behavior)  |

