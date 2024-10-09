
<h1 align="center"> Test plan </h1>

---

<p align="center"> 
Created by: Camille GAYAT <br> Creation Date: 09/27/2024 <br> Last update: 10/09/2024
</p>

---

<details>

<summary>Table of contents</summary>

- [1. Introduction](#1-introduction)
    - [1.1 Overview](#11-overview)
    - [1.2 Testing Scope](#12-testing-scope)
- [2. How to Set Up](#2-how-to-set-up)
- [3. Test Tools](#3-test-tools)
    - [3.1 Software](#31-software)
    - [3.2 Hardware](#32-hardware)
        - [3.2.1 FPGA Board Specifications](#321-fpga-board-specifications)
        - [3.2.2 Computer Specifications](#322-computer-specifications)
    - [3.3 Version Control Tool](#33-version-control-tool)
    - [3.4 Simulation Tool](#34-simulation-tool)
    - [3.5 Synthesis Tool](#35-synthesis-tool)
- [4. Test Strategy](#4-test-strategy)
    - [4.1 Procedure](#41-procedure)
    - [4.2 Issue Tracking](#42-issue-tracking)
- [5. Test Cases](#5-test-cases)
- [6. Risks and Contingencies](#6-risks-and-contingencies)
- [7. Appendix](#7-appendix)
- [8. Glossary](#8-glossary)

</details>

---

## 1. Introduction

### 1.1 Overview

The primary aim of this project is to develop a Frogger game inspired by the classic 1981 version created by Konami, using FPGA technology and Verilog for implementation. The main objective of the game is to guide four frogs safely across a busy road and a flowing river while avoiding various obstacles such as cars and logs. Players must navigate each frog to their home. For more specifications, refer to (functional spec link).

### 1.2 Testing Scope

- The playability on both macOS and Windows platforms.
- The interface and controls are user-friendly.
- All game features, including movement and collision mechanics, are successfully tested.

## 2. How to Set Up

## 3. Test Tools

Test tools refer to the various materials and instruments that will be employed throughout the testing process.

### 3.1 Software

For this project, we will use FPGA technology and Verilog due to the extensive possibilities it offers. Verilog provides greater flexibility in design, enabling direct control over hardware implementation while also optimizing resource usage. This combination ensures that we can achieve high performance and efficiency in our system design.

### 3.2 Hardware

#### 3.2.1 FPGA Board Specifications:

- Lattice ICE40 HX1K FPGA
- EASY USB Connection for power, communication, and programming
- Four User Settable LEDs
- Four Push-Buttons
- Dual 7-Segment LED Display
- VGA Connector
- External Connector (PMOD)
- 25 MHz on-board clock
- 1 Mb Flash for booting up your FPGA

#### 3.2.2 Computer Specifications:

- Operating System: macOS Sequoia Version 15.0
- Chip: Apple M3
- Memory: 16GB
- SSD Storage: 494.38 GB

### 3.3 Version Control tool

GitHub is used in this project to facilitate seamless collaboration among team members, allowing for efficient version control, easy sharing of code, and streamlined communication, which ultimately enhances productivity and project management.

### 3.4 Simulation Tool

The project will use [EDA Playground](https://www.edaplayground.com) to simulate and test the Verilog code. This platform was chosen due to several advantages that align well with our project’s needs:
- EDA Playground is web-based and don't require any installation
- The website offer a free access
- You can share your project to someone else
- The cross-platform compatibility
- No hardware is required to test the code

EDA Playground supports the use of test benches, which are essential for verifying the design. In this project, test benches will simulate the Frogger game mechanics, helping to identify and fix potential bugs early in the development process.

### 3.5 Synthesis Tool

For this project, APIO v0.9.4 will be utilized as the primary synthesis tool. It can be accessed through the Nandland website [here](https://nandland.com/set-up-apio-fpga-build-and-program/). APIO is specifically designed for FPGA development, providing a streamlined platform for transforming Verilog code into a hardware-compatible format.

## 4. Test Strategy

### 4.1 Procedure


### 4.2 Issue Tracking

## 5. Test Cases

You can find the various Test Cases [→ here](https://docs.google.com/spreadsheets/d/19hOothj9DaywUXqyfjia2evk6Djy2kNbEhjEEK4RGDQ/edit?usp=sharing). The purpose of this document is to outline the future features that will need to be tested in advance to identify potential defects early in the project.

## 6. Risks and Contingencies

## 7. Appendix

## 8. Glossary