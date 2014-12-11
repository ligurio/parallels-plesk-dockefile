Request trial license key [here](http://sp.parallels.com/products/plesk/trial/)
and keep it with name ```ppp_multi_version_unix_key.xml```

Run this [Parallels Plesk Panel](http://sp.parallels.com/products/plesk/) image with:

    $ git clone https://github.com/ligurio/parallels-plesk-dockefile
    $ docker build -t sergeyb/plesk parallels-plesk-dockefile/
    $ docker run -name plesk -i -t sergeyb/plesk

TODO: run only one process per container according to [Best practices for writing Dockerfiles](https://docs.docker.com/articles/dockerfile_best-practices/#run-only-one-process-per-container)

Author: Sergey Bronnikov [@estet](https://twitter.com/estet) (estetus@gmail.com)

[Discussion]: https://www.reddit.com/r/Dockerfiles/comments/2oyx3y/parallels_plesk_panel/
