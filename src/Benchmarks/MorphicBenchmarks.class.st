Class {
	#name : #MorphicBenchmarks,
	#superclass : #AbstractClassBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
MorphicBenchmarks >> benchRubrikTextRendering [
	| canvas|

	<problemSize: 25>

	canvas := FormCanvas extent: 500@500.
	(RubScrolledTextMorph new)
			setText: (String loremIpsum: 25*1024);
			font: StandardFonts codeFont;
			bounds: (0@0 corner: canvas form extent);
			fullDrawOn: canvas.
]
