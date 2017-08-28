static class accessor
getGrooveJointClass
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraintClass cpGrooveJointGetClass())
