# Mastodon Algorithms

This project is part of a research initiative at the Vienna University of Economics and Business, exploring alternative ranking mechanisms for decentralized social media, in specific Mastodon. It provides various algorithmic implementations for Mastodon, inspired by an analysis of centralized social media ranking systems such as the Twitter algorithm. 
The goal is to offer instance administrators flexible ranking methods for the "Home" timeline beyond the default reverse chronological post ordering. The different implementation options might be chosen based on the administrators goal. Some of the implementation options might not be practical to use, however, we added them to showcase many different examples.

# Requirements:

- Readily installed Mastodon instance on your machine. ('https://docs.joinmastodon.org/admin/install/')

# Key approaches (Increasing in complexity):

This project extends Mastodon's default home feed algorithm to include:  
- Changing default of the home timeline to all server posts.
- Second-degree posts – Displays posts from users followed by those you follow, expanding the content pool.
- Customizable ranking mechanisms - Allows instance owners to tailor how posts are ranked and presented.

# Home Timeline Types
1. 'default_local' = This type specifies to have the default home timeline configured such that all the posts made in the server are shown in reverse-chronological post ordering.
2. 'favourite_simple' = This method offers a home timeline that is strictly ranked based on the number of likes of the underlying posts.
3. 'second-degree' = Default home timeline shows posts from people you follow and also the posts of the people your followed ones follow.
4. 'mixed_algo' = The most sophisticated algorithm implementation, it uses engagement numbers as well as age decay, to create a mixed feed of the default timeline and the global timeline.

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
10. Exit the Mastodon user and save the changes
   ```bash
   exit 
   systemctl restart mastodon-web mastodon-sidekiq mastodon-streaming



