#GradeFast++ - Internship at e-Yantra, IIT Bombay
- 20th May 2021 - 8th July 2021

## Team
Rishav Singh, Nikhil Mankani, Sriram Srinivasan

## Mentors
Ameya Shenoy, Andrea F., Kalind Karia, Omkar Manjrekar, Parth Parikh, Lohit P.

## App Server
- App Server is made with Django, Postgres as our database, storing resources
  on S3, Redis for caching, RQ-Worker for queuing the submissions and pass it
  to Judge Server for evaluation and passing results back to app server.

## Judge Server
- The judge server is built on FastAPI which is a python based modern and high
  performance(fast) web framework for building API’s. A judge server can be
  created manually or spawned using the CLI. This judge runs on Uvicorn server
  as the base. The judge server can be used by the theme developers to add
  tasks and test submissions and also by the students to get their submissions
  evaluated. It also interacts with the docker to evaluate the submissions
  inside containers for faster and accurate results

## CLI
- CLI can be used to evaluate and test tasks on local system. The CLI
  dynamically spawns the judge server on the local host and uses the same for
  task addition and submission evaluation. There are different parameters that
  can be specified by the user for specified functions. All the parameters are
  well documented with help texts for better user experience.

## Frontend
- Made with Vue Js

## Journey
- I didn't knew about most of the technologies when started.
