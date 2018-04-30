initialization
initializeSpiders

	"Only half of the boxes in the first row contain a spider at the start of the game."
	1 to: self maxX // 2 do: [ :i |
		self newRandomSpiderTicked: self maxX + 10 + 20 atRandom ]