pipeline {
	environment {
		registryCredential = 'dockerhub'
		app = "blue"
	}
	agent any
	stages {
		stage('Setup Volume Folders') {
			steps {
				sh 'echo "Starting..."'
				sh 'ls -a'
				sh 'cp .env.example .env'
				sh 'mkdir -p volumes'
				sh 'mkdir -p volumes/logs'
				sh 'mkdir -p volumes/app'
			}
		}
		stage('Build & Deploy Blue Docker image') {
			when {
				environment name: 'app', value: 'blue'
			}
			steps {
				script {
					dockerImage = docker.build "ikuku/laravel-blue" + ":latest"
					docker.withRegistry('', registryCredential) {
						dockerImage.push()
					}
				}
			}
		}
		stage('Build & Deploy Green Docker image') {
			when {
				environment name: 'app', value: 'green'
			}
			steps {
				script {
					dockerImage = docker.build "ikuku/laravel-green" + ":latest"
					docker.withRegistry('', registryCredential) {
						dockerImage.push()
					}
				}
			}
		}
		stage('Deploy') {
			steps {
				sh 'kubectl apply -f ./kubectl/blue-controller.yaml'
				sh 'kubectl apply -f ./kubectl/green-controller.yaml'
			}
		}
		stage('Switch to Blue App') {
			when {
				environment name: 'app', value: 'blue'
			}
			steps {
				sh 'kubectl apply -f ./kubectl/blue-service.yaml'
				sh 'sleep 10s'
				sh 'kubectl get pods'
				sh 'kubectl get services'
			}
		}
		stage('Switch to Green App') {
			when {
				environment name: 'app', value: 'green'
			}
			steps {
				sh 'kubectl apply -f ./kubectl/green-service.yaml'
				sh 'sleep 10s'
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