# MORL

## Project Description

This project provides MATLAB simulation code for a multi-objective reinforcement learning model of fairness behavior.

The code implements a two-agent Q-learning ultimatum game in which each agent learns from both material payoff and fairness-related feedback. A fairness pressure coefficient is used to control the relative weight between the payoff objective and the fairness objective.

By scanning different values of the fairness weight, the simulation records the long-run action distributions of both agents and analyzes how fairness preference shapes strategy selection in repeated interactions.

## Installation Guide

1. Ensure that MATLAB is installed on your computer.
2. Download or clone this repository.
3. Open the project folder in MATLAB.
4. No additional MATLAB toolboxes are required.

## Usage

Run the main script directly in MATLAB:

```matlab
main
