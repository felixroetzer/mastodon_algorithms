# Mastodon Algorithms

This project is part of a research initiative at the Vienna University of Economics and Business, exploring alternative ranking mechanisms for decentralized social media, in specific Mastodon. It provides various algorithmic implementations for Mastodon, inspired by an analysis of centralized social media ranking systems such as the Twitter algorithm. The goal is to offer instance administrators flexible ranking methods for the "Home" timeline beyond the default reverse chronological post ordering. The different implementation options might be chosen based on the administrators goal.

# Requirements:

- Readily installed Mastodon instance on your machine. ('https://docs.joinmastodon.org/admin/install/')

# Key approaches:

This project extends Mastodon's default home feed algorithm to include:  
- Changing default of the home timeline to all server posts.
- Second-degree posts – Displays posts from users followed by those you follow, expanding the content pool.
- Customizable ranking mechanisms - Allows instance owners to tailor how posts are ranked and presented.

# Installation

1. In your environment, switch to the Mastodon user
   ```bash
   su - mastodon
3. Clone the repository into your Mastodon environment
   ```bash
   git clone https://github.com/felixroetzer/mastodon_algorithms.git
5. Now all the required files will be located inside your environment.
6. Go into the algorithms folder
   ```bash
   cd mastodon_algorithms
7. Go into the folder of the algorithm you want to use
   ```bash
   cd {your_algo} e.g. second-degree
8. Install the changes, to have second-degree posts included in the "Home" timeline
   ```bash
   chmod +x install.sh  
   ./install.sh
9. Move the changes to the correct locations
   ```bash
   mv -f ~/live/mastodon_algorithms/{your-algo}/app/models/home_feed.rb ~/live/app/models/
10. Exit the Mastodon user and save the changes
   ```bash
   exit 
   systemctl restart mastodon-web mastodon-sidekiq mastodon-streaming



