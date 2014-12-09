Run this [Parallels Plesk Panel](http://sp.parallels.com/products/plesk/) image with:

Request trial license key [here](http://sp.parallels.com/products/plesk/trial/)
and keep it with name ```plesk_12_license_key.xml```

    $ git clone https://github.com/ligurio/parallels-plesk-dockefile
    $ docker build -t sergeyb/plesk parallels-plesk-dockefile/

or use Dockefile right from Github:

    $ docker build -t sergeyb/plesk \ git@github.com:ligurio/parallels-plesk-dockefile

[Parallels Plesk]: http://sp.parallels.com/products/plesk/
[Installation Guide]: http://download1.parallels.com/Plesk/Doc/en-US/online/plesk-installation-upgrade-migration-guide/
[Linking]: https://docs.docker.com/userguide/dockerlinks/
