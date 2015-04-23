# docker-spark-postgresql-base

Docker image that contains a spark build which has been compiled with postgresql driver.

The idea is that if we can include the larger libraries as part of the docker image, we won't have to spend time downloading them every time we start a Spark executor because Docker will cache them.

For simplicity, I've compiled the postgresql driver into Spark. This saves us from classpath issues, adding jars for spark to distribute, security contexts etc..

See:

  * [nickpoorman/docker-mesos](https://github.com/nickpoorman/docker-mesos)
  * [nickpoorman/docker-spark-postgresql](https://github.com/nickpoorman/docker-spark-postgresql)
