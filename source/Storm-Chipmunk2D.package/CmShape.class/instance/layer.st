accessing
layer
self flag: 'Ya no existe'.
	^ self indirectCall: #( cpLayers _cpShapeGetLayers(self) )	