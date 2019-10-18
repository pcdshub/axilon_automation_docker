Axilon mirror automation scripts
--------------------------------

Running the scripts with Docker.

1. Viewing the help

```
$ docker run -i pcdshub/axilon-mirror-automation:latest -H
```

2. Generating the test plan

```
$ export CONFIG_PATH=/local/tests/path
$ mkdir tests
$ docker run -v $CONFIG_PATH/:/tests -i pcdshub/axilon-mirror-automation:latest -i /axilon/device-uut/share/config/config.json -i /axilon/device-uut/share/template/template.json -g /tests/prefix
Device::UUT : wrote testfile /tests/prefix-test.json
/tests/test.json
$ less $CONFIG_PATH/prefix-test.json
{
   "test_plan" : [
      {
         "uut" : "Dummy",
         "axis" : "a",
         "test_id" : "test",
         "steps" : [
            {
               "name" : [
                  "A:motor",
                  "A:encoder"
               ],
               "type" : "get"
            },
            {
               "type" : "set",
               "name" : {
...
```

3. Running the test

```
$ docker run -e USER=$USER --workdir /tests -v $CONFIG_PATH/:/tests -i pcdshub/axilon-mirror-automation:latest -i /tests/prefix-test.json --force --live -t
```


4. Exploring the image with bash

```
docker run --entrypoint /bin/bash -it pcdshub/axilon-mirror-automation:latest
```


Rebuilding
----------

The latest image should be on dockerhub, but it can be rebuilt locally by doing the following:

```
$ git clone --recursive https://github.com/pcdshub/axilon_automation_docker
$ cd axilon_automation_docker
$ docker build -t pcdshub/axilon-mirror-automation:latest .
```
