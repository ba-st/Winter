static class accessor
getSlideJointClass
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraintClass cpSlideJointGetClass())
