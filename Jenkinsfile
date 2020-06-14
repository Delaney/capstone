pipeline {
	environment {
		registry = "ikuku/simple-laravel"
		registryCredential = 'dockerhub'
	}
	agent any
	stages {
		// stage('Setup Volume Folders') {
		// 	steps {
		// 		sh 'echo "Starting..."'
		// 		sh 'ls -a'
		// 		sh 'cp .env.example .env'
		// 		sh 'mkdir -p volumes'
		// 		sh 'mkdir -p volumes/logs'
		// 		sh 'mkdir -p volumes/app'
		// 	}
		// }
		// stage('Build Docker image') {
		// 	steps {
		// 		script {
		// 			dockerImage = docker.build registry + ":latest"
		// 		}
		// 	}
		// }
		// stage('Deploy Docker image') {
		// 	steps {
		// 		script {
		// 			docker.withRegistry('', registryCredential) {
		// 				dockerImage.push()
		// 			}
		// 		}
		// 	}
		// }
		stage('Deploy') {
			steps {
				sh 'kubectl create -f ./kubectl/controller.yaml'
				sh 'kubectl create -f ./kubectl/service.yaml'
				sh 'kubectl get pods'
				sh 'kubectl get services'
			}
		}

		// stage('Run Docker') {
		// 	steps {
		// 		sh 'docker run -d \
		// 		  --name laravel \
		// 		  -v :/var/www \
		// 		  -v /volumes/app:/var/www/storage/app \
		// 		  -v /volumes/logs:/var/www/storage/logs \
		// 		  -p 8888:80 $registry:$BUILD_NUMBER'
		// 		sh 'docker container ls'
		// 	}
		// }
		// stage('Test Web Server') {
		// 	steps {
		// 		sh 'sleep 10s'
		// 		sh 'curl --connect-timeout 5 \
		// 		  --max-time 10 \
		// 		  --retry 5 \
		// 		  --retry-delay 0 \
		// 		  --retry-max-time 40 \
		// 		  0.0.0.0:8888'
		// 	}
		// }
		// stage('Kill container') {
		// 	steps {
		// 		sh 'docker kill laravel'
		// 		sh 'docker rm laravel'
		// 	}
		// }
		// stage('Remove unused Docker image') {
		// 	steps {
		// 		sh 'docker rmi $registry:$BUILD_NUMBER'
		// 	}
		// }
	}
}