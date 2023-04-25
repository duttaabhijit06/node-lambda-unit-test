# Unit Testing of AWS lambda functions (Node.js) using Mocha and Chai
# SAM CLI Based Deployment

## Quick Guide

1. Run `npm install` to install dependencies.

2. Run `npm run test` to run the test cases.

3. To run the lambda function locally, open `src/lambda/app.js` and uncomment a section of code (line 12 to 15). Then run `npm run start` command in the terminal to execute the lambda.

## Prerequisites

* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
* [AWS Serverless Application Model (SAM) CLI](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
* [NodeJS 18.x](https://nodejs.org/en/download)
* [Make build utility](https://www.gnu.org/software/make/)

## Tools/Libraries Used

- [Mocha](https://mochajs.org/)
- [Chai](https://www.chaijs.com/)
- [Proxyquire](https://www.npmjs.com/package/proxyquire)
- [Lambda Tester](https://www.npmjs.com/package/lambda-tester)

## Make commands for test and deployment

The project Makefile contains helper commands for working with the project:
* ```make install```: Create a Python Virtual Envionment and install dependencies
* ```make test```: Run a unit test, guarding for socket connections
* ```make deploy```: Deploy the stack to an AWS Account
* ```make deploy.g```: Deploy the stack to an AWS Account, prompting for stack parameters

## Running the project

* First, create the Python Virtual Environment by using the ```make install``` command.
* Run the unit tests with the ```make test``` command.
* To (optionally) deploy the project, use the ```make deploy.g``` command.

* To try the endpoint:
  * Find the API URL for the POST endpoint is listed as "oAPIEndpoint" the "Outputs" section of the CloudFormation script.  
  * You can test with a `curl` command, replacing the API Gateway endpoint in the curl request below:  
  ```curl -X POST https://{API Gateway endpoint}/Prod/NodeLambda  -H 'Content-Type: application/json' -d '{ "searchText": 100, "filterBy": "departmentId" }'```

