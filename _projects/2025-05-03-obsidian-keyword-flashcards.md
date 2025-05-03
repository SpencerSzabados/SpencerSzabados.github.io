---
title: Obsidian Keyword Based Flashcard Plugin
description: Outline of my new obsidian flashcard plugin and note taking method.
doc type: Project post
layout: post
authors: Spencer Szabados
date: 2025-05-03
category: other
tags:
  - notes
  - obsidian
  - flashcards
  - markdown

thumbnail: 

toc:
    sidebar: true

related_publications: false
scholar: 
    source: ./_bibliography
    bibliography: references.bib
---

With the rise in discussion around ["Vibe coding"](https://x.com/karpathy/status/1886192184808149383) I decided to give it a go, by making a simple flashcard Obsidian plugin for reviewing my notes. This page contains a discussion of my "vibe coding" experience and the motivation for the final plugin I ended up creating. The accompanying project github repo can be found here [obsidian-keyword-flashcards](https://github.com/SpencerSzabados/obsidian-keyword-flashcards).

---

# Overview
During the course of my masters degree, and the trailing edge of my undergraduate degree, I accumulated a large collection of notes within my [Obsidian](https://obsidian.md/) vault. Most of these are highly structured notes on topics in mathematics and computer science coming from courses I took or papers I have read. However, unlike the prolific amount of flashcards I used to memorize all the definitions and theorem statements presented in lectures, I was not able to find a (simple) system for reviewing my Obsidian notes. Many of the existing tools, e.g., [flashcards-obsidian](https://github.com/reuseman/flashcards-obsidian) or [obsidian-spaced-repetition](https://github.com/st3v3nmw/obsidian-spaced-repetition), were either too feature rich or lacked a method of assembling cards from notes I had already created (short of requiring me to rewrite all my notes into a new format).

# My note taking format
As most of my notes relate to topics in mathematics they tend to follow a templated format. For example here is a definition block from one of my notes:

{% include figure.liquid loading="eager" path="assets/img/projects/obsidian-keyword-flashcards/obsidian_definition_note.png" class="img-fluid rounded z-depth-1" max-width="500px" center="true" %}

I structure most "atomic" elements of my notes in this way, a bold header with a tag prefix (e.g., method, theorem, example, problem, etc.) followed by a description and links to other related notes or blocks of text. 

As a consequence of taking my notes in such a templated style, I am able to easily parse my notes for keywords (or strings) and build flashcards with the bold title on one side and the block content on the reverse. Saving me from having to write any of my notes to other formats used by other flashcard plugins. The only major concern for this approach is its speed when a user has many files; with this said, I have over 300 blocks like this in my notes and the parsing only takes a handful of seconds to complete.

# Building the plugin
To build this plugin, following the "vibe coding" ethos of 'be lazy and prompt more', I used Claude 3.7 and began my prompt by supplying a link to the [Obsidian API](https://docs.obsidian.md/Plugins/Getting+started/Build+a+plugin#Prerequisites) docs for building plugins. Within an hour or so I was able, after some manual intervention and debugging the API calls, to get a working version of a basic flashcard parser with a serviceable UI. 

In the following few days, in my off time, I was able to quickly add support for markdown rendering (which required more manual intervention to get working), a configurable `.json` file that stores the parsing arguments, as well as a spaced repetition function for the notes. Here is what the final version ended up looking like:

{% include figure.liquid loading="eager" path="assets/img/projects/obsidian-keyword-flashcards/obsidian_flashcard_front_final.png" class="img-fluid rounded z-depth-1" max-width="500px" center="true" %}
{% include figure.liquid loading="eager" path="assets/img/projects/obsidian-keyword-flashcards/obsidian_flashcard_back_final.png" class="img-fluid rounded z-depth-1" max-width="500px" center="true" %}

You can find the final plugin repository linked at the start of the page. The README has instructions on how to install and configure it for different flashcard headers etc.

# Conclusion

Overall its hard to complain with the result given how quickly I was able to build it. Throughout the process of building the plugin I also learned more about the Obsidian plugin API and dusted off some of my `TypeScript` knowledge, however, only for those aspects where I manually debugged/wrote the code. This hybrid style of coding -- prompting and debugging/writing -- can certainly boost productivity. I've  used other agents for writing small components of projects, but in order to efficiently debug said code you must already have sufficient working knowledge of the programming language and task. At which point the value add is already questionable: I will be left with code I could have written myself -- admittedly in more time -- but without further improving my skills and knowing how best to maintain the code.

The entire "vibe coding" experience was somewhat disheartening. Each time the bot gave me a code fragment it felt akin to opening up someone else's codebase and attempting to debug a feature that changed each iteration of the model prompt. A more frustrating experience compared to debugging my own code.