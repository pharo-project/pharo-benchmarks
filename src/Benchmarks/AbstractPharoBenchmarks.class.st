Class {
	#name : #AbstractPharoBenchmarks,
	#superclass : #SMarkSuite,
	#category : #Benchmarks
}

{ #category : #benchmarking }
AbstractPharoBenchmarks class >> defaultRunner [

	^ SMarkPragmaRunner 
]

{ #category : #benchmarking }
AbstractPharoBenchmarks class >> isAbstract [ 
	
	^ self name = #AbstractPharoBenchmarks
]

{ #category : #benchmarking }
AbstractPharoBenchmarks class >> iterations [
	^ 10
]

{ #category : #benchmarking }
AbstractPharoBenchmarks class >> run [ 

	^ self run: self iterations
]
