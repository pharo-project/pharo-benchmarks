Class {
	#name : #CodeLayoutBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfFalseConditionalBranches [

	1 to: self problemSize do: [ :i |
		self branchManyOnFalse: false ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfFalseConditionalWithCompensation [
	"To be executed only with true branches, to make it comparable to the false branch"
	1 to: self problemSize do: [ :i |
		self branchManyOnFalseWithCompensation: true ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfFalseFallthroughs [

	1 to: self problemSize do: [ :i |
		self branchManyOn: false ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfTrueConditionalBranches [

	1 to: self problemSize do: [ :i |
		self branchManyOn: true ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfTrueConditionalWithCompensation [
	"To be executed only with false branches, to make it comparable to the true branch"
	1 to: self problemSize do: [ :i |
		self branchManyOnTrueWithCompensation: false ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfTrueFallThroughs [

	1 to: self problemSize do: [ :i |
		self branchManyOnFalse: true ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOn: aBoolean [

	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
	aBoolean ifTrue: [ self nullMethod ].
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOnFalse: aBoolean [

	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].
	aBoolean ifFalse: [ self nullMethod ].

]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOnFalseWithCompensation: aBoolean [

	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
	aBoolean ifFalse: [ self nullMethod ].
	self nullMethod.
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOnIfTrueIfFalse: aBoolean [

	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
	aBoolean
		ifTrue: [ self nullMethod ]
		ifFalse: [ self nullMethod ].
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOnTrueWithCompensation: aBoolean [

	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> branchManyOnWithFallthroughBody: aBoolean [

	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
	aBoolean ifTrue: [ self nullMethod ].
	self nullMethod.
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> nullMethod [

	"Do nothing"
	^ nil
]
