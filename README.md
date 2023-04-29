## Using Jupyter for Incident Response

Jupyter notebooks are typically thought of as a platform for data science and machine learning, but are simply a web-based platform to execute and document code. This feature makes them an excellent platform for running incident response runbook, because often times incident response amounts to gathering and interpreting data, which is the strength of the Jupyter Notebook platform. The goal is to automated the tedious task of gathering data, presenting the data to an analyst, and providing procedures and next steps for the findings. For responses that are simple to automate, those can be done with code blocks in then notebook, and for more complex remediations, the instructions can provide direction on how to handle the scenario.

The notebooks included in this repository combine automation in the form of python code cells and documentation with Markdown. Code in a Jupyter notebook can be executed step-by-step, allowing the user to interact with AWS and non-AWS resources through API calls and data visualized with graphs and charts. The incident response runbooks included in the Jupyter section differ from others in the repository because they depend on configurations within the account to simplify the automation. For example, having all of the organization CloudTrail logs in a specific Athena table means the same notebook can be used across accounts.

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

