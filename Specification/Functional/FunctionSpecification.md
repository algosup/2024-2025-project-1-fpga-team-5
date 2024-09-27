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
**Last updated:** *2024-09-23*

<!-- TABLE OF CONTENTS -->

### Table of Contents

[I. **Introduction**](#i-introduction)
- [I. Introduction](#i-introduction)
  - [1. Glossary](#1-glossary)
  - [2. Project Overview](#2-project-overview)
  - [3. Project Definition](#3-project-definition)
    - [Vision](#vision)
    - [Objectives](#objectives)
    - [Scope](#scope)
    - [Target Audience](#target-audience)
    - [Deliverables](#deliverables)
  - [4. Project Layout](#4-project-layout)
    - [Project Team](#project-team)
- [II. Game Design](#ii-game-design)
  - [1. Game Concept](#1-game-concept)
  
[II. **Game Design**](#ii-game-design)
   1. [➣ Game Concept](#1-game-concept)
      - [Storyline and Theme](#storyline-and-theme)
      - [Game Objectives](#game-objectives)
      - [Player Goals](#player-goals)
   2. [➣ Gameplay Mechanics](#2-gameplay-mechanics)
      - [Game Rules](#game-rules)
      - [Levels and Challenges](#levels-and-challenges)
      - [Scoring System](#scoring-system)
   3. [➣ User Interface Design](#3-user-interface-design)
      - [Mockups](#mockups)
      - [Screen Layouts](#screen-layouts)
      - [Controls and Inputs](#controls-and-inputs)
      - [Feedback Mechanisms](#feedback-mechanisms)
   4. [➣ Audio-Visual Elements](#4-audio-visual-elements)
      - [Color Palette](#color-palette)
      - [Graphics and Animations](#graphics-and-animations)
      - [Sound Effects and Music](#sound-effects-and-music)

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

## I. Introduction

### 1. Glossary

| Term | Definition |
| --- | --- |
| Frogger | Frogger is a classic arcade game developed by Konami and released in 1981. The game involves guiding a frog across a busy road and river, avoiding obstacles and hazards along the way. |
| FPGA | Field-Programmable Gate Array `Definition still in progress...`|
| HDL | Hardware Description Language `Definition still in progress...`|
| Verilog | Verilog is a HDL used to model electronic systems. It is commonly used in the design and verification of digital circuits. |
| VGA | Video Graphics Array `Definition still in progress...`|

### 2. Project Overview

This project aims to recreate the classic arcade game **Frogger** on an FPGA platform. 

### 3. Project Definition

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

### 4. Project Layout

#### Project Team

| Name | Role | Contact (*Click*) |
| --- | --- | --- |
| Alexis LASSELIN | Project Manager | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/AlexisLasselin) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/alexis-lasselin-318649251/) |
| Rémy CHARLES | Program Manager | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/RemyCHARLES) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/r%C3%A9my-charles-2a8960232/) |
| Michel RIFF | Tech Lead | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/michelriff) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/michel-riff-693007293/) |
| Mathias GAGNEPAIN | Software Engineer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/mathiasgagnepain) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/mathias-gagnepain/) |
| Séréna BAVAROIS | Software Engineer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/NanaChocolat) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/s%C3%A9r%C3%A9na-bavarois/) |
| Camille GAYAT | Quality Assurance | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/camillegayat) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/camille-g-a89114293/) |
| Salaheddine NAMIR | Technical Writer | [<img src="https://cdn.pixabay.com/photo/2022/01/30/13/33/github-6980894_1280.png" width="20">](https://github.com/T3rryc) [<img src="https://www.presse-citron.net/app/uploads/2020/06/linkedin-logo.jpg"  width="20px">](https://www.linkedin.com/in/salaheddine-namir-3402471b8/) |

#### Stakeholders

| Name | Role |
| --- | --- |
| Franck JEANNIN ([**ALGOSUP**](https://algosup.com/)) | School Director |

# II. Game Design

## 1. Game Concept








