Class {
	#name : #WinterEllipseMapObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'ellipse'
	],
	#category : 'Winter-TiledTests'
}

{ #category : #'Test Support' }
WinterEllipseMapObjectTest >> ellipse [

   ^ellipse
]

{ #category : #initialization }
WinterEllipseMapObjectTest >> setUp [

	ellipse := EllipseMorph new
		position: 0 @ 0;
		extent: 10 @ 10;
		yourself
]

{ #category : #tests }
WinterEllipseMapObjectTest >> testAccessing [

	| mapObject |

	mapObject := WinterEllipseMapObject of: self ellipse.

	self
		assert: mapObject x equals: self ellipse position x;
		assert: mapObject y equals: self ellipse position y;
		assert: mapObject name equals: '';
		assert: mapObject opacity equals: 1.0;
		assert: mapObject visible;
		assert: mapObject ellipse equals: self ellipse;
		assert: mapObject color equals: Color white.

	mapObject
		x: 5;
		y: 4;
		name: 'ellipse';
		opacity: 2.0;
		visible: false;
		color: Color black.

	self
		assert: mapObject x equals: 5;
		assert: mapObject y equals: 4;
		assert: mapObject name equals: 'ellipse';
		assert: mapObject opacity equals: 2.0;
		deny: mapObject visible;
		assert: mapObject color equals: Color black
]
