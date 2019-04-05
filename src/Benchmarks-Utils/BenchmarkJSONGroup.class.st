Class {
	#name : #BenchmarkJSONGroup,
	#superclass : #Object,
	#instVars : [
		'name',
		'tests'
	],
	#category : #'Benchmarks-Utils-JSON-Output'
}

{ #category : #exporting }
BenchmarkJSONGroup >> forExport [
	
	^ { #name -> name. #tests -> (tests collect: #forExport) } asDictionary 
]

{ #category : #INITIALIZE }
BenchmarkJSONGroup >> initializeFrom: aRunner [

	name := aRunner suite class name asString.
	tests := aRunner results associations collect: [ :e | BenchmarkJSONTest new initializeFrom: e; yourself ].
]
