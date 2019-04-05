Class {
	#name : #MethodCompilingBenchmarks,
	#superclass : #AbstractPharoBenchmark,
	#category : #Benchmarks
}

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileAMethodAndModifyIt [

	self existingClass 
		compile: 'aMethod
			^ 2'.
			
	self existingClass 
		compile: 'aMethod
			^ 42'		
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileAMethodInAClassUsingATrait [

	self existingClassUsingATrait
		compile: 'aMethod
			^ 42'
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileAMethodInATraitNotUsed [

	self existingTestTrait
		compile: 'aMethod
			^ 42'
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileAMethodInATraitUsed [

	"This force the creation of the class using the trait"
	self existingClassUsingATrait.
	
	self existingTestTrait
		compile: 'aMethod
			^ 42'
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileANewMethod [

	self existingClass 
		compile: 'aMethod
			^ 42'
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchCompileANewMethodUsingInstanceVariable [

	self existingClass 
		compile: 'aMethod: aV
			anInstanceVariable := aV'
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> benchMethodAccessingAGlobal [

	self existingClass 
		compile: 'aMethod
			^ Object'.
]

{ #category : #benchmarking }
MethodCompilingBenchmarks >> problemSize [

	^ 100
]
