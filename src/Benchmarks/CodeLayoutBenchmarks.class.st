Class {
	#name : #CodeLayoutBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchLargeFactorial [

	1 to: self problemSize do: [ :i |
		self factorialOf: 100 ]
]

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
CodeLayoutBenchmarks >> benchSmallFactorial [

	1 to: self problemSize do: [ :i |
		self factorialOf: 17 ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchVeryLargeFactorial [

	1 to: self problemSize do: [ :i |
		self factorialOf: 1000 ]
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
CodeLayoutBenchmarks >> factorialOf: aNumber [

	| nex nexnext acc |
	"Guard for know cases (0,1,2,error)"
	aNumber < 3
		ifTrue: [ ^ aNumber < 0
				ifTrue: [ self error: 'Not valid for negative integers' ]
				ifFalse: [ aNumber > 0
						ifTrue: [ aNumber ]
						ifFalse: [ 1 ] ] ].
	acc := 2.
	nex := 2.
	nexnext := 10.
	
	1 to: aNumber // 2 - 1 do: [ :i |
		nex := nex + nexnext.
		nexnext := nexnext + 8.
		acc := acc * nex ].
	aNumber odd
		ifTrue: [ acc := acc * aNumber ].
	^ acc
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> nullMethod [

	"Do nothing"
	^ nil
]
