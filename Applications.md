Download the latest OpenSHA desktop applications here.

[![Download](resources/download_button.png)](https://github.com/opensha/opensha/releases)

Information on nightly development builds, which may include additional models and features, can be found [here](Developers#nightly-builds).

Please use the following citation when publishing results generated using OpenSHA:

```
Field, E.H., T.H. Jordan, and C.A. Cornell (2003), OpenSHA: A Developing Community-Modeling Environment for Seismic Hazard Analysis, Seismological Research Letters, 74, no. 4, p. 406-419.
```

*Note that all applications are being continually developed and that the project provides [no guarantees](License-Disclaimer) as to their serviceability.*

If you encounter an issue with our applications, please submit a [ticket here](https://github.com/opensha/opensha/issues).

Some features (e.g., ShakeMap, Disaggregation, site data web services) require an internet connection; make sure that your firewall allows connections to ports `80` and `8080` on `opensha.usc.edu`. We run an automated test every 6 hours to ensure that our server is up and working, current results of that test can be seen below. If the badge below says "failing" then we have already been notified and will correct the issue as soon as possible, in which case please try again later.

![Server Status](https://github.com/opensha/opensha/actions/workflows/operational_tests.yml/badge.svg)

## Requirements

Our apps are written in [Java](https://www.oracle.com/java/technologies/) and are cross-platform. The OpenSHA developers use Linux and Mac OSX, but apps should run on Windows as well. Basic requirements are as follows:

* Java 11 or above ([Download here](https://adoptium.net/))
* 64-bit version of Java
* At least 4 GB of RAM (8 GB or greater recommended)

Check that you have the correct version installed with the `java -version` command in a terminal (make sure that it says '64-Bit' and that the version is appropriate).

## Launching applications

First download the jar file[s] of interest [from the latest release](https://github.com/opensha/opensha/releases) (expand the 'assets' section to see a list of application jar files). Some users may be able to launch them by simply double clicking on the jar file in a file browser. If this doesn't work, you will need to launch it in a terminal:

`java -jar /path/to/jarFile.jar`

For example, if I'm in a directory containing `HazardCurveGUI-1.5.0.jar` and want to run it:

`java -jar HazardCurveGUI-1.5.0.jar`

If you see any error messages related to "OutOfMemoryException" or java "heap size", **or the app stalls when loading a large model (e.g., UCERF3)**, you'll need to allocate more memory to java. You can do this most easily with the `-Xmx` argument, or search for ['increase java heap space'](https://www.google.com/search?q=increase+java+heap+space) for more information and alternative methods. For example, to run with 4 GB of memory:

`java -Xmx4G -jar HazardCurveGUI-1.5.0.jar`

## Application Descriptions

### Attenuation Relationship Plotter

Plot Attenuation Relationship curves. Specifically, plot the mean, standard deviation, and probability of exceeding a given IML, or the IML that has a given probability of exceedance, (on the Y-axis) as a function of whatever independent parameters the Attenuation Relationship of interest depends upon. Any independent parameter that represents a numerical value can be used for the X axis. See the [user guide here](Tutorials#attenuation-relationship-plotter).

### GMT Map Plotter

Generate a GMT image map for URL-accessible data.

### Hazard Curve Calculator

Compute and plot hazard curves for a specified IMT, IMR, ERF, and Site. See the [tutorial here](Tutorials#hazard-curve-calculator).

### Hazard Spectrum Calculator

Use this application to compute and plot hazard spectra. This can be done for either probabilistic spectra (for a specified IMR, ERF, and Site), or for deterministic spectra (for a specified IMR, Source, and Site).

### Scenario ShakeMap

Use this application to compute and plot Scenario ShakeMaps for a chosen IMR , Earthquake Rupture, and Geographic Region. See the [tutorial here](Tutorials#scenario-shakemap).

### Site Data Viewer/Plotter

Download and plot data and maps for site related data such as Vs30 and Basin Depth.
