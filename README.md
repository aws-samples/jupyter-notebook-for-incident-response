# Using Jupyter for Incident Response
Jupyter Notebook is often thought of as an application for data science and machine learning. However Jupyter Notebook is a web-based application to run and document code for any use case. This feature makes Jupyter Notebook an excellent host for running incident response playbooks. Incident response involves gathering and interpreting data, which is the strength of the Jupyter Notebook application.

The notebooks included in this repository combine automation in the form of python code cells and documentation with Markdown. Code in a Jupyter notebook can be executed step-by-step, allowing the user to interact with AWS and non-AWS resources through API calls and data visualized with graphs and charts. The incident response plyabooks included in the Jupyter section differ from others in the repository because they depend on configurations within the account to simplify the automation. For example, having all of the organization CloudTrail logs in a specific Athena table means the same notebook can be used across accounts.

# How to use this repo

## CloudFormation
For this solution, you will host your Jupyter notebooks on a SageMaker notebook instance. We chose to use SageMaker instead of running the notebooks locally because SageMaker provides flexible compute, seamless integration with CodeCommit and GitHub, temporary credentials through AWS [Identity and Access Management (IAM)](https://aws.amazon.com/iam/) roles, and lower latency for Athena queries.

You can deploy the  SageMaker notebook instance by using the AWS CloudFormation template from [our jupyter-notebook-for-incident-response GitHub repository](https://github.com/aws-samples/jupyter-notebook-for-incident-response/blob/main/blog-artifacts/SageMaker_Infra_Cloudformation.yml).



## Athena Table
The solution uses Athena to query CloudTrail logs in this scenario. You need to create an Athena table for CloudTrail.

There are two main ways of creating an Athena table for CloudTrail.
 * First is through the [AWS Security Analytics Bootstrap](https://aws.amazon.com/blogs/opensource/introducing-aws-security-analytics-bootstrap/). We highly recommend using this bootstrap because you can perform security investigations on different types of AWS service logs. To get the CloudFormation template for the bootstrap, see [Athena_infra_setup.yml](https://github.com/awslabs/aws-security-analytics-bootstrap/blob/main/AWSSecurityAnalyticsBootstrap/cfn/Athena_infra_setup.yml).
 * Alternatively, you can create your Athena table for CloudTrail logs through the CloudTrail console. For instructions, see [Using the CloudTrail console to create an Athena table for CloudTrail logs](https://docs.aws.amazon.com/athena/latest/ug/cloudtrail-logs.html#create-cloudtrail-table-ct). One advantage of this approach is that it will be quicker to set up.


## Playbooks

There is a folder in this repo titled [playbooks](https://github.com/timmanik/jupyter-notebook-for-incident-response/tree/main/playbooks). It contains subfolders for different types of playbooks. Inside of each playbook folder, there are two notebooks: one for detection and one for containment.

We recommend that you clone this repo into the environment you use to work with Jupyter notebooks - either your local machine or your SageMaker Notebook Instance.

Inside of the [playbooks](https://github.com/timmanik/jupyter-notebook-for-incident-response/tree/main/playbooks) folder, there are detailed instructions on how to use the notebooks provided.

Additionally, we highly encourage you to give us your feedback on this repo as well as suggestions on things that you want to see next.


    
# Coming Soon
 * CloudFormation template for deploying SageMaker Notebook instance instance inside of a VPC
 * Detailed guidance on how to deploy and use the CloudFormation template
      
## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

