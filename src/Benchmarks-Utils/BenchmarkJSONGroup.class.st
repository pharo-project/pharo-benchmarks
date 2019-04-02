Class {
	#name : #BenchmarkJSONGroup,
	#superclass : #Object,
	#instVars : [
		'name',
		'tests'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #exporting }
BenchmarkJSONGroup >> forExport [
	
	^ { #name -> name. #tests -> (tests collect: #forExport) } asDictionary 
]

{ #category : #INITIALIZE }
BenchmarkJSONGroup >> initializeFrom: aRunner [

	name := aRunner class name.
	tests := aRunner results associations collect: [ :e | BenchmarkJSONTest new initializeFrom: e; yourself ].
]
