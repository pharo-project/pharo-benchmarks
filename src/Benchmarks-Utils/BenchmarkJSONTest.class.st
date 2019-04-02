Class {
	#name : #BenchmarkJSONTest,
	#superclass : #Object,
	#instVars : [
		'name',
		'results'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #exporting }
BenchmarkJSONTest >> forExport [
	
	^ { #name -> name. #results -> (results collect: #forExport)  } asDictionary
]

{ #category : #initialization }
BenchmarkJSONTest >> initializeFrom: anAssociation [ 
	
	name := anAssociation key.
	results := anAssociation value asArray collect: [ :e | BenchmarkJSONResult new initializeFrom: e; yourself ]
]
