Class {
	#name : #SMarkPragmaRunner,
	#superclass : #SMarkCogRunner,
	#instVars : [
		'package',
		'numberOfIterations'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #benchmarking }
SMarkPragmaRunner >> problemSizeOf: aSelector from: aSuite [
	| method |
	method := aSuite class lookupSelector: aSelector.

	^ method pragmas
		detect: [ :pragma | pragma selector = #problemSize: ]
		ifFound: [ :p | p arguments first ]
		ifNone: [ aSuite problemSize ifNil: [ ^ 1 ] ]
]

{ #category : #benchmarking }
SMarkPragmaRunner >> timedBenchmarkExecution: aSelector [
	"Will do a timed execution of the benchmark and return the result timer"
	| timer resultCollection |
	timers := Dictionary new.

	problemSize := self problemSizeOf: aSelector from: suite. 
	resultCollection := OrderedCollection new: problemSize.

	timer := self createTimer: 'total'.
	
	timer start.
	
	resultCollection add: (suite perform: aSelector).
	timer stop.
	suite processResult: resultCollection withTimer: timer.
	
	self recordResults: timer for: aSelector.
	
	^ timer
]
