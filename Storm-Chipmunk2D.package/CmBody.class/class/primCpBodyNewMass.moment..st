private
primCpBodyNewMass: m moment: i
	^ self ffiCall: #(cpBody* cpBodyNew(cpFloat m, cpFloat i))