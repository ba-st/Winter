private
primCpMomentForSegmentWithMass: m from: a to: b
	^ self ffiCall: #(cpFloat cpMomentForSegment(cpFloat m, cpVect a, cpVect b))