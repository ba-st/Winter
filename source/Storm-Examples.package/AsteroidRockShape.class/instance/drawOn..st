drawing
drawOn: aCanvas
	| path stroke |
	
	path := aCanvas createPath: [ :builder | 
		builder 
			absolute;
			moveTo: 20@0;
			lineTo: 40@10;
			cwArcTo: 80@20 angle: Float pi / 3;
			cwArcTo: 75@45 angle: Float pi / 6;
			cwArcTo: 40@70 angle: Float pi / 6;
			lineTo: 30@60;
			lineTo: 15@55;
			lineTo: 0@30;
			cwArcTo: 20@0 angle: Float pi / 6 ].
		
	aCanvas pathTransform
		loadIdentity;
		translateBy: self position;
		rotateByDegrees: self rotated around: self extent / -2;
		scaleBy: self scaled.	
	
	aCanvas 
		clipBy: (-10@ -10 extent: self realExtent + 20)
		during: [
			stroke := aCanvas setStrokePaint: Color white.
			stroke width: 1.	
			aCanvas drawShape: path ]