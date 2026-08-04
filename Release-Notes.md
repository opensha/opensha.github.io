OpenSHA is actively developed and regular releases are posted on the [GitHub release page](https://github.com/opensha/opensha/releases). This page contains release notes for each version, as well as a running list of changes that will be included in the next release.

## Current changes

This section lists current changes that have been merged into the `master` branch on the [OpenSHA Git repository](https://github.com/opensha/opensha), but have not yet been included in a release.

* Updates to fault-system-solution ERFs to support multiple tectonic regimes, allowing for TRT-specific IMR assignment in OpenSHA GUI applications. See [#206](https://github.com/opensha/opensha/pull/206).
* Point-source optimizations to speed up point-source calculations with ergodic IMRs. This dramatically speeds up calculation time for hazard calculations involving many point sources by pre-computing exceedance probabilities for many distances and interpolating between them. See [#208](https://github.com/opensha/opensha/pull/208).
  * This is enabled by default, and can be disabled by deselecting the "Enable point source optimizations?" checkbox in the Calculation Settings control panel.
* Additional grid source settings to control the number of finite surfaces when the finite rupture (virtual faults) option is selected. [#208](https://github.com/opensha/opensha/pull/208).
* New `RectangularSurface` implementation to more efficiently compute distances to simple planar surfaces (e.g., virtual faults). See [#208](https://github.com/opensha/opensha/pull/208).
* Removed `DistanceSeis` calculation which used a hardcoded depth and was only used by legacy IMRs. See [#208](https://github.com/opensha/opensha/pull/208).
* Revamped `CompoundSurface` implementation for multifault ruptures, now supporting models with multiple subsections down-dip. See [#215](https://github.com/opensha/opensha/pull/215).
* New site data provider for Conterminous U.S. Models (2023 and 2018). Supplies basin depth and sediment thickness data. See [#228](https://github.com/opensha/opensha/pull/228).
* New site data provider basin depths from the Multi-Scale California (MUSCAL) velocity model. See [#233](https://github.com/opensha/opensha/pull/233).
* New OpenSHA application updater subsystem to notify users of available updates, including an option to update directly. See [#237](https://github.com/opensha/opensha/pull/237).
* Updated dip and IMR hypocentral depth updates for multifault ruptures (`CompoundSurface`). Now parameterizes IMRs with area-weighted average dips rather than orientation-relative average dips. Also improves default hypocentral depth calculation (for ruptures without defined hypocenters) to use the average of the upper and lower depths, rather than projecting from the upper depth and average dip. See [#239](https://github.com/opensha/opensha/pull/239).
* Updated to Java 21. See [#238](https://github.com/opensha/opensha/issues/238).
* Update default source filters (maximum source-site distance in hazard calcs) to tectonic-regime-dependent defaults. See [#245](https://github.com/opensha/opensha/pull/245).
  * This replaces the previous default of 200 km with TRT-specific defaults ranging from 300 to 1000 km.
  * Cutoff distances are adjustable via the "Calculation Settings" control panel in GUI applications

## Released Versions

### Version 26.1.1

[View release](https://github.com/opensha/opensha/releases#release-v26.1.1)

* Fixes the GMT Map Application
* Resolves a serialization mismatch against the server build, which resulted in a production failure for all applications which leverage the CPTVal (#222)

### Version 26.1.0

[View release](https://github.com/opensha/opensha/releases#release-v26.1.0)

* New applications: IMEventSetCalculator GUI and CLT
  * IMEventSetCalculator allows for mean and sigma intensity measure (IM) calculations across multiple sites with selected IM relationships (IMRs) and types (IMTs).
  * In the graphical user interface (GUI), users interactively select IMRs, choose IMTs, add their sites of interest, and select the earthquake rupture forecast (ERF).
    * The GUI supports setting site data (e.g., Vs30, Z2.5, etc) from web services or entering it manually, and adjusting parameters of the IMRs and ERF.
  * The command line tool (CLT) is simpler in its design with limited options for adjusting site data or model parameters, but easier to run in batch-processing workflows.
  * See IMEventSetCalculatorCLT-26.1.0/README.txt for CLT usage
  * GUI tutorial available at https://opensha.org/Tutorials
* Support ERF data retrieval from multiple servers
  * ERF data for recent models are downloaded on-demand from SCEC servers and storage partners. We now support dynamically querying fallback servers if the primary server is unavailable, and configured fallback servers for UCERF3, NSHM23, and NSHM25 models.
  * Leverages a new version of GetFile (v25.4.0 -> v25.11.0) where a list of server metadata URIs can be considered
* Drop support for WG02 Fortran Wrapped ERF Epistemic List across all OpenSHA applications
* Add support for encrypted connections to Tomcat9 servlets. Used for GMT map generation and Site Data Provider retrieval.
* Added clarification message to disaggregation consolidated source data list.
* Add nightly build support for the [NSHM25 Puerto Rico and Virgin Islands ERF](https://www.sciencebase.gov/catalog/item/67c625d9d34ea599a3b99783)
  * ERF is under active development and is available in the nightly builds
  * Not yet available in production release

### Version 25.4.3

[View release](https://github.com/opensha/opensha/releases#release-v25.4.3)

* Hotfix release resolves bug where UCERF3 and NSHM23 ERF data can't be downloaded inside applications following maintenance on USC CARC. (https://github.com/opensha/opensha/pull/193)

### Version 25.4.2

[View release](https://github.com/opensha/opensha/releases#release-v25.4.2)

* Fix IMi distribution calculation failure in the GCIM module when changing the default IMR (https://github.com/opensha/opensha/issues/174). Previously a NullPointerException error was thrown.

### Version 25.4.1

[View release](https://github.com/opensha/opensha/releases#release-v25.4.1)

* Fix Mean UCERF3 ERF Complete Model Preset in HazardCurveApplication (#169). This model previously threw an error and would not compute. Now it computes the model the same as before major release v25.4.0.

### Version 25.4.0

[View release](https://github.com/opensha/opensha/releases#release-v25.4.0)

* Added support for "NSHM23 Western US (crustal only, excl. Cascadia) Branch Averaged ERF" — the most recent USGS ERF for the Western U.S.. Note that this model only includes crustal sources and thus excludes Cascadia subduction interface and intraslab seismicity.
* Added support for “USGS NSHM23 Active Crustal GMM” — the weighted average model used in NSHM23, accessed via a wrapper to [nshmp-haz](https://code.usgs.gov/ghsc/nshmp/nshmp-haz).
* Included the "WGCEP UCERF3 Epistemic List ERF" — the expanded epistemic uncertainty version of UCERF3, enabling plotting of fractiles and curves.
* [Generalized Conditional Intensity Measure](https://sites.google.com/site/brendonabradley/software/ground-motion-selection-gcim?authuser=0) (GCIM) distribution calculator has been added to the Hazard Curve Control Panel for use in ground motion selection. This was previously a separate application.
* Introduction of the[ GetFile framework](https://github.com/abhatthal/getfile) for automated retrieval of versioned ERF data, now hosted independently of OpenSHA releases.
* UI refactoring for a more responsive and stable experience and fixed progress bars for ERF downloads.
* Calculation cancellation is now handled gracefully and won’t crash the HazardCurve and HazardSpectrum applications.
* Updated DistanceX calculation with improved accuracy at high latitudes (see [#162](https://github.com/opensha/opensha/pull/162)).
* Updated interface for point-source approximations. Now part of individual ERF parameter lists for greater visibility. UCERF3, NSHM23-WUS, and other fault-system-solution ERFs now default to enabling point-source distance corrections for gridded seismicity.
* Support for super-sampling gridded seismicity models for NSHM23 and UCERF3. Spreads redistributes point-sources evenly across each gridded seismicity cell, rather then centering all of them at the cell center.
* Fault System Solution ERF now supports [updated and simpler file formats](https://opensha.org/Modular-Fault-System-Solution).
* New source-filtering interface and implementations allowing for more complex (magnitude- or tectonic-regime-specific) source distance cutoffs. See the “Calculation Settings” control panel in the Hazard Curve and Spectrum applications.
* Fixed bugs with the UCERF2 ERF gridded seismicity implementation, see [#133](https://github.com/opensha/opensha/issues/133).
* Various improvements to disaggregation calculations and plots:
  * Plots are now generated locally, improving performance and no longer requiring access to an OpenSHA server.
  * For fault-system-solution ERFs (e.g., UCERF3 and NSHM23-WUS), a new consolidated source list view is available where the contribution is listed for each individual fault (rather than rupture).
