private
primCpMomentForBoxWithMass: m width: width height: height
	^ self ffiCall: #(cpFloat cpMomentForBox(cpFloat m, cpFloat width, cpFloat height))