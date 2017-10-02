instance creation
fromRectangle: aRect
	^self new
		t: aRect top;
		l: aRect left;
		b: aRect bottom;
		r: aRect right;
		yourself