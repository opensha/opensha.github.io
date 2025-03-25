OpenSHA has an active and growing developer community. It's use by various groups ranging from the [WGCEP](https://www.wgcep.org) to the [New Zealand NSHM](https://www.gns.cri.nz/Home/Our-Science/Natural-Hazards-and-Risks/Earthquakes/National-Seismic-Hazard-Model-Programme) has brought together developers from all over the world. Code contributions related to these projects, as well as those by individuals in the public, academic, and private sector have been significant. As an open source project, OpenSHA welcomes any additional involvement and contributions.

### Getting the Source

OpenSHA source code is [hosted on GitHub](https://github.com/opensha/). The starting point for documentation is the [opensha README](https://github.com/opensha/opensha#opensha). Once you have downloaded the source, you can compile the project or build jar files for use in external projects. We typically develop OpenSHA code with [Eclipse](https://www.eclipse.org).

If, at some future time, you have made changes or enhancements that warrant inclusion in the project, please submit a pull request, or [contact](Home#contact-us) the project to see about getting them integrated.

### OpenSHA Project Structure

The primary opensha code and model implementations are stored in the [opensha repository](https://github.com/opensha/opensha). There are a few additional projects, such as our shared development sandbox ([opensha-dev](https://github.com/opensha/opensha-dev)) and separate repositories for [CyberShake](https://github.com/opensha/opensha-cybershake) and [operational aftershock forecast](https://github.com/opensha/opensha-oaf) codes:

| Name       | Depends On | Description                                      |
|------------|------------|--------------------------------------------------|
| [opensha](https://github.com/opensha/opensha)    | - | Primary OpenSHA repository |
| [opensha-dev](https://github.com/opensha/opensha-dev)        | opensha | Development sandbox for shared prototyping |
| [opensha-cybershake](https://github.com/opensha/opensha-cybershake) | opensha-dev | CyberShake interface code and calculators |
| [opensha-oaf](https://github.com/opensha/opensha-cybershake) | opensha | Operational Aftershock Forecasting codes and GUI applications |

The [releases page of the primary repository](https://github.com/opensha/opensha/releases) contains pre-built jar files that can be referenced from external projects.

### Bugs? Technical issues?

You can submit a ticket on the [Issues page of the OpenSHA project](https://github.com/opensha/opensha/issues).

### Nightly Builds

The latest nightly builds of OpenSHA applications and libray jar files can be downloaded [here](http://opensha.usc.edu/apps/opensha/nightlies/latest). These versions are less stable and may also include models which are under development in applications. Prior nightly builds can be found [here](http://opensha.usc.edu/apps/opensha/nightlies).

### Beta Testing

Prior to a stable release, there is a beta testing period. OpenSHA beta applications are distributed [here](https://strike.scec.org/scecpedia/OpenSHA_Beta_Testing).
These applications are unstable, but unlike nightly builds, have a defined cutoff point and curated feature-set. These should generally be much more stable
to use than our nightly builds, but won't necessarily have all the latest features under development.

