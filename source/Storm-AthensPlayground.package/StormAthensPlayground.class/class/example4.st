examples
example4
	"self  example3"

	self new 
		title: 'Pong Ball Example';
		text: 'window extent: 800@600.

incrX:= 3.
incrY := 0.5.
littleSize := 80.
xCurrent := 0.
yCurrent := window extent y -600. 
draw steppingWith: [ :canvas |	
	canvas surface clear: Color darkGray.
	
	(xCurrent + littleSize > window extent x) | (xCurrent < 0)
		ifTrue: [incrX := incrX negated].
	(yCurrent +110>window extent y) | (yCurrent <0)
		ifTrue: [incrY := incrY negated].
	canvas pathTransform
		translateX: xCurrent
				Y: yCurrent.
	xCurrent := xCurrent + incrX.
        yCurrent := yCurrent+ incrY.
	canvas setPaint: Color blue.
	canvas drawShape: ((CircleMorph new)
	 extent: littleSize@ littleSize;color: Color blue).
	
	]';
		openWithSpec.