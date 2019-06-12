Class {
	#name : #BenchFFILibrary,
	#superclass : #FFILibrary,
	#category : #'Benchmarks-VM'
}

{ #category : #'as yet unclassified' }
BenchFFILibrary >> longCallout: seconds [

	^ self ffiCall: #(int longCallout(int seconds))
]

{ #category : #'accessing platform' }
BenchFFILibrary >> macModuleName [ 
	^ 'testLibrary.dylib'
]
