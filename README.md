# build\_docker\_image

_... makefiles and helper scripts to manage building docker images_
_from github repos with facility for versioning and build audit._

## Why?

I want to make use of docker LABEL values, so that I can inspect
an image or container and discover who built the image, what
source they used and why.

I also wanted to use the same mechanism for versioning (git tag)
and a consistent way to determine the value of the version.

In this case a build timestamp is used to version the built docker image,
as I still can't find a good reason to use semver for a container.
Semver _is used_ for this repo however.

