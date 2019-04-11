Class {
	#name : #BenchmarkFullJSONGroup,
	#superclass : #Object,
	#instVars : [
		'name',
		'tests',
		'previousRun'
	],
	#category : #'Benchmarks-Utils-Output'
}

{ #category : #accessing }
BenchmarkFullJSONGroup >> compareWith: aCollection [ 
	
	previousRun := aCollection
]

{ #category : #exporting }
BenchmarkFullJSONGroup >> forExport [
	
	^ { #name -> name. #tests -> (tests collect: #forExport) } asDictionary 
]

{ #category : #initialize }
BenchmarkFullJSONGroup >> initializeFrom: aRunner [

	name := aRunner suite class name asString.
	tests := aRunner results associations collect: [ :e | 
		BenchmarkFullJSONTest new 
			initializeFrom: e; 
			group: self;
			yourself ].
]

{ #category : #accessing }
BenchmarkFullJSONGroup >> name [
	^ name
]

{ #category : #accessing }
BenchmarkFullJSONGroup >> previousResultFor: aBenchmarkJSONResult [ 
	
	previousRun ifNil: [ ^ nil ].
	
	previousRun do: [ :aRunner | 
		(aRunner suite class name = aBenchmarkJSONResult benchmarkClassName)
			ifTrue: [ ^ aRunner results at: aBenchmarkJSONResult testName ]
	].

	^ nil
]
