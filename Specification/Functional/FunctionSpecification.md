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
   1. [➣ Glossary](#1-glossary)
   2. [➣ Project Overview](#2-project-overview)
   3. [➣ Project Definition](#3-project-definition)
      - [⊢Vision](#vision)
      - [⊢Objectives](#objectives)
      - [⊢Scope](#scope)
      - [⊢Target Audience](#target-audience)
      - [⊢Deliverables](#deliverables)
  
[II. **Game Design**](#ii-game-design)
   1. [➣ Game Concept](#1-game-concept)
      - [⊢Storyline and Theme](#storyline-and-theme)
      - [⊢Game Objectives](#game-objectives)
      - [⊢Player Goals](#player-goals)
   2. [➣ Gameplay Mechanics](#2-gameplay-mechanics)
      - [⊢Game Rules](#game-rules)
      - [⊢Levels and Challenges](#levels-and-challenges)
      - [⊢Scoring System](#scoring-system)
   3. [➣ User Interface Design](#3-user-interface-design)
      - [⊢Mockups](#mockups)
      - [⊢Screen Layouts](#screen-layouts)
      - [⊢Controls and Inputs](#controls-and-inputs)
      - [⊢Feedback Mechanisms](#feedback-mechanisms)
   4. [➣ Audio-Visual Elements](#4-audio-visual-elements)
      - [⊢Color Palette](#color-palette)
      - [⊢Graphics and Animations](#graphics-and-animations)
      - [⊢Sound Effects and Music](#sound-effects-and-music)

[III. **User Experience**](#iii-user-experience)
   1. [➣ Accessibility Features](#1-accessibility-features)
      - [⊢Assistive Technologies](#assistive-technologies)
      - [⊢Accessibility Standards](#accessibility-standards)
   2. [➣ User Engagement Strategies](#2-user-engagement-strategies)
      - [⊢In-game Rewards](#in-game-rewards)
      - [⊢User Progress Tracking](#user-progress-tracking)
   3. [➣ Adaptability to User Feedback](#3-adaptability-to-user-feedback)
      - [⊢Feedback Channels](#feedback-channels)
      - [⊢Iterative Design Updates](#iterative-design-updates)
   4. [➣ Device Compatibility](#4-device-compatibility)
      - [⊢Supported Devices](#supported-devices)
      - [⊢Cross-Platform Compatibility](#cross-platform-compatibility)
  
[IV. **Non-Functional Requirements**](#iv-non-functional-requirements)
   1. [➣ Performance](#1-performance)
      - [⊢Responsiveness](#responsiveness)
      - [⊢Resource Utilization](#resource-utilization)

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

The project aims to develop a hardware-based implementation of the classic arcade game **Frogger** using an **FPGA** board. The game will be designed to run on a **VGA display** and will be controlled using switches already integrated in the board. The game will be implemented using a hardware description language (HDL) more precisely on **Verilog** and will be optimized for performance and resource utilization on the FPGA platform.


