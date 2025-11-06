pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Pavis1508/linuxpatching.git'
            }
        }
        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    installation: 'ansible',
                    playbook: 'upgrade.yml',
                    inventory: '/etc/ansible/hosts'
                )
            }
        }
    }
}
