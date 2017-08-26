accessing
layer: anInteger
self flag: 'Ya no existe'.
	^ self indirectCall: #( void _cpShapeSetLayers(self, cpLayers anInteger) )