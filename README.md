# Infra-terraform
A place to create infra resources for other personal projects 

The idea is to deploy a kubernete cluster in different provider, originally AWS but then it changed to include localhost tools. Eventually will do Azure deployments

By using Terraform I can follow Infrastructure as a Code (good) practices and make sure the same core structure can be replicated across different providers.
The application to be deployed is the same across every single process and can be found at https://github.com/nahuels-mza/koala-hostel
