Class {
	#name : #AbstractClassBenchmarks,
	#superclass : #AbstractPharoBenchmarks,
	#instVars : [
		'existingTestTrait',
		'existingClass',
		'existingClassUsingATrait'
	],
	#category : #Benchmarks
}

{ #category : #benchmarking }
AbstractClassBenchmarks >> existingClass [

	^ existingClass ifNil: [ existingClass := Object subclass: self existingClassName
				instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
				classVariableNames: '' 
				package: self testPackageName ]

]

{ #category : #benchmarking }
AbstractClassBenchmarks >> existingClassName [

	^ #AnExistingTestClass
]

{ #category : #benchmarking }
AbstractClassBenchmarks >> existingClassUsingATrait [

	^ existingClassUsingATrait ifNil: [ 	
			existingClassUsingATrait := Object subclass: #ExistingClassUsingATrait
				uses: self existingTestTrait
				instanceVariableNames: 'aVar anotherVar anotherAnotherVar'
				classVariableNames: '' 
				package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractClassBenchmarks >> existingTestTrait [

	^ existingTestTrait
		ifNil: [ existingTestTrait := Trait
				named: #AExistingTestTrait
				uses: {}
				package: self testPackageName ]
]

{ #category : #benchmarking }
AbstractClassBenchmarks >> tearDown [ 
	
	super tearDown.
	existingClass := nil.
	(self testPackageName asPackageIfAbsent: [ ^ self ]) removeFromSystem. 
]

{ #category : #benchmarking }
AbstractClassBenchmarks >> testPackageName [

	^ 'Benchmark-Test-Package'
]
