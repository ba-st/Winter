instance creation
for: aConstraint withA: bodya andB:  bodyb
	^ self new
		constraint: aConstraint specialize;
		bodya: bodya;
		bodyb: bodyb;
		yourself