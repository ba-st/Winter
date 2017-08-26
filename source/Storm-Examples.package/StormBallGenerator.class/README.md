I generate a number of randomized balls at a fixed rate (a fixed number every so many animation steps). Once my preset number of balls has been generated, I conclude the series with one heavy ball.

Instance Variables:

balls
	number of balls to generate

ballsGenerated
	number of balls generated up to now

ballsPerStep
	how many balls I should generate per animation period

startX
	approximate horizontal position where the balls should be generated

stepCounter
	incremented after each call to #eventUpdated: and counted to know when to generate the next batch of ballsPerStep balls