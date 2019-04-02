Class {
	#name : #BenchmarkRunnerReporterJSON,
	#superclass : #SMarkSimpleStatisticsReporter,
	#instVars : [
		'groups'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #accessing }
BenchmarkRunnerReporterJSON >> endReport [

	STONJSON
		put: {(#groups -> self groupsForExport)} asDictionary
		onStreamPretty: stream
]

{ #category : #accessing }
BenchmarkRunnerReporterJSON >> groupsForExport [

	^ groups collect: [ :e | e forExport ]
]

{ #category : #accessing }
BenchmarkRunnerReporterJSON >> initialize [
	super initialize.
	groups := #()
]

{ #category : #accessing }
BenchmarkRunnerReporterJSON >> outputStream: aStream [
	
	stream := aStream.

]

{ #category : #accessing }
BenchmarkRunnerReporterJSON >> report [
	
	groups := groups copyWith: (BenchmarkJSONGroup new 
		initializeFrom: runner;
		yourself)
	
]
