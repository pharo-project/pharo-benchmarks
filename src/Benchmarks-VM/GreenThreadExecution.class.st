Class {
	#name : #GreenThreadExecution,
	#superclass : #AbstractPharoBenchmarks,
	#category : #'Benchmarks-VM'
}

{ #category : #benchmarking }
GreenThreadExecution >> benchConcurrentLongBlockingCallout [

	| semaphore block |
	semaphore := Semaphore new.
	block := [BenchFFILibrary uniqueInstance longCallout: 1. semaphore signal].
	
	block fork.
	block fork.
	
	semaphore wait.
	semaphore wait.	
]

{ #category : #benchmarking }
GreenThreadExecution >> benchDifferentPriorityProcesses [

	<problemSize: 20>

	| semaphore p1 p2 p3 |
	semaphore := Semaphore new.
	p1 := self sameProcessSignaling: semaphore.
	p2 := self sameProcessSignaling: semaphore.	
	p3 := self sameProcessSignaling: semaphore.
	
	p1 forkAt: 39.
	p2 forkAt: 38.
	p3 forkAt: 37.
	
	"Waits for the finalization of the threads"
	semaphore wait.
	semaphore wait.
	semaphore wait.		
]

{ #category : #benchmarking }
GreenThreadExecution >> benchLongBlockingSingleCallouts [

	<problemSize: 2>

	BenchFFILibrary uniqueInstance longCallout: 1
]

{ #category : #benchmarking }
GreenThreadExecution >> benchSamePriorityProcesses [

	<problemSize: 20>

	| semaphore p1 p2 p3 |
	semaphore := Semaphore new.
	p1 := self sameProcessSignaling: semaphore.
	p2 := self sameProcessSignaling: semaphore.	
	p3 := self sameProcessSignaling: semaphore.
	
	p1 fork.
	p2 fork.
	p3 fork.
	
	"Waits for the finalization of the threads"
	semaphore wait.
	semaphore wait.
	semaphore wait.		
]

{ #category : #benchmarking }
GreenThreadExecution >> benchYieldingSamePriorityProcesses [

	<problemSize: 20>

	| semaphore p1 p2 p3 |
	semaphore := Semaphore new.
	p1 := self yieldingProcessSignaling: semaphore.
	p2 := self yieldingProcessSignaling: semaphore.	
	p3 := self yieldingProcessSignaling: semaphore.
	
	p1 fork.
	p2 fork.
	p3 fork.
	
	"Waits for the finalization of the threads"
	semaphore wait.
	semaphore wait.
	semaphore wait.		
]

{ #category : #benchmarking }
GreenThreadExecution >> sameProcessSignaling: aSemaphore [

	^ [ 
		100 timesRepeat: [  
			600 factorial.
		].
	
		aSemaphore signal
	]
]

{ #category : #benchmarking }
GreenThreadExecution >> yieldingProcessSignaling: aSemaphore [

	^ [ 
		100 timesRepeat: [  
			600 factorial.
			Processor yield.	
		].
	
		aSemaphore signal
	]
]
