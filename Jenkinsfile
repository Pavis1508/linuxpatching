pipeline {
    agent any

    environment {
        // Optional: if you want to use a specific private key file
        ANSIBLE_PRIVATE_KEY = '/var/lib/jenkins/.ssh/id_rsa'
    }

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
                    inventory: '/etc/ansible/hosts',
                    credentialsId: 'ansible-ssh-root-key',
                    extras: '--user=root --private-key=${ANSIBLE_PRIVATE_KEY}'
                )
            }
        }
    }
}
