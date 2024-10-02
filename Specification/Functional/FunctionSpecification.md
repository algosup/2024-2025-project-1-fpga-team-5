<!-- PROJECT LOGO -->
<br />
<div align="center">
  <h1 align="center">Functional Specification</h1>
  <p align="center">
    <strong>Frogger in FPGA - Team 5's project</strong>
    <br />
  
  </p>
</div>

</br>

**Written by:** [***Rémy CHARLES***](https://github.com/RemyCHARLES) </br>
**Created on:** *2024-09-23* </br>
**Last updated:** *2024-10-01*

<!-- TABLE OF CONTENTS -->

### Table of Contents

- [I. Introduction](#i-introduction)
  - [1. Glossary](#1-glossary)
  - [2. Project Overview](#2-project-overview)
    - [Project Definition](#project-definition)
      - [Vision](#vision)
      - [Objectives](#objectives)
      - [Scope](#scope)
      - [Target Audience](#target-audience)
      - [Deliverables](#deliverables)
  - [4. Project Layout](#4-project-layout)
    - [Project Team](#project-team)
    - [Stakeholders](#stakeholders)
    - [Team Roles](#team-roles)
- [II. Game Design](#ii-game-design)
  - [1. Game Concept](#1-game-concept)
    - [Storyline and Theme](#storyline-and-theme)
    - [Game Objectives](#game-objectives)
    - [Player Goals](#player-goals)
  - [2. Gameplay Mechanics](#2-gameplay-mechanics)
    - [Game Rules](#game-rules)
    - [Levels and Challenges](#levels-and-challenges)
    - [Scoring System](#scoring-system)
  - [3. User Interface Design](#3-user-interface-design)
    - [Sprites and Graphics](#sprites-and-graphics)
      - [**Frogger**](#frogger)
      - [**Death**](#death)
      - [**Cars**](#cars)
      - [**Trucks**](#trucks)
      - [**Logs**](#logs)
      - [**Turtles**](#turtles)
      - [**Background**](#background)
    - [Screen Layouts](#screen-layouts)
      - [**Main Menu**](#main-menu)
      - [**Game Screen**](#game-screen)
      - [**Game Over Screen**](#game-over-screen)
    - [Controls and Inputs](#controls-and-inputs)
    - [Feedback Mechanisms](#feedback-mechanisms)
  - [4. Visual Elements](#4-visual-elements)
    - [Color Palette](#color-palette)
    - [Animations](#animations)
- [III. User Experience](#iii-user-experience)

[III. **User Experience**](#iii-user-experience)
   1. [➣ Accessibility Features](#1-accessibility-features)
      - [Assistive Technologies](#assistive-technologies)
      - [Accessibility Standards](#accessibility-standards)
   2. [➣ User Engagement Strategies](#2-user-engagement-strategies)
      - [In-game Rewards](#in-game-rewards)
      - [User Progress Tracking](#user-progress-tracking)
   3. [➣ Adaptability to User Feedback](#3-adaptability-to-user-feedback)
      - [Feedback Channels](#feedback-channels)
      - [Iterative Design Updates](#iterative-design-updates)
   4. [➣ Device Compatibility](#4-device-compatibility)
      - [Supported Devices](#supported-devices)
      - [Cross-Platform Compatibility](#cross-platform-compatibility)
  
[IV. **Non-Functional Requirements**](#iv-non-functional-requirements)
   1. [➣ Performance](#1-performance)
      - [Responsiveness](#responsiveness)
      - [Resource Utilization](#resource-utilization)

[VI. **Future Enhancements**](#vi-future-enhancements)
   1. [➣ Feature Roadmap](#1-feature-roadmap)
   2. [➣ Potential Expansions](#2-potential-expansions)

[VII. **References**](#vii-references)

[VIII. **Revision History**](#viii-revision-history)


# I. Introduction

## 1. Glossary

| Term | Definition |
| --- | --- |
| Frogger | Frogger is a classic arcade game developed by Konami and released in 1981. The game involves guiding a frog across a busy road and river, avoiding obstacles and hazards along the way. |
| FPGA | Field-Programmable Gate Array `Definition still in progress...`|
| HDL | Hardware Description Language `Definition still in progress...`|
| Verilog | Verilog is a HDL used to model electronic systems. It is commonly used in the design and verification of digital circuits. |
| VGA | Video Graphics Array `Definition still in progress...`|

## 2. Project Overview

This project aims to recreate the classic arcade game **Frogger** on an FPGA platform. 

### Project Definition

#### Vision

The vision of this project is to provide an interactive and engaging gaming experience that pays homage to the classic arcade game Frogger. By leveraging the capabilities of FPGA technology, we aim to create a faithful recreation of the original game with enhanced graphics and gameplay features.

This game will be designed to appeal to both nostalgic players who remember the original Frogger and new players who are looking for a fun and challenging gaming experience.

#### Objectives

   - **Technology**: Implement the game logic and graphics using Verilog HDL on an FPGA platform.
   - **Gameplay**: Recreate the classic Frogger gameplay with enhanced graphics and additional features.

#### Scope

This project will be developped on a "[Go-Board](https://nandland.com/the-go-board/)" FPGA platform. Using Verilog HDL, we will implement the game logic, graphics, and user interface elements required to recreate the classic Frogger game.

#### Target Audience

The target audience for this project includes:
   - Fans of classic arcade games who are familiar with the original Frogger.
   - Players looking for a challenging and engaging gaming experience.
   - Students and hobbyists interested in FPGA development and game design.

#### Deliverables

The main deliverables is the source code of the game, supported by multiple version of this game and mockups of the design.

Other deliverables include:
   - Functional Specification Document
   - Technical Specification Document
   - User Manual
   - Test Plan and Test Cases
   - Management Plan & Weekly reports

## 4. Project Layout

### Project Team

| Name | Role | Contact (*Click*) |
| --- | --- | --- |
| Alexis LASSELIN | Project Manager | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/AlexisLasselin) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/alexis-lasselin-318649251/) |
| Rémy CHARLES | Program Manager | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/RemyCHARLES) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/r%C3%A9my-charles-2a8960232/) |
| Michel RIFF | Tech Lead | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/michelriff) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/michel-riff-693007293/) |
| Mathias GAGNEPAIN | Software Engineer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/mathiasgagnepain) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/mathias-gagnepain/) |
| Séréna BAVAROIS | Software Engineer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/NanaChocolat) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/s%C3%A9r%C3%A9na-bavarois/) |
| Camille GAYAT | Quality Assurance | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/camillegayat) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/camille-g-a89114293/) |
| Salaheddine NAMIR | Technical Writer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="30">](https://github.com/T3rryc) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="30">](https://www.linkedin.com/in/salaheddine-namir-3402471b8/) |

### Stakeholders

| Name | Role |
| --- | --- |
| Franck JEANNIN ([**ALGOSUP**](https://algosup.com/)) | School Director |


### Team Roles

| Role | Description |
| :--- | :--- |
| Project Manager | Responsible for overall project planning, coordination, and communication. |
| Program Manager | Responsible of deadlines and deliverables. Design of the project of his directive. Should deliver the functional specification |
| Tech Lead | Responsible for technical design and implementation of the project. |
| Software Engineer | Responsible for developing and testing the game logic and graphics. |
| Quality Assurance | Responsible for testing the game and ensuring that it meets the specified requirements. |
| Technical Writer | Responsible for documenting the project and creating user manuals. |

# II. Game Design

## 1. Game Concept

### Storyline and Theme

**Storyline**

Frogger is a frog aiming to return home safely after a day’s wandering. The journey home is fraught with dangers: busy highways and treacherous rivers filled with obstacles. Help Frogger navigate these perils to reach the safety of his lily pad on the other side of the road and river.

**Theme**

The theme of “Frogger: The Classic Leap” centers on the quest for safety and the inherent dangers of an everyday journey in a perilous environment. This theme embodies the universal struggle against obstacles, both in the natural world and human-created challenges, reflecting on the risk and vigilance needed in daily survival.

### Game Objectives

The main objective of the game is to guide Frogger safely across the road and river to reach his lily pad home. For that, the player must:
   - Avoid getting hit by cars on the road.
   - Cross the river by jumping on logs and avoiding sinking into the water.
   - Reach the lily pad on the other side of the river to complete the level.

### Player Goals

The player’s goal is to successfully guide Frogger across the road and river to reach the lily pad home. The player must navigate through multiple levels, each with increasing difficulty and obstacles, to complete the game.

## 2. Gameplay Mechanics

### Game Rules

**Player Movement**

  - **Controls**: Players use directional inputs to move Frogger up, down, left, and right across the screen. The goal is to navigate from the bottom of the screen to the safe zones located at the top.
  - **Movement dynamics**: Each press of a control results in Frogger hopping one grid space in the chosen direction. The frog cannot move diagonally and cannot move outside the boundaries of the game screen.

### Levels and Challenges

**Level Progression**

  - **Multiple levels**: The game consists of multiple levels, each with a different layout of obstacles and challenges.
  - **Increasing difficulty**: Each level increases in difficulty, with faster-moving cars, more obstacles in the river, and other challenges to overcome.

**Challenges**

  - **Road hazards**: Cars and trucks move across the road at varying speeds. Frogger must avoid getting hit by these vehicles to stay alive.
  - **River obstacles**: Logs and turtles move across the river, providing platforms for Frogger to jump on. Frogger must avoid falling into the water to survive.

### Scoring System

**Scoring Mechanism**

  - **Reaching a Home**: Each time Frogger successfully reaches a home, players score points. Bonus points are awarded for reaching a home with a female frog or a fly present.
  - **Time Bonus**: Players receive additional points based on the amount of time left on the timer after reaching a home.
  - **Progression**: Completing all homes resets the level with increased difficulty, including faster-moving vehicles and more erratic river obstacles.

## 3. User Interface Design

### Sprites and Graphics

#### **Frogger**

*Static Frogger*

![Frogger](img/FrogSprite/UpSprite/StaticUpSprite.png)
![Frogger](img/FrogSprite/DownSprite/StaticDownSprite.png)

![Frogger](img/FrogSprite/RightSprite/StaticRightSprite.png)
![Frogger](img/FrogSprite/LeftSprite/StaticLeftSprite.png)

By default, Frogger is displayed in a static position facing up, down, left, or right.

*Jumping Frogger*

![Frogger](img/FrogSprite/UpSprite/JumpUpSprite.png)
![Frogger](img/FrogSprite/DownSprite/JumpDownSprite.png)

![Frogger](img/FrogSprite/RightSprite/JumpRightSprite.png)
![Frogger](img/FrogSprite/LeftSprite/JumpLeftSprite.png)

When Frogger moves in a direction, an animation shows the frog jumping in that direction.

#### **Death**

![Death](img/DeathSprite/DeathSprite1.png)
![Death](img/DeathSprite/DeathSprite2.png)
![Death](img/DeathSprite/DeathSprite3.png)
![Death](img/DeathSprite/DeathSprite4.png)

![Death](img/DeathSprite/DeathSprite5.png)
![Death](img/DeathSprite/DeathSprite6.png)
![Death](img/DeathSprite/DeathSprite7.png)

When Frogger collides with a vehicle or falls into the water, a death animation is displayed.

#### **Cars**

*Red Cars*

![Cars](img/CarsSprite/LeftCars2Sprite.png)

![Cars](img/CarsSprite/RightCars2Sprite.png)

*Blue Cars*

![Cars](img/CarsSprite/LeftCar1Sprite.png)

![Cars](img/CarsSprite/RightCar1Sprite.png)

*Racing Cars*

![Cars](img/CarsSprite/LeftRaceCar1Sprite.png)

![Cars](img/CarsSprite/RightRaceCar1Sprite.png)

Different types of cars move across the road at varying speeds.

#### **Trucks**

![Trucks](img/TruckSprite/LeftTruckSprite.png)

![Trucks](img/TruckSprite/RightTruckSprite.png)

Trucks move across the road at a slower speed than cars.

#### **Logs**

![Logs](img/LogsSprite/LeftLogSprite.png)
![Logs](img/LogsSprite/MiddleLogSprite.png)
![Logs](img/LogsSprite/RightLogSprite.png)

Logs move across the river, providing platforms for Frogger to jump on.

#### **Turtles**

*Swimming Turtles*

![Turtles](img/TurtlesSprite/Turtle1Sprite.png)
![Turtles](img/TurtlesSprite/Turtle2Sprite.png)
![Turtles](img/TurtlesSprite/Turtle3Sprite.png)

Allowing Frogger to jump on them, turtles move across the river.

*Submerged Turtles*

![Turtles](img/TurtlesSprite/Turtle4Sprite.png)
![Turtles](img/TurtlesSprite/Turtle5Sprite.png)

When submerged, turtles do not provide a platform for Frogger to jump on.

**Homes**

![Homes](img/BackgroundSprite/NenuphareSprite.png)

 Lily pad homes at the top of the screen where Frogger must reach.

#### **Background**

*Spawn Land*

![Spawn floor](img/BackgroundSprite/SpawnSprite.png)

*Road*

![Road](img/BackgroundSprite/RoadSprite.png)

*Middle Land*

![Middle Land](img/BackgroundSprite/MiddleCPSprite.png)

*River*

![River](img/BackgroundSprite/RiverSprite.png)

*Homes Area*

![End Land](img/BackgroundSprite/ArrivalAreaSprite.png) 

*Homes Interval*

![End Land](img/BackgroundSprite/ArrivalIntervalSprite.png)

### Screen Layouts

#### **Main Menu**

![Main Menu](img/BackgroundSprite/MainMenuSprite.png)

  - **Title**: The game title is displayed prominently at the top of the screen.
  - **Start Button**: Players can start the game by clicking on a button.

#### **Game Screen**

![Game Screen](img/BackgroundSprite/MapSprite.png)

   - **Frogger**: The player’s frog character is displayed at the bottom of the screen.
   - **Road**: The road with moving vehicles is located in the middle of the screen.
   - **River**: The river with moving logs and turtles is located at the top of the screen.
   - **Homes**: The lily pad homes are located at the top of the screen, where Frogger must reach to complete the level.
   - **Score**: The player’s current score is displayed at the top of the screen.
   - **Timer**: A timer counts down the remaining time for the player to complete the level.

#### **Game Over Screen**

![Game Over Screen](img/BackgroundSprite/GameOverScreen.png)

   - **Game Over Message**: A message is displayed to inform the player that the game is over.
   - **Final Score**: The player’s final score is displayed on the screen.
   - **Restart Button**: Players can restart the game by clicking on a button.

### Controls and Inputs

**Controls**

   - **Up ↑**: Move Frogger up one grid space.
   - **Down ↓**: Move Frogger down one grid space.
   - **Left ←**: Move Frogger left one grid space.
   - **Right →**: Move Frogger right one grid space.

### Feedback Mechanisms

**Visual Feedback**

   - **Movement**: Frogger hops in the direction chosen by the player, providing visual feedback on the player’s input.
   - **Collision**: When Frogger collides with a vehicle or falls into the water, a visual indicator shows the collision.

## 4. Visual Elements

### Color Palette

<Details><Summary><b>Frogger Colors</b></Summary>

   - ![#16fa00](https://placehold.co/15x15/16fa00/16fa00.png) `#16fa00 `
   - ![#e4ff34](https://placehold.co/15x15/e4ff34/e4ff34.png) `#e4ff34 `
   - ![#2c6d1e](https://placehold.co/15x15/2c6d1e/2c6d1e.png) `#2c6d1e `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `
   - ![#000000](https://placehold.co/15x15/000000/000000.png) `#000000 `

</Details>

<Details><Summary><b>Death Colors</b></Summary>

   - ![#822fa1](https://placehold.co/15x15/822fa1/822fa1.png) `#822fa1 `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#d51c1c](https://placehold.co/15x15/d51c1c/d51c1c.png) `#d51c1c `
</Details>

<Details><Summary><b>Red Cars Colors</b></Summary>

   - ![#ff0404](https://placehold.co/15x15/ff0404/ff0404.png) `#ff0404 `
   - ![#e00000](https://placehold.co/15x15/e00000/e00000.png) `#e00000 `
   - ![#fffcb5](https://placehold.co/15x15/fffcb5/fffcb5.png) `#fffcb5 `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#ff8704](https://placehold.co/15x15/ff8704/ff8704.png) `#ff8704 `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `
   - ![#e5e5e5](https://placehold.co/15x15/e5e5e5/e5e5e5.png) `#e5e5e5 `
   - ![#5fcde4](https://placehold.co/15x15/5fcde4/5fcde4.png) `#5fcde4 `
   - ![#6abacb](https://placehold.co/15x15/6abacb/6abacb.png) `#6abacb `
   - ![#9badb7](https://placehold.co/15x15/9badb7/9badb7.png) `#9badb7 `
   - ![#85949c](https://placehold.co/15x15/85949c/85949c.png) `#85949c `

</Details>

<Details><Summary><b>Blue Cars Colors</b></Summary>

   - ![#0f0092](https://placehold.co/15x15/0f0092/0f0092.png) `#0f0092 `
   - ![#000078](https://placehold.co/15x15/000078/000078.png) `#000078 `
   - ![#fffcb5](https://placehold.co/15x15/fffcb5/fffcb5.png) `#fffcb5 `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#ff8704](https://placehold.co/15x15/ff8704/ff8704.png) `#ff8704 `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `
   - ![#e5e5e5](https://placehold.co/15x15/e5e5e5/e5e5e5.png) `#e5e5e5 `
   - ![#5fcde4](https://placehold.co/15x15/5fcde4/5fcde4.png) `#5fcde4 `
   - ![#6abacb](https://placehold.co/15x15/6abacb/6abacb.png) `#6abacb `
   - ![#9badb7](https://placehold.co/15x15/9badb7/9badb7.png) `#9badb7 `
   - ![#85949c](https://placehold.co/15x15/85949c/85949c.png) `#85949c `

</Details>

<Details><Summary><b>Racing Cars Colors</b></Summary>

   - ![#db0000](https://placehold.co/15x15/db0000/db0000.png) `#db0000 `
   - ![#a70000](https://placehold.co/15x15/a70000/a70000.png) `#a70000 `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#9badb7](https://placehold.co/15x15/9badb7/9badb7.png) `#9badb7 `
   - ![#242424](https://placehold.co/15x15/242424/242424.png) `#242424 `
   - ![#222034](https://placehold.co/15x15/222034/222034.png) `#222034 `
   - ![#847e87](https://placehold.co/15x15/847e87/847e87.png) `#847e87 `
   - ![#9c9c9c](https://placehold.co/15x15/9c9c9c/9c9c9c.png) `#9c9c9c `
   - ![#696a6a](https://placehold.co/15x15/696a6a/696a6a.png) `#696a6a `

</Details>

<Details><Summary><b>Trucks Colors</b></Summary>

   - ![#121b49](https://placehold.co/15x15/121b49/121b49.png) `#121b49 `
   - ![#ff2121](https://placehold.co/15x15/ff2121/ff2121.png) `#ff2121 `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#eecd9a](https://placehold.co/15x15/eecd9a/eecd9a.png) `#eecd9a `
   - ![#0000ff](https://placehold.co/15x15/0000ff/0000ff.png) `#0000ff `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `
   - ![#222034](https://placehold.co/15x15/222034/222034.png) `#222034 `
   - ![#8cb7c1](https://placehold.co/15x15/8cb7c1/8cb7c1.png) `#8cb7c1 `
   - ![#bcf3ff](https://placehold.co/15x15/bcf3ff/bcf3ff.png) `#bcf3ff `
   
   Moving to the left: ![#ff0000](https://placehold.co/15x15/ff0000/ff0000.png) `#ff0000 ` 

   Moving to the right: ![#fba6ff](https://placehold.co/15x15/fba6ff/fba6ff.png) `#fba6ff `

</Details>  

<Details><Summary><b>Logs Colors</b></Summary>

   - ![#d55c31](https://placehold.co/15x15/d55c31/d55c31.png) `#d55c31 `
   - ![#b16f4f](https://placehold.co/15x15/b16f4f/b16f4f.png) `#b16f4f `
   - ![#dbdbdb](https://placehold.co/15x15/dbdbdb/dbdbdb.png) `#dbdbdb `

</Details>

<Details><Summary><b>Turtles Colors</b></Summary>

   - ![#ff0b0](https://placehold.co/15x15/ff0b0/ff0b0.png) `#ff0b0 `
   - ![#31ff1e](https://placehold.co/15x15/31ff1e/31ff1e.png) `#31ff1e `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `

</Details>

<Details><Summary><b>Homes Colors</b></Summary>

   - ![#249c44](https://placehold.co/15x15/249c44/249c44.png) `#249c44 `
   - ![#99e550](https://placehold.co/15x15/99e550/99e550.png) `#99e550 `

</Details>

<Details><Summary><b>Spawn Land Colors</b></Summary>  

   - ![#222034](https://placehold.co/15x15/222034/222034.png) `#222034 `
   - ![#1c7233](https://placehold.co/15x15/1c7233/1c7233.png) `#1c7233 `
   - ![#99e550](https://placehold.co/15x15/99e550/99e550.png) `#99e550 `
   - ![#fbf236](https://placehold.co/15x15/fbf236/fbf236.png) `#fbf236 `
   - ![#ac3232](https://placehold.co/15x15/ac3232/ac3232.png) `#ac3232 `
   - ![#639bff](https://placehold.co/15x15/639bff/639bff.png) `#639bff `
   - ![#df7126](https://placehold.co/15x15/df7126/df7126.png) `#df7126 `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `

</Details>

<Details><Summary><b>Road Colors</b></Summary>

   - ![#3c3858](https://placehold.co/15x15/3c3858/3c3858.png) `#3c3858 `
   - ![#d5d5d5](https://placehold.co/15x15/d5d5d5/d5d5d5.png) `#d5d5d5 `
   - ![#ffffff](https://placehold.co/15x15/ffffff/ffffff.png) `#ffffff `

</Details>

<Details><Summary><b>Middle Land Colors</b></Summary>

   - ![#222034](https://placehold.co/15x15/222034/222034.png) `#222034 `
   - ![#1c7233](https://placehold.co/15x15/1c7233/1c7233.png) `#1c7233 `
   - ![#99e550](https://placehold.co/15x15/99e550/99e550.png) `#99e550 `
   - ![#2061b6](https://placehold.co/15x15/2061b6/2061b6.png) `#2061b6 `

</Details>

<Details><Summary><b>River Colors</b></Summary>

   - ![#2061b6](https://placehold.co/15x15/2061b6/2061b6.png) `#2061b6 `
   - ![#2777e0](https://placehold.co/15x15/2777e0/2777e0.png) `#2777e0 `

</Details>

<Details><Summary><b>Homes Area Colors</b></Summary>

   - ![#2061b6](https://placehold.co/15x15/2061b6/2061b6.png) `#2061b6 `
   - ![#d77bba](https://placehold.co/15x15/d77bba/d77bba.png) `#d77bba `
   - ![#76428a](https://placehold.co/15x15/76428a/76428a.png) `#76428a `
   - ![#99e550](https://placehold.co/15x15/99e550/99e550.png) `#99e550 `
   - ![#1c7233](https://placehold.co/15x15/1c7233/1c7233.png) `#1c7233 `

</Details>


### Animations

**Animated Sprites**

*Swimming Turtles Animation*

![Swimming Turtles](img/TurtlesSprite/SwimmingTurtle.gif)

*Submerged Turtles Animation*

![Submerged Turtles](img/TurtlesSprite/SubmergedTurtle.gif)

*Jumping Frogger Animation*

![Jumping Frogger](img/FrogSprite/UpSprite/JumpingUpAnimation.gif)

*Death Animation*

![Death Animation](img/DeathSprite/DeathAnimation.gif)


# III. User Experience


