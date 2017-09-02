examples
example2
	"self  example2 "

	self new 
		title: 'Rotate Example';
		text: 'window extent: 600@400.
a := 0.
rSize := window extent x / 6.

draw steppingWith: [ :canvas |	
	canvas surface clear: Color darkGray.

	a := a + 0.005.
	a > (Float pi * 2)
		ifTrue: [ a := 0 ].
	
	canvas pathTransform
		translateX: window extent x / 2 Y: window extent y / 2.
		
	canvas pathTransform
		rotateByRadians: a * 2.
	canvas setPaint: Color white.
	canvas drawShape: ((rSize negated@rSize negated) extent: (rSize@rSize)).
	
	canvas pathTransform
		rotateByRadians: a * 2.002.
	canvas setPaint: Color black.
	canvas drawShape: ((rSize negated@rSize negated) extent: (rSize@rSize)) ]';
		openWithSpec.