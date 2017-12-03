**Plesk Team made official [Dockerfile for Plesk Panel](https://github.com/plesk/docker). Use it.**

Request trial license key [here](http://sp.parallels.com/products/plesk/trial/)
and keep it with name ```ppp_multi_version_unix_key.xml```

Run this [Parallels Plesk Panel](https://support.plesk.com/hc/en-us/articles/213912465-How-to-get-a-trial-license-for-Plesk-) image with:

    $ git clone https://github.com/ligurio/parallels-plesk-dockefile
    $ cd parallels-plesk-dockefile
    $ docker build -t sergeyb/plesk .
    $ docker run -d -P sergeyb/plesk

TODO: run only one process per container according to [Best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/#run-only-one-process-per-container)

Author: Sergey Bronnikov [@estet](https://twitter.com/estet) (estetus@gmail.com)

[Discussion]: https://www.reddit.com/r/Dockerfiles/comments/2oyx3y/parallels_plesk_panel/
