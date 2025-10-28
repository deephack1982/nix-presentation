---
title: "Reproducable build and dev environments with Nix"
sub_title: Pin everything everywhere
author: Mark Dickie
---

Introduction
---
<!-- column_layout: [2,1] -->
<!-- column: 0 -->
![](images/profile2.png)
<!-- font_size: 2 -->
<!-- alignment: center -->
Mark Dickie
<!-- column: 1 -->
<!-- font_size: 2 -->
<!-- pause -->
* Background in data network, telecoms, infrastructure and build systems.
<!-- pause -->
* Passionate about best practice, repeatability and knowledge sharing.
<!-- pause -->
* Generally spends waking hours working with some kind of tech
<!-- pause -->
* Gamer and private pilot also
<!-- end_slide -->
Overview
---
<!-- font_size: 2 -->
# Define Nix
# Show a small project
# Demonstrate a dev shell using a Nix flake
# Demonstrate a container image using Nix flakes
# Talk about build pipelines with Nix
# Demonstrate a Nix package
# Answer questions
<!-- end_slide -->
Definition
---
<!-- font_size: 2 -->
# Nix is an overloaded term
![](images/logo.png)
<!-- pause -->
## Nix Language
Declarative, purely functional, lazyly evaluated, dynamically typed, domain specific language for package development.
<!-- pause -->
## Nix Package Manager
Cross platform package manager for UNIX like systems (Linux, Darwin) with some support for Windows. Packages are source based with binary caching.
<!-- pause -->
## NixOS Linux Distro
Linux distribution built using Nix for package management and definition of the system configuration declaratively. It is immutable and has an atomic update model.
<!-- end_slide -->
The traditional way
---
<!-- font_size: 2 -->
# The project
Small C application which needs to be built and the artifacts deployed.
<!-- pause -->
## Challenges
We need to have all the correct compilers, libraries and other dependencies on every developer workstation and every build runner for the build and deploy pipelines.
<!-- end_slide -->

Dev Shell with Nix
---
<!-- font_size: 2 -->
# Dependencies

* Nix package manager
* direnv
<!-- pause -->
## Get started
https://github.com/the-nix-way/dev-templates/tree/main
<!-- pause -->
```bash
nix flake init -t github:the-nix-way/dev-templates#c-cpp
```
<!-- end_slide -->
Dev Shell with Nix
---
<!-- font_size: 2 -->
# Demo
![](images/terminal.png)
<!-- end_slide -->
Dev Shell with Nix
---
<!-- font_size: 2 -->
# Benefits
<!-- pause -->
* Dependencies are part of the repository
<!-- pause -->
* Versions of all dependencies are pinned
<!-- pause -->
* Onboarding of developers becomes easy
<!-- pause -->
* Makes environments modular and re-usable
<!-- pause -->
<!-- end_slide -->
Generate a container
---
<!-- font_size: 2 -->
# Demo
![](images/terminal.png)
<!-- end_slide -->
Generate a container
---
<!-- font_size: 2 -->
# Benefits
<!-- pause -->
* Can be used for development or build pipelines
<!-- pause -->
* In webapp and similar contexts this could also be used as a deployable production environment
<!-- pause -->
* Multiple container definitions could be contained in the flake with shared code
<!-- pause -->
<!-- end_slide -->
Build pipelines
---
<!-- font_size: 2 -->
# Multiple approaches
<!-- pause -->
* Build inside the generated container
<!-- pause -->
* Run the devShell from the flake to build
<!-- pause -->
* Use nix to build the package directly
<!-- end_slide -->
Build a Nix package
---
<!-- font_size: 2 -->
# Demo
![](images/terminal.png)
<!-- end_slide -->
Nix Details
---
<!-- font_size: 2 -->
# Nix Store
<!-- pause -->
# Binary Caching
<!-- pause -->
# Garbage Collection
<!-- end_slide -->
Questions?
---
<!-- font_size: 2 -->
Ask away!
<!-- end_slide -->
Links
---
<!-- font_size: 2 -->
Links will go here
