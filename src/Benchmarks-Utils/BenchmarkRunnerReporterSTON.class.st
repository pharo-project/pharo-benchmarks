Class {
	#name : #BenchmarkRunnerReporterSTON,
	#superclass : #AbstractBenchmarkCommandLineReporter,
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #'as yet unclassified' }
BenchmarkRunnerReporterSTON class >> optionName [

	^ 'ston'
]

{ #category : #accessing }
BenchmarkRunnerReporterSTON >> reportAll: smarkRunners previousRun: previousRun [
	
	STON
		put: smarkRunners
		onStreamPretty: stream.
		
	stream flush; close.
]
