Class {
	#name : #GTSpotterBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#category : #Benchmarks
}

{ #category : #benchmarking }
GTSpotterBenchmarks >> benchEmptyQuery [
	<problemSize: 2>
	self executeQuery: ''
]

{ #category : #benchmarking }
GTSpotterBenchmarks >> benchGTPackageQuery [
	<problemSize: 2>
	self executeQuery: 'GT'
]

{ #category : #benchmarking }
GTSpotterBenchmarks >> benchMessageQuery [
	<problemSize: 2>
	self executeQuery: 'asClass'
]

{ #category : #benchmarking }
GTSpotterBenchmarks >> executeQuery: aString [
	| spotter step aCurrentContext |

	spotter := GTSpotter new.
	spotter steps isEmpty
		ifTrue: [ spotter addStep: (spotter newStep origin: spotter foundationOrigin) ].
	step := spotter currentStep.
	step context: (step newContextForQuery: aString).
	aCurrentContext := step context.
	step spotter
		notifyContextChangedFrom: step lastSearchContext
		to: step context.
	step processContext: aCurrentContext
]
