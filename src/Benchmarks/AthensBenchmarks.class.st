Class {
	#name : #AthensBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
AthensBenchmarks >> benchPaintIcons [

	<problemSize:5000>

	| icons width height surf |
	icons := Smalltalk ui icons icons values first:10.

	width := icons sum: #width.
	height:= icons max: #height.

	surf := AthensCairoSurface extent: width@height.
	surf drawDuring: [ :aCanvas | |shape delta end |

		delta := 0@0.
		
		icons do: [ :icon |
			shape := aCanvas createRectanglePath: (0@0 corner: (icon width @icon height)).
		
		 	aCanvas pathTransform translateBy: delta.
			aCanvas setShape: shape.
			aCanvas setPaint: icon.
			aCanvas draw.

			delta := icon width@0.
		]
	].
]

{ #category : #benchmarking }
AthensBenchmarks >> benchStrokePainting [

	<problemSize: 500>

	| surf |

	surf := AthensCairoSurface extent: 440@440.
	
	surf drawDuring: [:can |
		| p |
		surf clear.
		can pathTransform
			scaleBy: 3;
			translateX: 10 Y: 10.
		p:= can createPath: [:path | |halfPi |
				halfPi := Float pi /2.
				path 
					relative;
					moveTo: 10@0;
					lineTo: 40@0;
					ccwArcTo: 10@10 angle: halfPi;
					lineTo: 0@40;
					cwArcTo: -10@10 angle: halfPi;
					lineTo: -40@0;
					cwArcTo: -10@ -10 angle: halfPi;
					lineTo: 0@ -40;
					ccwArcTo: 10@ -10 angle: halfPi].
				
		can setShape: p.
		can setPaint: Color white.
		can draw.
		can setStrokePaint: Color red.
		can draw ]
]

{ #category : #benchmarking }
AthensBenchmarks >> benchStrokePaintingUsingIcons [

	<problemSize: 500>

	| surf |

	surf := AthensCairoSurface extent: 440@440.
	
	surf drawDuring: [:can |
		| p |
		surf clear.
		can pathTransform
			scaleBy: 3;
			translateX: 10 Y: 10.
		p:= can createPath: [:path | |halfPi |
				halfPi := Float pi /2.
				path 
					relative;
					moveTo: 10@0;
					lineTo: 40@0;
					ccwArcTo: 10@10 angle: halfPi;
					lineTo: 0@40;
					cwArcTo: -10@10 angle: halfPi;
					lineTo: -40@0;
					cwArcTo: -10@ -10 angle: halfPi;
					lineTo: 0@ -40;
					ccwArcTo: 10@ -10 angle: halfPi].
				
		can setShape: p.
		can setPaint: Color white.
		can draw.
		can setStrokePaint: (Smalltalk ui icons iconNamed:#calendar).
		can draw ]
]
