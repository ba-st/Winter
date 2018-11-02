Class {
	#name : #WinterTiledMapObjectsLayerTest,
	#superclass : #TestCase,
	#category : 'Winter-TiledTests'
}

{ #category : #'Test SUpport' }
WinterTiledMapObjectsLayerTest >> object [

	^self
]

{ #category : #tests }
WinterTiledMapObjectsLayerTest >> testAccessging [

	| layer |

	layer := WinterTiledMapObjectsLayer new.

	self
		assert: layer objects isEmpty;
		assert: layer name equals: '';
		assert: layer offsetX equals: 1.0;
		assert: layer offsetY equals: 1.0;
		assert: layer opacity equals: 1.0;
		assert: layer visible;
		assert: layer parent isNil.

	layer
		name: 'layer';
		offsetX: 2.0;
		offsetY: 2.0;
		opacity: 2.0;
		visible: false;
		parent: self.

	self
		assert: layer name equals: 'layer';
		assert: layer offsetX equals: 2.0;
		assert: layer offsetY equals: 2.0;
		assert: layer opacity equals: 2.0;
		deny: layer visible;
		assert: layer parent equals: self
]

{ #category : #tests }
WinterTiledMapObjectsLayerTest >> testManaging [
	
	| layer |
	
	layer := WinterTiledMapObjectsLayer new.
	
	self assert: layer objects isEmpty.
	
	layer addObject: self object.
	
	self
		deny: layer objects isEmpty;
		assert: (layer objects includes: self object).
	
	layer removeObject: self object.
	
	self assert: layer objects isEmpty
]
