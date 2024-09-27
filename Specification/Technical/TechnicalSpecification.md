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
  - [3. LEDs](#3-leds)
  - [4. 7-Segment Display](#4-7-segment-display)
  - [5. VGA Display](#5-vga-display)
  - [6. Power Consumption](#6-power-consumption)
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
The project involves the development of a hardware-accelerated version of the Frogger arcade game on an <a name="FPGA">FPGA</a> using Verilog. The game will run on a VGA display and be controlled through integrated board switches, with a focus on optimizing performance and resource usage on the FPGA.
#### 2. Context
This project leverages FPGA technology to implement the Frogger game in hardware, aiming to exploit the parallelism and real-time capabilities of the platform. The use of Verilog allows for direct control of the FPGA's resources, ensuring precise timing and efficient logic design.

#### 3. Goals and Objectives

#### 4. Assumptions


---

### III. Hardware

#### 1. Development Board

#### 2. Input Controls

#### 3. LEDs

#### 4. 7-Segment Display

#### 5. VGA Display

#### 6. Power Consumption


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
|  [FPGA](#FPGA)  |  Field-Programmable Gate Array, an integrated circuit designed to be configured by a customer or a designer after manufacturing.  |  [Wikipedia](https://en.wikipedia.org/wiki/Field-programmable_gate_array)  |
|  [Verilog](#Verilog)  |  A hardware description language used to model electronic systems.  |  [Wikipedia](https://en.wikipedia.org/wiki/Verilog)  |
|  [VGA](#VGA)  |  Video Graphics Array, a display standard for PC computers.  |  [Wikipedia](https://en.wikipedia.org/wiki/Video_Graphics_Array)  |
|  [LED](#LED)  |  Light-Emitting Diode, a semiconductor light source.  |  [Wikipedia](https://en.wikipedia.org/wiki/Light-emitting_diode)  |
|  [7-Segment Display](#7-Segment-Display)  |  A form of electronic display device for displaying decimal numerals.  |  [Wikipedia](https://en.wikipedia.org/wiki/Seven-segment_display)  |
|  [Game State](#Game-State)  |  The current state of the game, including the position of the player, obstacles, and other game elements.  |  [Wikipedia](https://en.wikipedia.org/wiki/Game_state)  |
|  [Scoring System](#Scoring-System)  |  A mechanism for tracking and rewarding player performance in a game.  |  [Wikipedia](https://en.wikipedia.org/wiki/Scoring_system)  |
|  [Level Progression](#Level-Progression)  |  The advancement of the player through different stages of the game, typically increasing in difficulty.  |  [Wikipedia](https://en.wikipedia.org/wiki/Level_(video_gaming))  |
|  [Car Control Behavior](#Car-Control-Behavior)  |  The movement and interaction of cars in the game, including speed, direction, and collision detection.  |  [Wikipedia](https://en.wikipedia.org/wiki/Car_behavior)  |

