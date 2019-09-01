Class {
	#name : #AthensBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

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
		can setStrokePaint: (Smalltalk ui icons iconNamed:#calendar) ]
]
