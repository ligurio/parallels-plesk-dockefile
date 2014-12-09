Request trial license key [here](http://sp.parallels.com/products/plesk/trial/)
and keep it with name ```ppp_multi_version_unix_key.xml```

Run this [Parallels Plesk Panel](http://sp.parallels.com/products/plesk/) image with:

    $ git clone https://github.com/ligurio/parallels-plesk-dockefile
    $ docker build -t sergeyb/plesk parallels-plesk-dockefile/
    $ docker run -name plesk -i -t sergeyb/plesk

or use Dockefile right from Github:

    $ docker build -t sergeyb/plesk \ git@github.com:ligurio/parallels-plesk-dockefile
