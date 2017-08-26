examples
example1
	"self example1"
	self new 
		title: 'Translate Example';
		text: 'window extent: 640@360.

x := 0.
dim := 80.

draw steppingWith: [ :canvas |  | rect |
	canvas surface clear: Color darkGray.
		
	"movement"
	x := x + 0.8.
	x > (window extent x + dim) 
		ifTrue: [ x := dim negated ].
	
	rect := ((dim negated/2)@(dim negated/2) extent: dim@dim).
	
	canvas setShape: rect.
	
	"rect 1"
	canvas pathTransform 
		translateX: x Y: ((window extent y/2) - (dim/2)).
	canvas setPaint: Color white.
	canvas draw.		
	"rect 2"
	canvas pathTransform 
		translateX: x Y: dim.
	canvas setPaint: Color black.
	canvas draw
	 ] ';
		openWithSpec.