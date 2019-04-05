Class {
	#name : #BenchmarkJSONResult,
	#superclass : #Object,
	#instVars : [
		'value',
		'unit'
	],
	#category : #'Benchmarks-Utils-JSON-Output'
}

{ #category : #exporting }
BenchmarkJSONResult >> forExport [
	
	^ { #name -> self name. #value -> value. #unit -> unit. #thresholds -> self percentageThresholds} asDictionary
]

{ #category : #exporting }
BenchmarkJSONResult >> name [

	^ OSPlatform current family , self platformArchitecture
]

{ #category : #accessing }
BenchmarkJSONResult >> percentageThresholds [

	^ {{ 'method' -> 'percentage'. 'percentage' -> 10 } asDictionary }
]

{ #category : #exporting }
BenchmarkJSONResult >> platformArchitecture [

	^ (Smalltalk wordSize * 8) asString
]

{ #category : #accessing }
BenchmarkJSONResult >> unit [
	^ unit
]

{ #category : #accessing }
BenchmarkJSONResult >> unit: anObject [
	unit := anObject
]

{ #category : #accessing }
BenchmarkJSONResult >> value [
	^ value
]

{ #category : #accessing }
BenchmarkJSONResult >> value: anObject [
	value := anObject
]
