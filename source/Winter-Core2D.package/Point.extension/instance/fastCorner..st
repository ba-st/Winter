*Winter-Core2D
fastCorner: aPoint 
	"Same as corner but:
	- creates the Rectangle in less than a ms instead of several
	- does not check that the receiver has rcvr x < arg x and rcvr y < arg y
	"

	^ Rectangle fastOrigin: self corner: aPoint