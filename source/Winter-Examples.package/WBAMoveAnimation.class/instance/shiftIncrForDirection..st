Accessing
shiftIncrForDirection: index
	"Maps the direction to the base deplacement in the graphics axis
	1 (down) -> 0@ -2.
	2 (left) -> 3@0.
	3 (right) -> -3 @0.
	4 (up) -> 0@2 "
	
	^ index \\ 3 - 1 @ (index // 2 - 1) * self cellSize / self numberOfAnimationFrame