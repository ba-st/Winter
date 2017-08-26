examples
example3
	"self  example3"

	self new 
		title: 'Pong Example';
		text: 'window extent: 600@400.

incr := 3.
littleSize := 20.
xCurrent := 0.
yCurrent := window extent y / 2. 
draw steppingWith: [ :canvas |	
	canvas surface clear: Color darkGray.
	
	(xCurrent + littleSize > window extent x) | (xCurrent < 0)
		ifTrue: [incr := incr negated].
		
	canvas pathTransform
		translateX: xCurrent
				Y: yCurrent.
	xCurrent := xCurrent + incr.

	canvas setPaint: Color red.
	canvas drawShape: ((0@0) extent: (littleSize@littleSize)).
	]';
		openWithSpec.