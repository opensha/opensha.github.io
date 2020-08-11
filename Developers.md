OpenSHA has an active and growing developer community. It's use by various groups ranging from the [WGCEP](https://www.wgcep.org) to GEM has brought together developers from all over the world. Code contributions related to these projects, as well as those by individuals in the public, academic, and private sector have been significant. As an open source project, OpenSHA welcomes any additional involvement and contributions.

### Getting the Source

OpenSHA source code is [hosted on GitHub](https://github.com/opensha/). The starting point for documentation is the [opensha-commons README](https://github.com/opensha/opensha-commons/blob/master/README.md#opensha-commons). Once you have downloaded the source, you can compile the project or build jar files for use in external projects. We typically develop OpenSHA code with [Eclipse](https://www.eclipse.org).

If, at some future time, you have made changes or enhancements that warrant inclusion in the project, please submit a pull request, or [contact](Home#contact-us) the project to see about getting them integrated.

### OpenSHA Project Structure

OpenSHA is split into multiple projects with the following dependencies:

| Name       | Depends On | Description                                      |
|------------|------------|--------------------------------------------------|
| [commons](https://github.com/opensha/opensha-commons)    | -          | Base commons library                             |
| [core](https://github.com/opensha/opensha-core)       | commons    | Core OpenSHA library with calculators and models |
| [ucerf3](https://github.com/opensha/opensha-ucerf3)     | core       | UCERF3 model code and data                       |
| [apps](https://github.com/opensha/opensha-apps)       | ucerf3     | GUI applications                                 |
| [dev](https://github.com/opensha/opensha-dev)        | apps       | Development sandbox for shared prototyping       |
| [cybershake](https://github.com/opensha/opensha-cybershake) | dev       | CyberShake interface code and calculators        |

The 'releases' pages of the above repositories (except 'dev' and 'cybershake') contain pre-built jar files which can be referenced from external projects.

### Bugs? Technical issues?

You can submit a ticket on the 'Issues' page of each OpenSHA sub-project. For example, to submit a bug related to our applications, go [here](https://github.com/opensha/opensha-apps/issues).

### Nightly Builds

The latest nightly builds of OpenSHA applications and libray jar files can be downloaded [here](http://opensha.usc.edu/apps/opensha/nightlies/latest). These versions are less stable and may also include models which are under development in applications. Prior nightly builds can be found [here](http://opensha.usc.edu/apps/opensha/nightlies).