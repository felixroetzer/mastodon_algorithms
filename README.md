# mastodon_algorithms

This project is part of a research initiative at the Vienna University of Economics and Business, exploring alternative ranking mechanisms for decentralized social media, in specific Mastodon. It provides various algorithmic implementations for Mastodon, inspired by an analysis of centralized social media ranking systems such as the Twitter algorithm. The goal is to offer instance administrators flexible ranking methods for the "Home" timeline beyond the default reverse chronological post ordering. The different implementation options might be chosen based on the administrators goal.

# Requirements:

- Readily installed Mastodon instance on your machine. ('https://docs.joinmastodon.org/admin/install/')

# Key approaches:

This project extends Mastodon's default home feed algorithm to include:  
- Second-degree posts – Displays posts from users followed by those you follow, expanding the content pool.
- Customizable ranking mechanisms - Allows instance owners to tailor how posts are ranked and presented.

# Installation

1. In your environment, switch to the Mastodon user (su - mastodon)
2. Clone the repository into your Mastodon environment (git clone https://github.com/felixroetzer/mastodon_algorithms.git)
3. Now all the required files will be located inside your environment.
4. Go into the algorithms folder (cd mastodon_algorithms)

