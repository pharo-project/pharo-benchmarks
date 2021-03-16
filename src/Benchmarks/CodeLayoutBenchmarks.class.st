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
CodeLayoutBenchmarks >> nullMethod [

	"Do nothing"
	^ nil
]
