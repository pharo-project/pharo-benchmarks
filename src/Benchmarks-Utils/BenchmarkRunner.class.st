Class {
	#name : #BenchmarkRunner,
	#superclass : #Object,
	#instVars : [
		'package',
		'numberOfIterations'
	],
	#category : #'Benchmarks-Utils'
}

{ #category : #running }
BenchmarkRunner class >> forPackage: aPackage [

	^ self new
		package: aPackage
]

{ #category : #accessing }
BenchmarkRunner >> benchClasses [
	
	^ package classes select: [ :aClass | (aClass includesBehavior: SMarkSuite) and: [ aClass isAbstract not ] ]
]

{ #category : #accessing }
BenchmarkRunner >> iterations: anInteger [ 
	
	numberOfIterations := anInteger
]

{ #category : #accessing }
BenchmarkRunner >> package: aRPackage [ 
	
	package := aRPackage
]

{ #category : #executing }
BenchmarkRunner >> run [
	
	^ self benchClasses collect: [ :aBench | aBench run: numberOfIterations ]
]
