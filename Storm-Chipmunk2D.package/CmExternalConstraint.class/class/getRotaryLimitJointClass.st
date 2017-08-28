static class accessor
getRotaryLimitJointClass
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraintClass cpRotaryLimitJointGetClass())
