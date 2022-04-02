Bowling Challenge in Ruby
=================

## Installation
1. Fork this repo, and clone to your local machine
2. Run the command `gem install bundler` (if you don't have bundler already)
3. When the installation completes, run `bundle`

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

## Bowling — how does it work?

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.

In the image below you can find some score examples.

More about ten pin bowling here: http://en.wikipedia.org/wiki/Ten-pin_bowling

![Ten Pin Score Example](images/example_ten_pin_scoring.png)

## Tests
There are a series of tests which can be run with the following (from the directory):
```
rspec
```
To run tests from specific class files, this can be done by:
```
rspec spec/<filename>.rb
```

## User Stories
```
As a player,
To keep track of my points
I would like to keep a scoreboard which stores the pins I've knocked down per frame

As a player,
So that everyone has had an equal chance of playing
Every game should have 10 frames

As a player,
I have rolled a strike
Therefore I would like the appropriate points and bonuses added to the tally

As a player,
I have rolled a spare
Therefore I would like the appropriate points and bonuses added to the tally

As a player,
I have rolled two strikes in a row
Therefore I would like the appropriate points and bonuses added to the tally

As a player,
To calculate the scores of the 10th frame
I would like to input my scores for the 10th frame and obtain the necessary points
```

## Approach to the challenge
As I was not familiar with the rules in bowling, I had to conduct research by watching youtube videos on basic bowling rules. I then went through the specifications and broke it down into user stories (as seen above). I started diagramming the program as seen below.

I followed strict TDD to ensure each of the user stories were accompanied by necessary tests. I made sure to update my diagram as I progressed throughout the challenge.
<img width="524" alt="Screenshot 2022-03-28 at 22 24 53" src="https://user-images.githubusercontent.com/74867241/160489890-70d77d12-068a-4e39-bb8d-40ce98a571db.png">

Although I did not complete the challenge, I understand that I need to do the following:
* Split my classes to ensure SRP. Instead of an array storing nested arrays of the first and second rolls, it would be better to have an array store objects (taken from a 'Frame' class). 
* Implement the scoring method for the 10th frame
