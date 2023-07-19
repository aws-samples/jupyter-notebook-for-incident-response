## Using Jupyter for Incident Response

Jupyter Notebook is often thought of as an application for data science and machine learning. However Jupyter Notebook is a web-based application to run and document code for any use case. This feature makes Jupyter Notebook an excellent host for running incident response playbooks. Incident response involves gathering and interpreting data, which is the strength of the Jupyter Notebook application.

The notebooks included in this repository combine automation in the form of python code cells and documentation with Markdown. Code in a Jupyter notebook can be executed step-by-step, allowing the user to interact with AWS and non-AWS resources through API calls and data visualized with graphs and charts. The incident response plyabooks included in the Jupyter section differ from others in the repository because they depend on configurations within the account to simplify the automation. For example, having all of the organization CloudTrail logs in a specific Athena table means the same notebook can be used across accounts.
     
    
**Coming soon:**
 * CloudFormation template for deploying SageMaker Notebook instance instance inside of a VPC
 * Detailed guidance on how to deploy and use the CloudFormation template
      
## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

