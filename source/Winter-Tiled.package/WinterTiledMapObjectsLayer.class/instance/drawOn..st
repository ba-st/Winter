Drawing
drawOn: aCanvas

	"Objcts should be kind of WinterMapObject"

	objects do: [ :object | object drawOn: aCanvas ]