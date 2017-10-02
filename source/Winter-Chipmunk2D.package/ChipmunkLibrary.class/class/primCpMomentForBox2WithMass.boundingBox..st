private
primCpMomentForBox2WithMass: m boundingBox: bb
	^ self ffiCall: #(cpFloat cpMomentForBox2(cpFloat m, cpBB box))