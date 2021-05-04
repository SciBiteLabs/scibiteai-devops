# SciBiteAI Install and Run Guide

Use this guide to help you run a full standalone version of SciBiteAI from the same server or computer.

## Introduction
___

SciBiteAI is an Artificial Intelligence (AI) platform combining deep learning with powerful semantic algorithms to enable our customers to exploit life science data and accelerate its downstream use in research and development.

SciBiteAI enables users to rapidly load and run deep learning models, and our API provides a simple, consistent interface for both users and applications while insulating them from the complexities of the underlying implementation.

## Minimum Requirements
___

* Docker engine 
* Docker-compose
* Valid ScibiteAI license
* Dockerhub user with access to [SciBiteAI dockerhub repository](https://hub.docker.com/repository/docker/scibite/scibiteai) (access will be granted by SciBite on valid licence)

You will need docker and docker-compose installed in your server/computer. This version has being
tested with [docker](https://docs.docker.com/engine/install/) **19.03.4-ce** 
and docker compose [docker-compose](https://docs.docker.com/compose/install/) **1.24.1**. But is very likely it will work 
also with older/newer versions.

**You also need a valid SciBiteAI license.**

### Models
All models for use within SciBiteAI need to be placed in the relevant sub-directory (e.g. [ner_models](/models/ner_models) for an NER type model) of the [/models](/models) folder in the root of the repo.

As of SciBiteAI 2.0, models are required to be in the [SavedModel format](https://www.tensorflow.org/guide/saved_model). This is the universal serialization format for tensorflow models. An example 'dummy' model can be found in the repo, which illustrates exactly how the directory structure of a model should look.

*N.B. The 'dummy' model is also used as the default model for TF Serving, as it requires at least a single model to be loaded in order to run.*
## Get started
___
### Build Docker containers

To build all of the required Docker services using docker-compose, execute the following from the root of this repository: 
```bash
$ docker-compose up --build .
```

### REST API
Swagger documentation can be found at [/docs](localhost:8000/docs), where the functionality of the API can be fully tested, response models can be seen, and you can get a list of ML models and their description. Alternatively, the API endpoints can of course be accessed using the command line with tools like [cURL](https://curl.se), with something like:
```bash
$ curl --request GET http://localhost:8000/models/ner
```

### UI
The SciBiteAI user interface can be found at [/ui](localhost:8000/ui), and provides a convenient way to input data and get results from the models without having to communicate with the API manually. There is also some example data provided so that you can quickly get started and test out the software.


___
## Release Notes
___
| Build Tag  | Description |
| :----:     | :---        |
| 1.0        |       -      |
| 1.0.2      | Widely usable early version that does not check the integrity of supplied ML models|
| 1.0.3      | First version that checks the integrity of supplied models against a table of contents |
| 1.0.4      | A failed attempt to build a version using tensorflow-gpu instead of tensorflow |
| 1.0.5      | Reads versioned models and is GPU-compatible |
| 1.0.6      | Fixes omissions from requirements.txt |
| 1.0.7      | Fixed hanging UI bug for RE endpoints + other minor bug fixes |
| 1.1        | Jenkins CI pipeline in place |
| 2.0        | Large refactor and change of backend architecture |


