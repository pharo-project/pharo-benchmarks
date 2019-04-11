Class {
	#name : #BenchmarkRunnerReporterFullJSON,
	#superclass : #AbstractBenchmarkCommandLineReporter,
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #'as yet unclassified' }
BenchmarkRunnerReporterFullJSON class >> optionName [

	^ 'full-json'
]

{ #category : #accessing }
BenchmarkRunnerReporterFullJSON >> reportAll: smarkRunners previousRun: previousRun [

	| groups |

	groups := smarkRunners collect: [ :runner | (BenchmarkFullJSONGroup new 
		initializeFrom: runner;
		compareWith: previousRun;
		yourself)] as: Array.
	
	STONJSON
		put: {#groups -> (groups collect: [ :e | e forExport ])} asDictionary
		onStreamPretty: stream.
		
	stream flush; close.
]
