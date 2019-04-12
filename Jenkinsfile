properties([disableConcurrentBuilds()])

def runBenchmark(platform, arch){

	stage("${platform}${arch}"){
		node(platform) {
			cleanWs()

			timeout(60) {
				copyArtifacts filter: "bootstrap-cache/Pharo8.0-SNAPSHOT.build.*.arch.${arch}bit.zip", fingerprintArtifacts: true, flatten: true, projectName: env.originProjectName, selector: lastSuccessful()

				copyArtifacts filter: "baseline-${platform}${arch}.ston", fingerprintArtifacts: true, optional: true, projectName: 'pharo-benchmarks', selector: lastSuccessful()
				

				sh "wget -O - get.pharo.org/${arch}/vm80 | bash"
				sh "unzip Pharo8.0-SNAPSHOT.build.*.arch.${arch}bit.zip"
				sh "./pharo Pharo*.image eval --save \"Metacello new baseline: 'Benchmarks'; repository:'github://tesonep/pharo-benchmarks/src'; load\""
				
				sh "./pharo Pharo*.image benchmark \"Benchmarks\" --full-json=${platform}${arch}.json --ston=${platform}${arch}.ston --iterations=5 --previousRun=baseline-${platform}${arch}.ston"

				if(env.isPR == false){
					shell "cp ${platform}${arch}.ston baseline-${platform}${arch}.ston"
				}

				archiveArtifacts "${platform}${arch}.json"
				archiveArtifacts "${platform}${arch}.ston"
				archiveArtifacts "baseline-${platform}${arch}.ston"

				stash includes: "${platform}${arch}.json", name: "${platform}${arch}"
			}
		}
	}
}

def notifyBuild(status){

	if(status == 'success'){
		message = "The benchmarks do not show regressions."
	}else{
		message = "The benchmarks show regressions."
	}

	url = env.JOB_URL
	commit = env.commit

	githubNotify account: 'pharo-project', context: 'continuous-integration/benchmarks', credentialsId: 'pharo-ci', description: message, repo: 'pharo', sha: commit, status: status, targetUrl: url
}
 
runBenchmark('unix', 32)
//runBenchmark('unix', 64)
//runBenchmark('osx', 32)
//runBenchmark('osx', 64)

stage('notification'){
	node('unix'){
	
	    cleanWs()
	    unstash 'unix32'
//	    unstash 'osx32'
//	    unstash 'unix64'
//	    unstash 'osx64'

		try{
			benchmark altInputSchema: '', altInputSchemaLocation: '', inputLocation: '*.json', schemaSelection: 'defaultSchema', truncateStrings: true    
			notifyBuild("success")
		} catch (e){
			notifyBuild("failure")
			throw e
		}
	}
}


