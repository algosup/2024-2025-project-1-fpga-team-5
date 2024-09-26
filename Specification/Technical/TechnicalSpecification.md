<!-- PROJECT LOGO -->
<br />
<div alig="center">
    <h1 align="center"> Technical Specification</h1>
    <p align="center">
        <strong> Frogger in FPGA - Team 5's project</strong>
        <br />

    </p>
</div>

</br>

<!-- TABLE OF CONTENTS -->

<details>
<summary>Table of Contents <summary>

- [I. Audience](#i-audience)
- [II. Introduction](#ii-introduction)
  - [1. Overview](#1-overview)
  - [2. Context](#2-context)
  - [3. Goals and Objectives](#3-goals-and-objectives)
  - [4. Out of Scope](#4-out-of-scope)
  - [5. Assumptions](#5-assumptions)
  - [6. Future Goals](#6-future-goals)
- [III. Hardware](#iii-hardware)
  - [1. Development Board](#1-development-board)
  - [2. Input Controls](#2-input-controls)
  - [3. LEDs for Game Visualization](#3-leds-for-game-visualization)
  - [4. 7-Segment Display](#4-7-segment-display)
- [IV. Software Architecture](#iv-software-architecture)
  - [1. Overview of Software Modules](#1-overview-of-software-modules)
  - [2. Module Interactions](#2-module-interactions)
  - [3. Inputs and Outputs Mapping](#3-inputs-and-outputs-mapping)
- [V. Functional Requirements](#v-functional-requirements)
  - [1. Game Mechanics](#1-game-mechanics)
  - [2. User Input Handling](#2-user-input-handling)
  - [3. Display Requirements](#3-display-requirements)
  - [4. Game State Management](#4-game-state-management)
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

This document is intended for:

- **Software Developers**: To understand the technical requirements and guide implementation and testing.
- **Project Managers**: To validate against functional specifications and client expectations.
- **QA Engineers**: To aid in preparing the testing plan and validation processes.
- **Hardware Engineers**: To ensure proper integration of hardware components.

---

### II. Introduction

#### 1. Overview
   The FPGA-based Frogger game is a project aimed at creating an interactive game where players guide a frog across a busy road using a hardware interface. This document outlines the technical specifications necessary for its development.

#### 2. Context
   This project utilizes FPGA technology to provide a tangible experience of the classic Frogger game. The design emphasizes understanding hardware-software interaction, especially in a game context.

#### 3. Goals and Objectives
   - Develop a fully functional Frogger game enabling real-time player interaction using physical controls.
   - Ensure visuals are represented via LED grids and feedback is provided through a 7-segment display.
   - Optimize performance to ensure responsiveness in gameplay.

#### 4. Out of Scope
   - Online multiplayer functionalities.
   - High-resolution graphics or sound effects not essential to gameplay.

#### 5. Assumptions
   - Required hardware components are available and functional.
   - Development team possesses the necessary skills in VHDL/Verilog programming and FPGA technologies.

#### 6. Future Goals
   - Implement additional levels or game mechanics to enhance replayability.
   - Explore possible upgrades to hardware components for improved functionality.

---

### III. Hardware

#### 1. Development Board
   - **Component**: Go Board FPGA development board.
   - **Specs**: Configurable GPIO pins, sufficient processing power for game logic.

#### 2. Input Controls
   - **Component**: Set of push buttons for frog movement.
   - **Usage**: Four directional buttons for up, down, left, and right movement.

#### 3. LEDs for Game Visualization
   - **Configuration**: 20 x 15 grid of LEDs to represent the game area and character states.
   - **Functionality**: LEDs light up based on frog and vehicle positions.

#### 4. 7-Segment Display
   - **Purpose**: Show current score and level to the player.

---

### IV. Software Architecture

#### 1. Overview of Software Modules
   - **Main Module**: Manages core game operations.
   - **Frog Module**: Controls frog movement and position logic.
   - **Car Module**: Generates and animates vehicles on the grid.
   - **Display Controller Module**: Manages the LED and 7-segment display outputs.
   - **Game Controller Module**: Manages game states like start, playing, and game over.

#### 2. Module Interactions
   - Define the data flow between modules (e.g., how movements update game state and affect the display).

#### 3. Inputs and Outputs Mapping
   - Specify button inputs corresponding to movements and clarify LED mappings for visual feedback.

---

### V. Functional Requirements

#### 1. Game Mechanics
   - Players must navigate the frog across lanes without colliding with moving cars.
   - Define win and loss conditions.

#### 2. User Input Handling
   - Document how inputs from buttons translate into frog movements on a grid.

#### 3. Display Requirements
   - The LED grid should represent game state, and the 7-segment display should indicate score.

#### 4. Game State Management
   - Define various states (e.g., Start, Playing, Game Over) and transitions.

---

### VI. Testing and Validation

#### 1. Test Plan
   - Outline how each module will be tested individually and in integration.

#### 2. Performance Testing
   - Measure response times for button presses and visual updates.

#### 3. Validation Criteria
   - Set success metrics for functionality (e.g., frog movement accuracy, game completion).

#### 4. Error Handling
   - Provide instructions for potential input errors and how the system should react.

---

### VII. Deployment Plan

#### 1. Rollout Strategy
   - Outline a phased approach to deployment, starting with development, followed by testing, and production phases.

#### 2. Maintenance Plan
   - Establish protocols for ongoing support and updates to the game after deployment.

---

### VIII. Risks and Mitigation Strategies

#### 1. Identified Risks  
   - Risks associated with hardware integration failures, and unexpected software bugs.

#### 2. Mitigation Strategies
   - Regular testing phases and comprehensive documentation to address challenges proactively.

---

### IX. Work Estimates and Timelines

#### 1. Resource Needs
   - Identify specific hardware and software tools required for development.

#### 2. Prioritization
   - Utilize MoSCoW method for prioritizing tasks (Must, Should, Could, Won't Have).

#### 3. Milestones
   - Define critical milestones for project tracking (e.g., completion of each game module).

---

### X. Glossary

- **FPGA**: Field-Programmable Gate Array, a programmable device used to implement custom hardware functions.
- **LED**: Light Emitting Diode, used in this project for visual output.
- **GPIO**: General Purpose Input/Output, pins on the FPGA used for interfacing with buttons and LEDs.

---

This more organized structure highlights essential components, processes, and expectations for the FPGA-based Frogger project. It pulls elements from your examples, ensuring clarity and making the document more user-friendly for diverse stakeholders involved in the project. If further iterations or changes are needed, please let me know!