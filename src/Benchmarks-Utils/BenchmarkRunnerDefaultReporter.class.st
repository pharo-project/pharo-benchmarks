Class {
	#name : #BenchmarkRunnerDefaultReporter,
	#superclass : #AbstractBenchmarkCommandLineReporter,
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #'as yet unclassified' }
BenchmarkRunnerDefaultReporter class >> isDefault [ 
	
	^ true
]

{ #category : #accessing }
BenchmarkRunnerDefaultReporter >> reportAll: smarkRunners previousRun: previousRun [

	smarkRunners do: [ :aRunner | 
		SMarkSimpleStatisticsReporter new
			outputStream: self stream;
			runner: aRunner;
			report ].
	
	self stream flush.
		
]
