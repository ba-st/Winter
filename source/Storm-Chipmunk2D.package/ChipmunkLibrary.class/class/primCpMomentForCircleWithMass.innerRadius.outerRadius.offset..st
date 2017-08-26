private
primCpMomentForCircleWithMass: m innerRadius: r1 outerRadius: r2 offset: offset
	^ self ffiCall: #(cpFloat cpMomentForCircle(cpFloat m, cpFloat  r1, cpFloat r2, cpVect offset))