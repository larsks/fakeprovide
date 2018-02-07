Fakeprovide
===========

*Fakeprovide* lets you satisfy RPM dependencies by creating a wrapper
package that provides the named dependency of your choice.  You can use
this if you are working with a package from a third party that for some
reason has non-critical unsatisfied dependencies.

For example, sometimes vendors goof:

    $ sudo yum install google-talkplugin_current_x86_64.rpm
    Loaded plugins: langpacks, presto, refresh-packagekit
    Setting up Install Process
    Resolving Dependencies
    --> Running transaction check
    ---> Package google-talkplugin.x86_64 0:2.5.6.0-1 will be installed
    --> Processing Dependency: libnpgtpo3dautoplugin.so for package: google-talkplugin-2.5.6.0-1.x86_64
    --> Finished Dependency Resolution
    Error: Package: google-talkplugin-2.5.6.0-1.x86_64 (google-talkplugin)
               Requires: libnpgtpo3dautoplugin.so
     You could try using --skip-broken to work around the problem
     You could try running: rpm -Va --nofiles --nodigest

Using fakeprovide, you can simply do this::

    $ fakeprovide libnpgtpo3dautoplugin.so
    $ sudo yum install google-talkplugin_current_x86_64.rpm \
      fakeprovide-libnpgtpo3dautoplugin.so-20111122163010-1.fc16.noarch.rpm

This is better than simply running `rpm --nodeps ...` because you are left
with a valid dependency tree, and `yum` has actually started to maintain some
metadata outside of rpm (so running `rpm` directly is discouraged).

Options
=======

The `fakeprovide` script supports the following options:

- `-a` *arch* -- set the build architecture (normally *noarch*).
- `-s` *summary* -- set the package summary and description.
- `-v` *version* -- set the package version.
- `-B` -- DO NOT build the binary rpm.
- `-S` -- DO build the source rpm.
- `-P` -- Specify extra provides

Installation
============

Installation is very simple:

    $ sudo make install

By default, `fakeprovide` is installed in `/usr/bin`.  To override the
default installation prefix, do:

    $ sudo make prefix=/usr/local install

Author
======

Fakeprovide is written by Lars Kellogg-Stedman <lars@oddbit.com>.

License
=======

Fakeprovide
Copyright (C) 2011 Lars Kellogg-Stedman

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

