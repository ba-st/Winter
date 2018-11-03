Class {
	#name : #WinterPolylineMapObjectTest,
	#superclass : #TestCase,
	#instVars : [
		'polyline'
	],
	#category : 'Winter-TiledTests'
}

{ #category : #'Test Support' }
WinterPolylineMapObjectTest >> polyline [

	^ polyline
]

{ #category : #initialization }
WinterPolylineMapObjectTest >> setUp [

	polyline := LineSegment from: 0 @ 0 to: 1 @ 1
]

{ #category : #tests }
WinterPolylineMapObjectTest >> testAccessing [

	| mapObject |

	mapObject := WinterPolylineMapObject of: self polyline atX: 2 andY: 3.

	self
		assert: mapObject x equals: 2;
		assert: mapObject y equals: 3;
		assert: mapObject name equals: '';
		assert: mapObject opacity equals: 1.0;
		assert: mapObject visible;
		assert: mapObject polyline equals: self polyline;
		assert: mapObject color equals: Color white.

	mapObject
		x: 5;
		y: 4;
		name: 'polyline';
		opacity: 2.0;
		visible: false;
		color: Color black.

	self
		assert: mapObject x equals: 5;
		assert: mapObject y equals: 4;
		assert: mapObject name equals: 'polyline';
		assert: mapObject opacity equals: 2.0;
		deny: mapObject visible;
		assert: mapObject color equals: Color black
]
