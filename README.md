# MORL

## Introduction

This repository contains MATLAB simulation code for a multi-objective Q-learning ultimatum game. The code studies how the weight between material payoff and fairness preference affects long-run strategies and action distributions.

## Description

The simulation models two agents with separate Q-tables for payoff-driven and fairness-driven learning. A fairness pressure coefficient controls the contribution of the fairness objective to decision-making.

The code scans different values of the preference weight and records the long-run action distributions of both agents.

The code is organized as follows:

- **`main.m`** – Main MATLAB script for running the two-agent multi-objective Q-learning simulation.
- **`README.md`** – Project description, dependencies, and usage instructions.

## Dependencies

- MATLAB R2020a or later

No additional MATLAB toolboxes are required.

## Usage

Run the main script directly in MATLAB:

```matlab
main
