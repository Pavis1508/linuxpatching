pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Pavis1508/linuxpatching.git'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook installation: '/home/ansible-playbooks', playbook: 'upgrade.yml'
            }
        }
    }
}
