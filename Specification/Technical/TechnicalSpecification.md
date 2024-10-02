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
  - [2. Lattice ICE40](#2-lattice-ice40)
  - [3. Light Emitting Diodes (LEDs)](#3-light-emitting-diodes-leds)
  - [4. 7-Segment Display](#4-7-segment-display)
  - [5. VGA Connector](#5-vga-connector)
  - [6. Swictches](#6-swictches)
  - [7. PMOD Connector](#7-pmod-connector)
  - [8. Other Components](#8-other-components)
- [IV. Software Architecture](#iv-software-architecture)
  - [1. Overview of Software Modules](#1-overview-of-software-modules)
  - [2. Module Interactions](#2-module-interactions)
  - [3. Inputs and Outputs Mapping](#3-inputs-and-outputs-mapping)
  - [4. Data Structures](#4-data-structures)
  - [5. Memory Management](#5-memory-management)
  - [6. Clock Management](#6-clock-management)
- [V. Functional Requirements](#v-functional-requirements)
  - [1. Game Mechanics](#1-game-mechanics)
  - [2. User Input Handling](#2-user-input-handling)
  - [3. Display Requirements](#3-display-requirements)
  - [4. Game State Management](#4-game-state-management)
  - [5. Scoring System](#5-scoring-system)
  - [6. Level Progression](#6-level-progression)
  - [7. Car Control Behavior](#7-car-control-behavior)
- [VI. Testing and Validation](#vi-testing-and-validation)
  - [1. Test Plan](#1-test-plan)
  - [2. Performance Testing](#2-performance-testing)
  - [3. Validation Criteria](#3-validation-criteria)
  - [4. Error Handling](#4-error-handling)
- [VII. Deployment Plan](#vii-deployment-plan)
  - [1. Rollout Strategy](#1-rollout-strategy)
  - [2. Maintenance Plan](#2-maintenance-plan)
- [VIII. Risks and Mitigation Strategies](#viii-risks-and-mitigation-strategies)
  - [1. Identified Risks](#1-identified-risks)
  - [2. Mitigation Strategies](#2-mitigation-strategies)
- [IX. Work Estimates and Timelines](#ix-work-estimates-and-timelines)
  - [1. Resource Needs](#1-resource-needs)
  - [2. Prioritization](#2-prioritization)
  - [3. Milestones](#3-milestones)
- [X. Glossary](#x-glossary)

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
- Scoring system and enhanced visual feedback via LEDs.
- Performance optimization and scalability for future features.

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

#### 2. Lattice ICE40
<table>
  <tr>
      <td><b>Model :</td>
      <td>Lattice ICE40 1K FPGA</td> 
  </tr>
  <tr>
      <td><b>Logic Capacity:</td>
      <td> 1,280 Logic Cells (usable as Look-Up Tables)</td>
  </tr>
  <tr>
      <td><b>Open Source Toolchain:</td>
      <td>IceStorm (supports synthesis from Verilog)</td>
   </tr>
   <tr>
      <td><b>Supported Operating Systems:</td>
      <td>Windows, Linux</td>
   </tr>
   <tr>
      <td><b>Maximum Operating Frequency:</td>
      <td>Up to 100 MHz</td>
</table>

#### 3. Light Emitting Diodes (LEDs)
<table>
   <tr>
         <td><b>Number of LEDs :</td>
         <td colspan="2">4</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Specififcations:</td>
         <td>Typical forward voltage:</td>
         <td> 20 mA</td>
   </tr>
      <td>Typical forward current:</td>
      <td> 2.0 - 3.2 V</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Functionality:</td>
         <td colspan="2">Provides visual feedback for board status and diagnostic information.</td>
    </tr>
    <tr>
      <td colspan="2">Can be controlled via user-defined logic to indicate states, errors, or user-defined outputs.</td>
    </tr>
</table>

#### 4. 7-Segment Display
<table>
   <tr>
         <td><b>Number of Displays:</td>
         <td>2</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Specififcations:</td>
         <td>Common cathode configuration</td>
   </tr>
      <td>Each display typically consists of 8 segments plus a dot.</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Functionality:</td>
         <td>Displays numeric and alphanumeric information.</td>
    </tr>
    <tr>
      <td>Directly controlled through FPGA logic for dynamic output.</td>
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
         <td colspan="2">640x480, 800x600, 1024x768, 1280x1024</td>
   </tr>
   <tr>
         <td><b>Supported Refresh Rates:</td>
         <td colspan="2">60 Hz, 75 Hz, 85 Hz</td>
   </tr>
   <!-- <tr>
         <td><b>Supported Color Depth:</td>
         <td colspan="2">8-bit (256 colors)</td>
   </tr> -->
   <tr>
         <td><b>Functionality:</td>
         <td colspan="2">Provides video output for displaying game graphics and user interface.</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Applications:</td>
         <td colspan="2">Ideal for graphical projects, such as simple games (e.g., Pong).</td>
      </tr>
      <tr>
         <td colspan="2">Access to horizontal and vertical sync signals for display timing.</td>
      </tr>
</table>



#### 6. Swictches
<table>
   <tr>
         <td><b>Number of Switches:</td>
         <td colspan="2">4 (tactile pushbutton swicthes)</td>
   </tr>
   <tr>
         <td><b>Functionality:</td>
         <td colspan="2">Configured to allow user input for projects (e.g., start/stop signals).</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Electrical Characteristics:</td>
         <td>Typical voltage:</td>
         <td>5V (when in use).</td>
   </tr>
         <td>Short circuit current:</td>
         <td>20 mA (max).</td>
   </tr>
</table>

#### 7. PMOD Connector
<table>
   <tr>
         <td><b>Interface Type:</td>
         <td>PMOD (Peripheral Module) connector</td>
   </tr>
   <tr>
         <td><b>Pin Configuration</td>
         <td>2x6 header (12 pins)</td>
   </tr>
   <tr>
         <td rowspan="2"><b>Functionality:</td>
         <td>Expands board capabilities with various PMOD Peripheral Modules.</td>
         <tr>
         <td>Supports protocols like I2C and SPI for interfacing with sensors, displays, and other components.</td>
      </tr>
   <tr>
         <td><b>Available Modules:</td>
         <td>Extensive library of PMOD modules for additional functionalities (e.g., motor drivers, sensors).</td>
      </tr>
</table>

#### 8. Other Components
  <table>
   <tr>
         <td rowspan="3"><b>Oscillator:</td>
         <td>Type:</td>
         <td>25 MHz crystal oscillator</td>
   </tr>
   <tr>
         <td>Usage:</td>
         <td>Non-volatile storage used for booting FPGA configurations.</td>
   </tr>
   <tr>
         <td>Interface:</td>
         <td>SPI for reading and writing configuration data.</td>
</table>

<table>
   <tr>
         <td rowspan="2"><b>Flash Memory:</td>
         <td>Size:</td>
         <td>1 Mb (megabit) Flash memory</td>
   </tr>
   <tr>
         <td>Usage:</td>
         <td>Stores configuration data and program code for the FPGA.</td>
   </tr>
   </table>

---

### IV. Software Architecture

#### 1. Overview of Software Modules

#### 2. Module Interactions

#### 3. Inputs and Outputs Mapping

#### 4. Data Structures

#### 5. Memory Management

#### 6. Clock Management

---

### V. Functional Requirements

#### 1. Game Mechanics

#### 2. User Input Handling

#### 3. Display Requirements

#### 4. Game State Management

#### 5. Scoring System

#### 6. Level Progression

#### 7. Car Control Behavior


---

### VI. Testing and Validation

#### 1. Test Plan

#### 2. Performance Testing

#### 3. Validation Criteria

#### 4. Error Handling


---

### VII. Deployment Plan

#### 1. Rollout Strategy

#### 2. Maintenance Plan

---

### VIII. Risks and Mitigation Strategies

#### 1. Identified Risks  

#### 2. Mitigation Strategies

---

### IX. Work Estimates and Timelines

#### 1. Resource Needs

#### 2. Prioritization

#### 3. Milestones


---

### X. Glossary

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

