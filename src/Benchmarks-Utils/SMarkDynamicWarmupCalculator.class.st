"
# Step 1 
We compute the number of iterations so a benchmark becomes noticeable.
In this case, we measure the number of times to execute it so it takes 300ms

```
autotunner := SMarkAutosizeRunner new.
autotunner targetTime: 300.

suite := SMarkCompiler new.
suite runOnly: #benchCompiler.

autotunner suite: suite.
autotunner problemSize: 1.
autotunner execute.
```

# Step 2
Benchmark the problem for a large number of iterations (say 1000), using as problem size the number of iterations computed in step 1.

```
runner := SMarkRunner new.
runner suite: suite.
runner iterations: 1000.
runner problemSize: autotunner innerLoopIterations.

[result := runner execute] forkAt: 80.
```

# Step 3 (optional)
Compute the smaller threshold for which we have a decent coefficientOfVariation

```
5000 to: 0 by: -1 do: [ :e |
	last := (e / 100000) asFloat.
	c := SMarkDynamicWarmupCalculator new.
	c threshold: (e / 100000) asFloat.
	c iterations: (runner results anyOne first: 1000).
	c steadyStateIteration.
].
```


# Step 4
Compute the steady state window for a given threshold.

```
c := SMarkDynamicWarmupCalculator new.
c threshold: 0.02.
c iterations: (runner results anyOne first: 1000).
steadystate := c steadyStateIteration.

BenchmarkRunnerDefaultReporter new
	stream: Transcript;
	reportAll: { runner }
	previousRun: nil.
```	
	

Step 5
Plot it

```	
""Full""
c := RSChart new.
c addPlot: (RSLinePlot new x: (1 to: 1000) y: ((runner results anyOne first: 1000) collect: #total)).

c addPlot: (RSLinePlot new
	x: (10 to: 1000)
	y: ((10 to: 1000) collect: [ :i | (((runner results anyOne first: 1000) collect: #total) copyFrom: i - 9 to: i) average ])).
c addDecoration: (RSXMarkerDecoration new value: steadystate second).

c addDecoration: RSHorizontalTick new.
c addDecoration: RSVerticalTick new.
c build.

""Scoped""
c := RSChart new.
c addPlot: (RSLinePlot new
	x: (steadystate second to: steadystate third)
	y: (steadystate first collect: #total)).
c addDecoration: RSHorizontalTick new.
c addDecoration: RSVerticalTick new.
c build.

""Whiskas""
c := RSChart new.
c
	addPlot: (RSBoxPlot new x: { 1 . 2 . 3 . 4 }
	y: {
	(runner results anyOne collect: #total) copyFrom: 1 to: 250.
	(runner results anyOne collect: #total) copyFrom: 251 to: 500.
	(runner results anyOne collect: #total) copyFrom: 501 to: 750.
	(runner results anyOne collect: #total) copyFrom: 751 to: 1000 }).
c addDecoration: RSHorizontalTick new.
c addDecoration: RSVerticalTick new.
c minValueY: 500.
c build.
```
"
Class {
	#name : #SMarkDynamicWarmupCalculator,
	#superclass : #Object,
	#instVars : [
		'iterations',
		'threshold'
	],
	#category : #'Benchmarks-Utils-Core'
}

{ #category : #accessing }
SMarkDynamicWarmupCalculator >> iterations [

	^ iterations
]

{ #category : #accessing }
SMarkDynamicWarmupCalculator >> iterations: anObject [

	iterations := anObject
]

{ #category : #statistics }
SMarkDynamicWarmupCalculator >> meanOf: aCollection [ 
	
	^ (aCollection collect: [ :e | e total ]) average
]

{ #category : #statistics }
SMarkDynamicWarmupCalculator >> steadyStateIteration [
	"Taken from Statistically Rigorous Java Performance Evaluation.
	See section 4, steady state.
	
	We rename some variables here for readability.
	windowOfMeasurement = k
	si = i + windowOfMeasurement - 1
	"
	| windowOfMeasurement kIterations times mean standardDeviation coefficientOfVariation mincov |
	windowOfMeasurement := 30.
	mincov := SmallInteger maxVal.
	1 to: iterations size - windowOfMeasurement do: [ :i |
		kIterations := iterations copyFrom: i to: i + windowOfMeasurement - 1.
		
		times := kIterations collect: [ :e | e total ].
		mean := times average.
		standardDeviation := times stdev.
		coefficientOfVariation := standardDeviation / mean.
		
		mincov := mincov min: coefficientOfVariation.
		coefficientOfVariation < threshold
			ifTrue: [ ^ {kIterations . i . i + windowOfMeasurement - 1 . coefficientOfVariation} ].
	 ].
	self error: 'Did not find a window'
]

{ #category : #accessing }
SMarkDynamicWarmupCalculator >> threshold [

	^ threshold
]

{ #category : #accessing }
SMarkDynamicWarmupCalculator >> threshold: anObject [

	threshold := anObject
]
