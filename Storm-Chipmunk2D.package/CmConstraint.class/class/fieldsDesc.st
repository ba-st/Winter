fields description
fieldsDesc
	"self rebuildFieldAccessors "
	^#(
	CmExternalConstraintClass klass;
	"/// The first body connected to this constraint."
	CmBody a;
	"/// The second body connected to this constraint."
	CmBody b;
	CmSpace space;
	
	CmExternalConstraint next_a;
	CmExternalConstraint next_b;
	
	"/// The maximum force that this constraint is allowed to use."
	"/// Defaults to infinity."
	cpFloat maxForce;
	"/// The rate at which joint error is corrected."
	"/// Defaults to pow(1.0 - 0.1, 60.0) meaning that it will"
	"/// correct 10% of the error every 1/60th of a second."
	cpFloat errorBias;
	"/// The maximum rate at which joint error is corrected.
	/// Defaults to infinity."
	cpFloat maxBias;
	
	"/// Function called before the solver runs.
	/// Animate your joint anchors, update your motor torque, etc."
	CmConstraintSolveCallback preSolve;
	
	"/// Function called after the solver runs.
	/// Use the applied impulse to perform effects like breakable joints."
	CmConstraintSolveCallback postSolve;
	"/// User definable data pointer.
	/// Generally this points to your the game object class so you can access it
	/// when given a cpConstraint reference in a callback."
	void * data;
	)