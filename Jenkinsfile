pipeline {
    agent any

    environment {
        TELEGRAM_BOT_TOKEN = credentials('telegram-bot-token')
        TELEGRAM_CHAT_ID   = credentials('telegram-chat-id')
    }

    stages {
        stage('Clone Test Repo') {
            steps {
                git url: 'https://github.com/yourusername/robot-tests.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t robot-tests .'
            }
        }

        stage('Run Robot Tests in Docker') {
            steps {
                sh 'docker run --rm --name robot-tests robot-tests'
            }
        }
    }

    post {
        success {
            script {
                def successMessage = """
✅ Robot Test Passed
🧪 Target: https://rahulshettyacademy.com/seleniumPractise/#/
📥 Job: ${env.JOB_NAME}
🎱 Build: ${env.BUILD_NUMBER}
"""
                sh """
                curl -s -X POST https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage \
                -d chat_id=${TELEGRAM_CHAT_ID} \
                -d text="${successMessage}"
                """
            }
        }

        failure {
            script {
                def failMessage = """
❌ Robot Test FAILED
🧪 Target: https://rahulshettyacademy.com/seleniumPractise/#/
📥 Job: ${env.JOB_NAME}
🎱 Build: ${env.BUILD_NUMBER}
"""
                sh """
                curl -s -X POST https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage \
                -d chat_id=${TELEGRAM_CHAT_ID} \
                -d text="${failMessage}"
                """
            }
        }

        always {
            archiveArtifacts artifacts: 'results/**', fingerprint: true
        }
    }
}
