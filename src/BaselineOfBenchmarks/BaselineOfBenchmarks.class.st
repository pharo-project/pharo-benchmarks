Class {
	#name : #BaselineOfBenchmarks,
	#superclass : #BaselineOf,
	#category : #BaselineOfBenchmarks
}

{ #category : #baselines }
BaselineOfBenchmarks >> baseline: spec [
	<baseline>

	spec for: #common do: [ 
		
		spec 
			baseline: 'SMark' 
			with: [ 
				spec repository: 'github://guillep/SMark/repository:9b86d50' ].

		spec 
			baseline: 'NeoCSV' 
			with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].		

		spec
			baseline: 'GithubAPI'
			with: [ spec repository: 'github://guillep/github-api' ].		
		
		spec
			package: 'Benchmarks' with: [ spec requires: #('SMark') ];
			package: 'Benchmarks-Utils' with: [ spec requires: #('NeoCSV' 'SMark') ];	
			package: 'Benchmarks-Utils-Github' with: [ spec requires: #('GithubAPI') ]]
]
