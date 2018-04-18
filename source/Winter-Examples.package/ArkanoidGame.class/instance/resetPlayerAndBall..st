Reset
resetPlayerAndBall: anArkanoidBall

	| player |

	player := self player.
	playing := false.
	player resetPosition.
	anArkanoidBall resetPosition.
	scene initialize.
	scene addPlayer: player