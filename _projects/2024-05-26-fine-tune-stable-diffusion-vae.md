---
title: Fine-Tune Stable Diffusion Auto-Encoder 
description: A quick start guild to fine-tuning stable diffusions variational auto-encoder.
doc type: Project post
layout: post
authors: Spencer Szabados
date: 2024-05-26
category: work
tags:
  - graphics
  - machine_learning

thumbnail: assets/img/posts/perlin-worms/perlin_worms_dist_bias_5.png

toc:
    sidebar: true

related_publications: true
scholar: 
    source: ./_bibliography
    bibliography: references.bib
---

In a recent project, we (my coauthor and myself) needed to train a denoising diffusion bridge model on 512x512x3 patches from 2048x2048 fundus images take of human eyes. As it is prohibitively expensive, in terms of GPU memory, to train a diffusion model on such high resolutions with memory requirements scaling quadratically with image resolution when using a U-NET backbone, we turned to latent space diffusion models. In particular, we wished to use a fine-tuned version of the auto-encoder from Stable Diffusion. Unfortunately, it was somewhat of a length process finding exactly what training parameters worked well for fine-tuning Stable Diffusions VAE, and a to the point guild. As such, I have composed this short article, which is based on material from [capecape](https://wandb.ai/capecape/ddpm_clouds/reports/Using-Stable-Diffusion-VAE-to-encode-satellite-images--VmlldzozNDA2OTgx) and [cccntu](https://github.com/cccntu/fine-tune-models).

---

# Overview
Stable Diffusion (v1-4), as developed by [stability.ai](https://stability.ai/news/stable-diffusion-public-release), is a latent space diffusion model based primarily on the works  {% cite Vahdat:2021 Rombach:2022 Blattmann:2023 %}, which seek to both improve the efficacy of training high resolution diffusion models as well as overcome the loss in generated image quality from the use of the Variational Autoencoder employed during training. 

Stable Diffusion is commonly used as a base line model for testing newly developed sampling techniques as (1) its ordinarily capable of generating high quality images on a wide verity of subjects, and (2) its code is open source [github-CompVis](https://github.com/CompVis/stable-diffusion), [github-Stability-AI](https://github.com/Stability-AI/stablediffusion) with numerous pre-trained checkpoints trained over huge datasets, which are practically infeasible to replicate at an individual scale, made easily available. 

However, despite all the data these models have been trained on it is not guaranteed to perform well on any given task; e.g., generating (or just encoding) medical images such as x-rays. To counter act this, researchers (and practitioners) typically fine-tune -- running a few additional training steps -- the model on some additional examples for the problem being considered. It is important, to ensure consistent results, when fine-tuning a model to select similar training parameters (e.g., the loss used, the step size, etc.) to those used when the model was initially trained; otherwise, training might fail or the performance of the model may degrade when applied outside of this new data (generalization performance decreases). 

In an effort to save fellow researchers time, I provide a selection of training parameters -- which I have found to work well -- and a complete training script for fine-tuning Stable Diffusion (v1-4)'s variational auto-encoder.

# Fine-tuning the Model
The complete repository for fine-tuning can be found at [github](https://github.com/SpencerSzabados/Fine-tune-Stable-Diffusion-VAE). Consult the README.md for general usage. 

Here is an example 512x512x3 image patch from the [Fives dataset](https://www.nature.com/articles/s41597-022-01564-3) and corresponding reconstruction after being passed through the VAE. 

{% include figure.liquid loading="eager" path="assets/img/posts/image-dither/mike_c4d8color.png" class="img-fluid rounded z-depth-1" max-width="400px" center="true" %}

After running 10k fine-tuning steps here is the result. 