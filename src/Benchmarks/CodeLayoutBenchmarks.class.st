Class {
	#name : #CodeLayoutBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfFalseConditionalBranches [

	self problemSize timesRepeat: [
		self branchManyOn: false ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfFalseConditionalWithCompensation [
	"To be executed only with false branches, to make it comparable to the true branch"
	self problemSize timesRepeat: [
		self branchManyOnWithFallthroughBody: false ]
]

{ #category : #benchmarking }
CodeLayoutBenchmarks >> benchSequenceOfTrueConditionalBranches [

	self problemSize timesRepeat: [
		self branchManyOn: true ]
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
