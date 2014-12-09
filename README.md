Run this [Parallels Plesk](http://sp.parallels.com/products/plesk/) image with:

    $ docker run -d --name plesk-0 ligurio/parallels-plesk

Then [link][linking] to it from your client container:

    $ docker run --link plesk-0:plesk your-client

[Parallels Plesk]: http://sp.parallels.com/products/plesk/
[Installation Guide]: http://download1.parallels.com/Plesk/Doc/en-US/online/plesk-installation-upgrade-migration-guide/
[Linking]: https://docs.docker.com/userguide/dockerlinks/
