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
  - [6. Clock Signal](#6-clock-signal)
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
The project involves the development of a hardware-accelerated version of the [Frogger](#Frogger) arcade game on an [FPGA](#FPGA) using [Verilog](#Verilog). The game will run on a [VGA](#VGA) display and be controlled through integrated board switches, with a focus on optimizing performance and resource usage on the FPGA.
#### 2. Context
This project leverages FPGA technology to implement the Frogger game in hardware, aiming to exploit the parallelism and real-time capabilities of the platform. The use of Verilog allows for direct control of the FPGA's resources, ensuring precise timing and efficient logic design.

#### 3. Goals and Objectives
**Mandatory Requirements**

- FPGA-based Frogger game using Verilog with VGA output.
- VGA output with correct signal synchronization and real-time gameplay.
- Functional input via FPGA switches with reliable [debouncing](#debouncing).
- Display a 1x1 frog [sprite](#sprite) and at least one car on screen at all times.
- Game logic includes frog movement, car collision detection, and level progression.
- Efficient memory and clock management.

**Nice-to-Have Objectives**
- Detailed, colored frog sprite and up to 16 cars with varying speeds.
- Multiple levels (at least 8) with increasing difficulty.
- Visual feedback via [7-Segment Displays](#7-Segment-Displays).
- Performance optimization and [maintanibility](#maintanibility) for future features.

#### 4. Assumptions

- The development board has sufficient resources to implement the game logic and display requirements.
- The VGA display is compatible with the signal output from the FPGA.
- The input switches on the FPGA board are fully functional and responsive for user control.
- Power supply to the FPGA will be stable and sufficient for the game's hardware demands.
- No external systems or [APIs](#APIs) will be required to complete the project.

---

### III. Hardware

#### 1. Development Board
<table>
      <tr>
                  <td><b>Board Name</b></td>
                  <td colspan="2" align="center"><a href="https://nandland.com/the-go-board/">The Go Board</a></td>   </tr>
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
                  <td><b>Educational Purpose</b></td>
                  <td colspan="2">Designed for easy experimentation and prototyping without the need for additional <a href="#breadboards">breadboards</a> or soldering.</td>
       </tr>
</table>

<p align="center">
            <img src="./img/goboard.jpg" alt="Go Board" style="border: 6px solid black; width: 300px; height: auto;">
</p>

#### 2. Input Controls
<table>
       <tr>
                         <td><b>Number of Switches:</td>
                         <td colspan="6">4 (tactile pushbutton switches)</td>
       </tr>
       <tr>
                         <td rowspan="2"><b>Functionality:</td>
                         <td rowspan="2"colspan="2">Allow the User to move the Frog in four directions :</td>
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

<p align="center">
            <img src="./img/switches.jpg" alt="Switches" style="border: 6px solid black; width: 300px; height: auto;">
</p>

#### 3. Light Emitting Diodes (LEDs)
The code does not contain any references or functionalities related to the use of [LEDs](#LEDs) because we have chosen not to incorporate LED indicators into the game design, focusing instead on other visual outputs such as the VGA display.

<p align="center">
            <img src="./img/LEDs.jpg" alt="LEDs" style="border: 6px solid black; width: 300px; height: auto;">
</p>

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

<p align="center">
            <img src="./img/7_segment.jpg" alt="7-Segment Display" style="border: 6px solid black; width: 300px; height: auto;">
</p>

#### 5. VGA Connector
<table>
       <tr>
                  <td><b>VGA Output</b></td>
                  <td>Connector Type:</td>
                  <td><a href="#15-pin-d-sub">15-pin D-sub</a> connector (standard VGA)</td>
                  </tr>
       <tr>
                         <td><b>Supported Resolutions:</td>
                         <td colspan="2"><sin>640x480</sin>, 800x600, 1024x768, 1280x1024</td>
       </tr>
       <tr>
                         <td rowspan="2"><b>Functionality:</td>
                         <td colspan="2">Provides video output for displaying game graphics and user interface.</td>
       </tr>
                  <tr>
                         <td colspan="2">Access to horizontal and vertical sync signals for display timing.</td>
                  </tr>
</table>

<p align="center">
      <img src="./img/VGA1.jpg" alt="VGA Connector2" style="border: 6px solid black; width: 300px; height: auto; display: inline-block;">
      <img src="./img/VGA2.jpg" alt="VGA Connector1" style="border: 6px solid black; width: 300px; height: 300px; display: inline-block;">
</p>


#### 6. Clock Signal
<table>
      <tr>
                  <td><b>Frequency:</td>
                  <td>50 MHz</td>
      </tr>
      <tr>
                  <td><b>Functionality:</td>
                  <td colspan="2">Synchronizes game logic, display rendering, and user input processing.</td>
      </tr>
      <tr>
                  <td><b>Clock Division:</b></td>
                  <td colspan="2">Certain modules require slower clock signals to function correctly. <a href="#clock-division">Clock division</a> is used to generate these lower-frequency clocks, ensuring that these modules operate at an appropriate rate. For example, the car movement in the game is controlled using a slower clock to be seen by the human eyes and to make appropriate movements.</td>
      </tr>
</table>

---
### IV. Software Architecture

#### 1. Overview of Software Modules

<table>
      <tr>
            <th><b>Module Name</td>
            <th><b>Description</td>
      </tr>
      <tr>
            <td align="center"><pre><b>main.v</b></pre></td>
            <td>This is the entry point of the game, responsible for initializing and orchestrating the other modules. It manages the <a href="#6-clock-management">clock signals</a> and ensures proper sequencing of game functions.</td>
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
            <td align="center"><pre><b>game_controller.v</b></pre></td>
            <td>Manages the <a href="#game-state">game state</a>, including start, play, game over, and level progression. This module ensures the game follows the intended flow, including tracking the player’s progress and adjusting difficulty.</td>
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
                  <td rowspan="5" align="center"><b>VGA Output</b></td>
                  <td><code>o_VGA_HSync</code></td>
                  <td>VGA <a href="#horizontal-sync">horizontal sync</a> output</td>     </tr>
            <tr>
                  <td><code>o_VGA_VSync</code></td>
                  <td>VGA <a href="#vertical-sync">vertical sync</a> output</td>     </tr>
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
In the Frogger FPGA project, memory is managed to optimize the limited resources of the FPGA. Key data such as the frog’s position, car positions, and game state are stored in registers for fast access. Larger data sets, like sprite information and display buffers, are stored in Block RAM (BRAM).

Memory optimization strategies include:

- [Registers](#registers) for small, frequently updated variables.
- [BRAM](#BRAM) for larger assets like sprites and backgrounds. The main module can utilize BRAM to store the game layout or configuration data for quick retrieval. 
```verilog
// Example for BRAM implementation
wire [7:0] bram_data_out;
reg [7:0] bram_data_in;
reg [11:0] bram_addr;
reg bram_we;
```
- Look-Up Tables ([LUTs](#LUTs)) to store fixed graphical elements.

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
 >    if (counter == TARGET) begin // Example for every 10 clock cycles for slower car movement
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
Synchronizing the frame rate with the VGA display’s refresh rate ensures that the graphics are updated smoothly, preventing issues like screen tearing. The system is designed to match the frame update frequency with the VGA display's 50Hz refresh rate.

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

> <ins>Example (from player.v):</ins>  
> The player's movement is controlled using switches for up, down, left, and right. The player.v module handles debouncing for smooth input and updates the player's x and y coordinates based on directional inputs:
>
>```verilog
>always @(posedge i_Clk) begin
>    if (w_player_up == 1'b0 && r_player_up == 1'b1) begin
>        if (o_player_y > 1) begin
>            o_player_y <= o_player_y - 1;
>        end
>    end else if (w_player_down == 1'b0 && r_player_down == 1'b1) begin
>        if (o_player_y < 15) begin
>            o_player_y <= o_player_y + 1;
>        end
>    end
>    // Similar logic for left and right...
>end
>```

---
- **Cars**: Vehicles of varying speeds move horizontally across the screen, posing obstacles for the frog.

> <ins>Example (from car.v):</ins>  
> The car.v module simulates the movement of cars across the screen, resetting their position after they pass the right side of the display:
>
>```verilog
>// moving the cars and resetting their position
>always @(posedge i_Clk) begin
>    if (clock_tick < 12500000) begin
>        clock_tick <= clock_tick + 1;
>    end else begin
>        clock_tick <= 0;
>        if (o_car_x < 20) begin
>            o_car_x <= o_car_x + 1;
>        end else begin
>            o_car_x <= 0;
>        end
>    end
>end
>```

---
- **Collision Detection**: If the frog collides with a car, the game ends in a "Game Over" state.

> <ins>Example (from main.v):</ins>  
> Collision detection checks whether the player's position matches that of any car:
>
>```verilog
>if ((car_x == player_x && car_y == player_y)) begin
>    o_reset <= 1; // Reset condition upon collision
>end
>```

---
- **Goal**: Each level has a designated goal area that the frog must reach to progress.

> <ins>Example (from main.v):</ins>  
> The game keeps track of the current level and increments it when the frog reaches the top of the screen:
>
>```verilog
>if (player_y == 1) begin // if the player reaches the top
>    if (level == 99) begin
>        level <= 0;
>    end else begin
>        level <= level + 1;
>    end
>end
>```

---
#### 2. User Input Handling

User input is critical to navigating the game world. The system will respond to:

- **Directional Movement**: The FPGA switches will control the frog’s movements in four directions—up, down, left, and right.

> <ins>Example (from player.v):</ins>  
> The player uses switches for directional control, with debounced inputs processed to ensure accurate movements:
>
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

> <ins>Example (from player.v):</ins>  
> The reset functionality resets the player's position and the game state:
>
>```verilog
>always @(posedge i_Clk) begin
>    // Reset game when all switches are pressed
>    if (i_Switch_1 && i_Switch_2 && i_Switch_3 && i_Switch_4) begin
>        i_reset <= 1; // Activate reset
>    end else begin
>        i_reset <= 0; // Deactivate reset
>    end 
>    // Reset level based on reset signal
>    if (i_reset) begin
>        level <= 0; // Reset level on active reset
>    end else if (/* condition for level progression */) begin
>        level <= (level == 99) ? 0 : level + 1; // Increment level or wrap around
>    end
>end
>```

---
- **Debounced Inputs**: Debouncing ensures reliable control, preventing unintended multiple actions from a single switch press.

> <ins>Example (from debounce_switch.v):</ins>  
> The debounce logic stabilizes the input switch state before passing it to the player control module:
>
>```verilog
>always @(posedge i_Clk) begin
>    if (i_Switch !== r_State && r_Count < c_DEBOUNCE_LIMIT)
>        r_Count <= r_Count + 1;
>    // Switch stabilization logic...
>end
>assign o_Switch = r_State;
>```

---

#### 3. Display Requirements

To enhance the gaming experience, the visual display on the VGA screen should include:

- **Frog Sprite**: A clearly defined, smoothly frog that the player controls.

> <ins>Example (from main.v):</ins>  
> The output logic for the player sprite indicates its position:
>
>```verilog
>if (cell_x == player_x && cell_y == player_y) begin
>    // Color the player
>    o_VGA_Red = 3'b000; o_VGA_Grn = 3'b000; o_VGA_Blu = 3'b111; // Blue for player
>end
>```

---
- **Moving Cars**: Vehicles of varying speeds and sizes that traverse the screen, presenting obstacles.

> <ins>Example (from car.v):</ins>  
> The car module controls the horizontal velocity of cars based on a clock:
>
>```verilog
>// Car modules instantiation
>wire [4:0] car1_x;
>wire [3:0] car1_y = 3;
>car #(.CAR_START(1), .CAR_SPEED(1)) car1_module (
>    .i_Clk(i_Clk),
>    .o_car_x(car1_x),
>);
>
>wire [4:0] car2_x;
>wire [3:0] car2_y = 4;
>car #(.CAR_START(15), .CAR_SPEED(2)) car2_module (
>    .i_Clk(i_Clk),
>    .o_car_x(car2_x),
>);
>```

---
- **Background Elements**: A thematic background (road, grass, etc.) that sets the game environment.

> <ins>Example (from main.v):</ins>
>```verilog
> always @(posedge i_Clk) begin
>    // VGA refresh logic to handle color output
>    if (h_active && v_active) begin
>        // Road background logic
>        if ((cell_y >= road_top_start && cell_y < road_top_end) || (cell_y >= road_bottom_start && cell_y < road_bottom_end)) begin
>            o_VGA_Red <= 3'b001;      // Set Road Color (Grey)
>            o_VGA_Grn <= 3'b001;
>            o_VGA_Blu <= 3'b001;
>        end
>        // Grass background logic
>        else if ((cell_y >= grass_arrival_start && cell_y <= grass_arrival_end) || 
>                 (cell_y >= grass_middle_start && cell_y <= grass_middle_end) || 
>                 (cell_y >= grass_spawn_start && cell_y <= grass_spawn_end)) begin
>            o_VGA_Red <= 3'b000;      // Set Grass Color (Green)
>            o_VGA_Grn <= 3'b101;
>            o_VGA_Blu <= 3'b001;
>        end
>        // Background clearing
>        else begin
>            o_VGA_Red <= 3'b000;
>            o_VGA_Grn <= 3'b000;
>            o_VGA_Blu <= 3'b000;      // Set Background to Black
>        end
>    end
>end
>```

---
- **7-Segment Display**: Displays the current level and other important game information.

> <ins>Example (from seven_segments.v):</ins>  
> The 7-segment display updates to show the current level:
>
>```verilog
>module seven_segments (
>    input [6:0] counter, // level counter
>    output reg [6:0] o_Segment1,
>    output reg [6:0] o_Segment2
>);
>
>always @(*) begin
>    case (counter / 10) // Display for first 7-segment display
>        1: o_Segment1 = 7'b1111001; // 1
>        2: o_Segment1 = 7'b0100100; // 2
>        3: o_Segment1 = 7'b0110000; // 3
>        4: o_Segment1 = 7'b0011001; // 4
>        5: o_Segment1 = 7'b0010010; // 5
>        6: o_Segment1 = 7'b0000010; // 6
>        7: o_Segment1 = 7'b1111000; // 7
>        8: o_Segment1 = 7'b0000000; // 8
>        9: o_Segment1 = 7'b0010000; // 9
>        default: o_Segment1 = 7'b1000000; // 0
>    endcase
>
>    case (counter % 10) // Display for second 7-segment display
>        1: o_Segment2 = 7'b1111001; // 1
>        2: o_Segment2 = 7'b0100100; // 2
>        3: o_Segment2 = 7'b0110000; // 3
>        4: o_Segment2 = 7'b0011001; // 4
>        5: o_Segment2 = 7'b0010010; // 5
>        6: o_Segment2 = 7'b0000010; // 6
>        7: o_Segment2 = 7'b1111000; // 7
>        8: o_Segment2 = 7'b0000000; // 8
>        9: o_Segment2 = 7'b0010000; // 9
>        default: o_Segment2 = 7'b1000000; // 0
>    endcase
>end
>
>endmodule
>```

---
#### 4. Game State Management

The game will handle multiple states, ensuring smooth transitions and clear objectives at all times:

- **Start Screen**: There won’t be a dedicated start screen as we decide to focus on the main requirement of the game.

- **Play State**: The core gameplay where the player controls the frog, attempting to cross the screen without hitting a car.

- **Game Over State**: If a collision occurs, the game ends with a game over screen.

> <ins>Example (from main.v):</ins>  
> Collision detection triggers the game over state:
>
>```verilog
>// Game states
>typedef enum logic [1:0] {
>    STATE_PLAY,
>    STATE_GAME_OVER
>} game_state_t;
>
>game_state_t game_state = STATE_PLAY;
>
>always @(posedge i_Clk) begin
>    case (game_state)
>        STATE_PLAY: begin
>            if (collision_detected) begin
>                game_state <= STATE_GAME_OVER;
>            end else if (player_y == 1) begin
>                if (level == 99) begin
>                    level <= 0;
>                end else begin
>                    level <= level + 1;
>                end
>                i_reset <= 1;
>            end else begin
>                i_reset <= 0;
>            end
>        end
>        STATE_GAME_OVER: begin
>            // Logic to display game over message and stop the game
>            // Reset the game state and level if needed
>        end
>   endcase
>end
>```

---
#### 5. Level Progression

Level progression is a key part of keeping players engaged and challenged. The game will feature:

- **Level Progression**: With each completed level, difficulty ramps up—cars move faster, lanes get narrower, and new obstacles appear.

> <ins>Example (from main.v):</ins>
> The game manages level progression, adjusting car speeds and other parameters based on the current level:
>```verilog
>always @(posedge i_Clk) begin
>    if (player_y == 1) begin
>        if (level == 99) begin //check for max level
>            level <= 0;
>        end else begin
>            level <= level + 1; // Increment level
>        end
>    end else if (o_reset == 1) begin
>        level <= 0;
>    end
>
>    // Adjust car parameters based on the current level
>    if (level > 10) begin
>        // Add more cars or increase speed
>        car1_module.CAR_SPEED <= 2;
>        car2_module.CAR_SPEED <= 3;
>        // more car instances
>    end else if (level > 20) begin
>        // Further increase difficulty
>        car1_module.CAR_SPEED <= 3;
>        car2_module.CAR_SPEED <= 4;
>        // more car instances 
>    end
>end
>```

---
- **Level Information**: The 7-segment display will clearly indicate the current level, helping players track their progress.

> <ins>Example (from seven_segments.v):</ins>  
> The display shows level information as part of the score:
>
>```verilog
>o_Segment1 = level; // Display current level
>```

---

#### 6. Car Control Behavior

The cars are more than just obstacles; they introduce variability and challenge. Their behavior includes:

- **Horizontal Movement**: Cars move steadily across the screen from either left to right or right to left.

> <ins>Example (from car.v):</ins>  
> Cars reset their position after traveling a defined distance:
>
>```verilog
>if (o_car_x < 20) begin
>    o_car_x <= o_car_x + 1; // Move car horizontally
>end else begin
>    o_car_x <= 0; // Reset position
>end
>```

---
- **Lane Occupancy**: Only one car per lane at any given time, avoiding lane overcrowding.

> <ins>Example (from main.v):</ins>
>```verilog
> // Lane occupancy logic
>reg [3:0] lanes [0:9]; // Array to keep track of lane occupancy
>
>always @(posedge i_Clk) begin
>    // Reset lane occupancy
>    integer j;
>    for (j = 0; j < 10; j = j + 1) begin
>        lanes[j] <= 0;
>    end
>
>    // Update lane occupancy based on car positions
>    lanes[car1_y] <= 1;
>    lanes[car2_y] <= 1;
>    for (i = 3; i <= 10; i = i + 1) begin
>        lanes[car_gen[i].car_y] <= 1;
>    end
>end
>```
---

### VI. Risks and Mitigation Strategies

#### 1. Identified Risks  

- **Hardware Limitations**: The FPGA development board may have finite resources, such as the number of logic cells and RAM available. These limitations could hinder the ability to implement all desired game features, such as advanced graphics or complex gameplay mechanics. For example, if too much logic is required for player controls and graphics, the overall system may become unresponsive.

- **Timing Issues**: Ensuring smooth performance without lag can be particularly challenging due to the strict timing requirements of the VGA output and the handling of user inputs. If the timing of these signals is off, it can lead to visual artifacts or delayed responses, greatly affecting gameplay.

- **Input Debouncing**: The physical switches used for player input can experience bouncing, causing multiple triggers from a single press. If this bouncing is not controlled, the player may experience unintended movements during gameplay. This can lead to frustration and affect the overall gaming experience.

- **Collision Detection Challenges**: Detecting collisions accurately between the frog and the moving cars or other obstacles can be difficult. If this aspect is not well-implemented, players might find themselves colliding inconsistently, which can frustrate players and make the game feel unfair or broken.

- **Integration Issues**: Integrating various modules (e.g., player controls, cars, road layout) may lead to unexpected interactions and bugs. For instance, if the collision detection relies on player position but the position is not calculated correctly due to integration errors, this could lead to game malfunction.

- **Resource Overuse**: Some game features may consume more computational resources than anticipated, resulting in performance drops. For example, if too many simultaneous vehicles are being processed, it may slow down the game due to inadequate computational resources.

---

#### 2. Mitigation Strategies  

- **Resource Management**: Regularly monitor and evaluate resource usage throughout development. This includes profiling your logic and memory consumption to ensure that you stay within the limits of the FPGA. If resource constraints arise, consider simplifying graphics or features. Example: If memory utilization approaches max capacity, implementing sprite sheets for characters could be a solution to lower memory demands.

- **Timing Analysis**: Conduct a thorough examination of the timing requirements and refine your design to ensure smooth performance. This can include calculating the required delays for different signals and ensuring they meet the necessary timing constraints. Utilize tools like Logicly for manual timing checks to verify that your signal outputs are correct.

- **Robust Debouncing Logic**: Develop an effective debouncing mechanism to filter out noise from switch inputs, ensuring that only stable signals are registered for game controls. 
>For example:
>  ```verilog
>  always @(posedge i_Clk) begin
>      if (i_Switch !== r_State) begin
>          r_Count <= r_Count + 1; // Increment count for bouncing
>      end else if (r_Count > DEBOUNCE_LIMIT) begin
>          r_State <= i_Switch; // Update state only on stable signal
>          r_Count <= 0; // Reset count
>      end
>  end
>  ```
  
- **Comprehensive Collision Testing**: Create a detailed collision detection algorithm that is tested against various scenarios. Extensive testing will ensure that the game properly detects all collision cases, diminishing player frustration. For example, if a player is at the edge of a car sprite, your algorithm should still recognize their position accurately.

- **Iterative Testing**: Instead of focusing on complex debugging routines in Verilog, we have chosen to streamline our process by utilizing direct monitoring to test the code. This approach allows us to observe the performance and functionality of the game as it runs on the FPGA, enabling quicker validation and troubleshooting without getting bogged down in debug complexities.

- **Module Integration Testing**: Before final implementation, conduct robust tests of how all modules work together. Identify potential conflicts or unexpected behaviors. Creating testbenches for each module will validate interactions and help isolate issues early.

- **Resource Monitoring**: Continuously monitor the FPGA to ensure it is within its resource capacity. If issues are detected, you can identify features that are consuming excess resources and either modify or remove them for optimal performance.

---

### VII. Glossary

|  Terms  |  Definitions  |  Source  |
|:---:|:---|:---:|
|  <a name="Frogger">Frogger</a>  |  A classic arcade game where the player navigates a frog across a busy road and river.  |  [Wikipedia](https://en.wikipedia.org/wiki/Frogger)  |
|  <a name="FPGA">FPGA</a>  |  Field-Programmable Gate Array, an integrated circuit designed to be configured by a customer or a designer after manufacturing.  |  [ARM](https://www.arm.com/glossary/fpga)  |
|  <a name="Verilog">Verilog</a>  |  A hardware description language used to model electronic systems.  |  [Nandland](https://nandland.com/introduction-to-verilog-for-beginners-with-code-examples/)  |
|  <a name="VGA">VGA</a>  |  Video Graphics Array, a display standard for PC computers.  |  [Wikipedia](https://en.wikipedia.org/wiki/VGA_connector)  |
|  <a name="Debouncing">Debouncing</a>  |  The process of removing noise or bounce from a signal, typically used for switch inputs in digital systems.  |  [Techtarget](https://www.techtarget.com/whatis/definition/debouncing)  |
|  <a name="Sprite">Sprite</a>  |  A two-dimensional image or animation that is integrated into a larger scene.  |  [Wikipedia](https://en.wikipedia.org/wiki/Sprite_(computer_graphics))  |
|  <a name="7-Segment-Displays">7-Segment Displays</a>  |  A form of electronic display device for displaying decimal numerals.  |  [Wikipedia](https://en.wikipedia.org/wiki/Seven-segment_display)  |
|  <a name="maintainability">Maintainability</a>  |  The ease with which a software system can be maintained or modified.  |  [Sealights](https://www.sealights.io/software-quality/software-maintainability-what-it-means-to-build-maintainable-software/)  |
|  <a name="APIs">APIs</a>  |  Application Programming Interfaces, a set of rules and protocols for building and interacting with software applications.  |  [Mulesoft](https://www.mulesoft.com/resources/api/what-is-an-api)  |
|  <a name="breadboards">breadboards</a>  |  A construction base for prototyping of electronics.  |  [Makeuseof](https://www.makeuseof.com/tag/what-is-breadboard/)  |
|  <a name="LEDs">LEDs</a>  |  Light-Emitting Diode, a semiconductor light source.  |  [Wikipedia](https://en.wikipedia.org/wiki/Light-emitting_diode)  |
|  <a name="15-pin-d-sub">15-pin D-sub</a>  |  A type of electrical connector commonly used for VGA connections.  |  [EDAC](https://edac.net/products/db15-connector/168)  |
|  <a name="Clock-division">Clock division</a>  |  A circuit that divides the frequency of an input clock signal to produce a lower-frequency output.  |  [Wikipedia](https://en.wikipedia.org/wiki/Clock_divider)  |
|  <a name="Clock-signal">Clock signal</a>  |  A periodic signal used to synchronize the operation of digital circuits.  |  [ScienceDirect](https://www.sciencedirect.com/topics/engineering/clock-signal)  |
|  <a name="Game-State">Game State</a>  |  The current state of the game, including the position of the player, obstacles, and other game elements.  |  [Linkedin](https://www.linkedin.com/pulse/what-game-state-dave-eng-va1zf/)  |
|  <a name="horizontal-sync">Horizontal Sync</a>  |  A signal used in video systems to coordinate the refresh rate of the display.  |  [ScienceDirect](https://www.sciencedirect.com/topics/engineering/horizontal-sync)  |
|  <a name="vertical-sync">Vertical Sync</a>  |  A signal used in video systems to indicate the end of a frame and the beginning of a new one.  |  [ScienceDirect](https://www.sciencedirect.com/topics/engineering/horizontal-sync)  |
|  <a name="Registers">Registers</a>  |  Small, fast memory elements used to store data within digital circuits.  |  [TutorialsPoint](https://www.tutorialspoint.com/what-are-computer-registers-in-computer-architecture)  |
|  <a name="BRAM">BRAM</a>  |  Block RAM, a type of memory available in FPGAs that can be used for storing data.  |  [VHDLwhiz](https://vhdlwhiz.com/terminology/block-ram/)  |
|  <a name="LUTs">LUTs</a>  |  Look-Up Table, a type of memory used in FPGAs to implement logic functions.  |  [FPGAinsights](https://fpgainsights.com/fpga/fpga-lut/)  |