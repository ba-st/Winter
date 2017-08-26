static class accessor
getPivotJointClass
<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( CmExternalConstraintClass cpPivotJointGetClass())
