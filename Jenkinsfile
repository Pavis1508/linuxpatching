pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Pavis1508/linuxpatching.git' // Changed master to main as per git output
            }
        }

        stage('Run Ansible Playbook') {
            steps {
                ansiblePlaybook(
                    installation: 'ansible',
                    playbook: 'upgrade.yml',
                    inventory: '/etc/ansible/hosts',
                    credentialsId: 'ansible-ssh-root-key', // This uses the private key from Jenkins credentials
                    // extras: '--user=root' // --user=root is redundant if username is 'root' in credentialsId
                                           // --private-key=${ANSIBLE_PRIVATE_KEY} is NOT needed because credentialsId handles it
                                           // Best practice is to let credentialsId manage the key.
                                           // If you REALLY need to specify --user, it's better placed here.
                    // For clarity, let's keep it simple:
                    // If your credentialsId specifies 'root', then --user=root is redundant.
                    // The 'credentialsId' already provides the private key.
                )
                // If you *must* specify the user via extras (e.g., if credentialsId only stores the key without a user binding)
                // then: extras: '--user=root'
                // But generally, credentialsId handles both username and key.
            }
        }
    }
}
