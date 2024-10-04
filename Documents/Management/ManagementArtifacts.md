# Project FPGA - Project Charter - Management Artifacts

This document aims to centralize all the management artifact links and resources listed below:

- [Project FPGA - Project Charter - Management Artifacts](#project-fpga---project-charter---management-artifacts)
  - [Tasks \& schedule](#tasks--schedule)
  - [RACI Matrix](#raci-matrix)
  - [Risks \& Assumptions](#risks--assumptions)
  - [Key Performance Indicators](#key-performance-indicators)
    - [Definition of our KPIs](#definition-of-our-kpis)
      - [Documents](#documents)
      - [Development](#development)
      - [Mood](#mood)
    - [Link to the project's KPIs](#link-to-the-projects-kpis)
  - [Weekly reports](#weekly-reports)
  - [Post Mortem Analysis](#post-mortem-analysis)

## Tasks & schedule

You can view the breakdown of all the tasks we've identified for the duration of the project following [this link](https://docs.google.com/spreadsheets/d/1oYwHY8jmdlifjMKubotXzNayuKqLi8CLJA8s5YwbkNg/edit?usp=sharing).

It has been created using Google Sheets, ensuring a good comprehension already known by everyone, but also as a modular tool, which can implement metrics. Consequently, the client can track with ease the challenges and achievements done during the project.

## RACI Matrix

The RACI matrix of this project is as follows considering the [Project Charter](./project_charter.md):

| Name                     | Project Manager | Program Manager | Technical Leader | Software engineer | Quality assurance | Technical Writer | Stakeholders |
| ------------------------ | --------------- | --------------- | ---------------- | ----------------- | ----------------- | ---------------- | ------------ |
| Project kick-off         | I               | I               | I                | I                 | I                 | I                | C            |
| Project charter          | R               | A               | C                | C                 | C                 | C                | I            |
| Schedule creation        | R               | C               | C                | C                 | C                 | C                | I            |
| Functional specification | A               | R               | C                |                   | C                 | /                | I            |
| Technical specification  | A               | C               | R/A              | I                 | C                 | /                | I            |
| Coding process           | A               | I               | R                | R/A               | C                 | /                | /            |
| Testing & Debugging      | A               | /               | C                | C                 | R/A               | I                | /            |
| User Manual              | A               | C               | C                | C                 | I                 | R/A              | I            |

Legend:

| Letter | Full name   | Description                                     |
| ------ | ----------- | ----------------------------------------------- |
| R      | Responsible | Executes the task or activity                   |
| A      | Accountant  | Ultimately answerable for the task's completion |
| C      | Consulted   | Provides input and/or advice on the task        |
| I      | Informed    | Kept updated on progress and decisions          |
| /      | /           | No interaction with this role for this task     |

## Risks & Assumptions

| ID  | Description                                      | Consequence                                                                                 | Impact   | Likelihood | Mitigation/Avoidance                                                                    |
| --- | ------------------------------------------------ | ------------------------------------------------------------------------------------------- | -------- | ---------- | --------------------------------------------------------------------------------------- |
| 1   | FPGA is a language to which we are not yet used. | Development pace might be hindered                                                          | High     | Medium     | Ask for help to the other team members                                                  |
| 2   | Misinterpretation of the project                 | Incorrect implementation of the software                                                    | Critical | Medium     | Regular communication with the client to understand their needs, and stick to them.     |
| 3   | Team member missing or leaving                   | Tasks left to the remaining members without any assignee, Project quality might be degraded | High     | Guaranteed | Planning tasks a lot in advance and sharing the tasks among the remaining team members. |

## Key Performance Indicators

### Definition of our KPIs

To enable the client to track our project's milestones, we have defined several quantitatively measurable KPIs. Below is a list of these KPIs along with their respective calculations.

#### Documents

The following KPIs are included in this section:

- **Functional specifications**
- **Technical specifications**
- **Test Plan**
- **User Manual**

The progress of these documents is measured using the following formula:

$$\text{percentage} = {\text{current number of chapters }} / {\text{ total number of chapters}}\times{100}$$

Where:

- **current number of chapters**: The number of chapters that are completely written and reviewed.
- **total number of chapters**: The number of predefined chapters in the document's outline, based on documents that.

#### Development

This section tracks the following KPIs:

- **Game environment**
- **Game mechanics**
- **Gameplay**

Given the complexity and time required for development, we include progress on partially completed tasks. The progress is calculated using:

$$\text{percentage} = (\frac{({\text{current number of fully coded tasks + sum percentages unfinished tasks}})} {\text{total designed tasks}})\times{100}$$

Where:

- **current_number_of_fully_coded_tasks**: The number of tasks that are fully completed.
- **sum_unfinished_tasks_advancements**: The cumulative progress of each unfinished section.
- **total_designed_tasks**: The total number of tasks defined during project analysis and documentation.

#### Mood

The mood percentage is calculated by averaging the weekly grades out of 10 given by each team member. These grades reflect their overall motivation and well-being from a personal perspective, as well as considering the project's milestones and challenges.

By utilizing these formulas, we ensure that our progress tracking is clear and consistent, and provides a realistic view of our project's status to the client. For readibility and a better understanding, the KPIs are rounded to the nearest 5%

### Link to the project's KPIs

You can see our project's KPIs which were explained above following [this link](https://docs.google.com/spreadsheets/d/1mPu72MWZ-LSUZg1itNDJWhMYskVl1vK6RW6i7DCEuyE/edit?usp=sharing).

## Weekly reports

The weekly reports folder can be found following [here](/Management/WeeklyReports/).

You can directly access the reports individually following the below bullet points:

- [Access Report for Week 1](./WeeklyReports/Week1.md)
- [Access Report for Week 2](./WeeklyReports/Week2.md)
- [Access Report for Week 3](./WeeklyReports/Week3.md)
- [Access Report for Week 4](./WeeklyReports/Week4.md)
- [Access Report for Week 5](./WeeklyReports/Week5.md)

## Post Mortem Analysis

You can refer to our Post Mortem Analysis to have a retrospective of our project following [this link](./PostMortem.md)
