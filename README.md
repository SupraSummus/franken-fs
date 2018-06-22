Franken-FS
==========

Network file system sewed up from individual organs. Filthy experiment.

Components:
 * ~~netcat (GNU version) -- to shift data across the internet.~~
 * openssl -- to make transmitted data resistant to the bad touch, that can happen in the vasts of the network.
 * pblock ([pblock-bd](https://github.com/SupraSummus/pblock-bd), [pblock-srv](https://github.com/SupraSummus/pblock)) -- to forge sequential stream of data into random access blob.
 * ~~dm-crypt -- to encrypt blockdevice on client side and protect precious data from unmoral server administrator.~~
 * ext4 (the linux kernel implementation) -- to make dirs and files from that plain, raw block device.
 * [pgspawn](https://github.com/SupraSummus/pgspawn) + bash + socat -- to glue layers together.

Now pssst... It's not realy a network file system because it supports only one client. It's more like external HDD.

What about speed?
-----------------

Performance is not exactly stunning. (Benhmark done on Intel Atom processor, eMMC storage.)

    $ dd if=/dev/zero of=mnt/testfile bs=50M count=1 oflag=direct
    1+0 records in
    1+0 records out
    52428800 bytes (52 MB, 50 MiB) copied, 19.4377 s, 2.7 MB/s

Is this production ready?
-------------------------

Bro, of course not! Mainly I've got little trust for pblock part of the stack.

TODOs:
 * **Openssl is misconfigured. Certificates are self-signed, server accepts all connections, and client will connect to anything.**
 * Dm-crypt needs to be set up.
 * I'm searching for something more robust than openssl. I was unable to make it work with external transport, like netcat. Openssl just insists on creating it's own server using TCP/IP stack. No way to force it to use existing socket. 

Quick guide
-----------

To setup example connection, run setup script

    ./setup.sh

Before starting client, you need nbd kernel module loaded:

    modprobe nbd

Running server is just easy. Running server is just hard and it requires root.

If you need to tweak settings, you have to modify pgspawn scripts. Unfortunately.

Licensing
---------

Pls help me with that. I'm no lawyer. I wanna the code MIT, but can i do this? Some parts are GPL-ish.
