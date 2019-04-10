properties([disableConcurrentBuilds()])

def runBenchmark(platform, arch){

	node(platform) {
	  cleanWs()

	  timeout(60) {
	    copyArtifacts filter: "bootstrap-cache/Pharo8.0-SNAPSHOT.build.*.arch.${arch}bit.zip", fingerprintArtifacts: true, flatten: true, projectName: 'Test pending pull request and branch Pipeline/Pharo8.0', selector: lastSuccessful()
	    sh "wget -O - get.pharo.org/${arch}/vm80 | bash"
	    sh "unzip Pharo8.0-SNAPSHOT.build.*.arch.${arch}bit.zip"
	    sh "./pharo Pharo*.image eval --save \"Metacello new baseline: 'Benchmarks'; repository:'github://tesonep/pharo-benchmarks/src'; load\""
	    sh "./pharo Pharo*.image benchmark \"Benchmarks\" --json --output=${platform}${arch}.json --iterations=20"

	    archiveArtifacts '${platform}${arch}.json'
	    stash '${platform}${arch}.json'
	  }
	}

}
 
runBenchmark('unix', 32)
runBenchmark('unix', 64)
runBenchmark('osx', 32)
runBenchmark('osx', 64)

node('unix'){
    cleanWs()
    unstash 'unix32.json'
    unstash 'osx32.json'
    unstash 'unix64.json'
    unstash 'osx64.json'

    benchmark altInputSchema: '', altInputSchemaLocation: '', inputLocation: '*.json', schemaSelection: 'defaultSchema', truncateStrings: true    
}



