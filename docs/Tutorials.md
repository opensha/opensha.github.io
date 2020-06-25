## Hazard Curve Calculator

This tutorial demonstrates how to replicate the hazard curve figures presented in:

```
Field, E. H, N. Gupta, V. Gupta, M. Blanpied, P. Maechling, and T. H. Jordan (2005), Hazard calculations for the WGCEP-2002 earthquake forecast using OpenSHA and distributed object technologies, Seismological Research Letters, 76, p. 161-167, DOI: 10.1785/gssrl.76.2.161.
```

Start by downloading and launching the [Hazard Curve Calculator application](Applications) and follow the instructions below to reproduce various figures.

### Figure 2

1. Choose the IMR (or attenuation relationship) by choosing Campbell and Bozorgnia (2003) from the first list in the "Set IMR" window.
2. Set the IMT (intensity-measure type) by choosing "PGA" from the first list in the "Set IMT" window.
3. Set the latitude and longitude in the "Set Site Params" window to be 37.8 and -122.417, respectively. This is a site near downtown San Francisco that happens to be a class "B" site according to the site-conditions map of Wills et al. (2000). An alternative way to set this latitude and longitude is to select "Sites of Interest" from the "Control Panels" list at the bottom of the application, and then choose "San Francisco Class B" from the window that pops up.
4. We now want to set the "Campbell-2003 Site Type" parameter below the latitude and longitude. We can set this to any of the options listed. However, we'll set this to a value consistent with the Wills et al. (2000) classification map by doing the following: from the "Control Panels" list at the bottom of the application, choose "Set Site Params from Web Services". In the window that pops up, first select "All IMRs" in the drop down box at the bottom, then click "Set IMR Params". Doing this requests the Wills et al. (2000) classification for our location from a Web Service, and the value that is returned ("B") is translated into the appropriate value for the "Campbell-2003 Site Type" (the parameter should now have been automatically set to "Firm Rock").
5. Choose an ERF (Earthquake Rupture Forecast) by doing the following: click the "ERF & Time Span" tab at the top of the application, and under the "Eqk Rup Forecast" list at the top of the sub-window, choose "WG02 Fortran Wrapped ERF List" (you might need to scroll down to see this option).
6. In the "Epistemic List Control" that automatically pops up, click the box next to "Plot Average" (the box next to "Plot all curves" should already be selected). Also choose "Plot Fractiles" from the list below, and click "Update Fractile List" at the bottom of the popup window. The window will automatically close when done.
7. In the main application, set the various ERF's adjustable parameters (listed below the chosen ERF) as follows:
Rupture Offset = 10.0

* Fault Discretization = 2.0
* Delta Mag = 0.2
* Backgound Seismicity = "Exclude"
* GR Tail Seismicity = "Include"
* Num Realizations = 100

8. Initiate the computation by clicking "Compute" at the bottom of the application. It will take several minutes to generate all the curves for the 100 realizations. The progress bar should keep you posted.
9. Convert to a log-log plot by clicking both the "X" and "Y" check-boxes next to "Log scale" at the bottom of the application.
10. Change the color scheme by clicking "Plot Prefs" at the bottom of the application and in the popup window set the following for each Dataset:

* DATASET #1 Curves: Color as Gray and Size as 2
* DATASET #1 Fractiles: Color as Blue and Size as 2
* DATASET #1 Mean: Color as Red and Size as 2

11. Click "Done". Change the axis limits by clicking "Set Axis" at the bottom of the application; then choose "Custom Scale" from the top of the popup window and set "Min X" = 1.0E-2, "Max X" = 3.0, and "Min Y" = 1.0E-6. Click "OK" to apply the changes and close the window.

The window you now see represents the screenshot shown in Figure 2.

### Figure 3
(assumes completion of steps 1-11 above)

12. Put the present plot aside by clicking "Peel Off" at the bottom of the application (or click "Clear Plot").
13. In the main application, make it so we'll only plot the mean curves by doing the following: in the "Control Panels" list at the bottom of the application, choose "Epistemic List Control" (you might need to scroll down to see it). Deselect "Plot all curves", and choose "No Fractiles". Only the "Plot Average" option should remain selected.
14. Re-compute the average shown in Figure 2 (for Campbell and Bazorgnia (2003) by again clicking "Compute" at the bottom of the application.
15. Now redo this calculation using a different IMR (attenuation relationship) by doing the following: click the "IMR, IMT & Site" tab at the top of the application (if you haven't already done this), under the "Set IMR" window choose "Boore et al. (1997)" from the list at the top, set the IMT to "PGA in the "Set IMT" window below, and click "Compute" at the bottom. Note that the site-type parameter under the lat and lon was already set in step (4) above.
16. Repeat step (15) for the "Abrahamson and Silva (1997)" and "Sadigh et al. (1997)" attenuation relationships in that order (and be sure to set the IMT to PGA each time).
17. After increasing the size of the lines to 2.0 (by clicking "Plot Prefs"), and changing the axis range (by clicking "Set Axis"), you have now reproduced Figure 3. Note that you can save a png version of the image by selecting the "Save" option in the "File" menu at the upper left corner of the application or by clicking on the save icon symbol at the top left of the application.

### Figure 4
(assumes completion of steps 1-17 above)

18. Click either "Peel Off" or "Clear Plot" at the bottom of the application.
19. In the main application, re-select the Campbell & Bozorgnia (2003) IMR (attenuation relationship), set the IMT to PGA, and click "Compute" at the bottom of the application. This re-plots the mean curve shown in Figure 2.
20. Click the "ERF & Time Span" tab at the top of the application, and on the right side change the time-span "Duration" from 30 to 20 years. Click "Compute" at the bottom of the application.
21. Repeat step (20) for durations of 10, 5, and 1 (in that order).
22. After increasing the size of the lines to 2.0 (by clicking "Plot Prefs"), and changing the axis range (by clicking "Set Axis"), you have now reproduced Figure 4.

### Figure 5
(assumes completion of steps 1-22 above)

23. Click either "Peel Off" or "Clear Plot" at the bottom of the application.
24. In the main application, re-select the duration of 30 years and click "Compute" (to re-plot the mean curve shown in Figure 2).
25. For each of the 7 ERF adjustable parameters labeled "[fault name] Prob. Model Wts", click the button and set all values in the popup window to zero, except set that for the "Poisson" model to 1.0. After dong this for the 7 parameters (one for each fault), click "Compute" at the bottom of the application.
26. Repeat step (25), but rather than giving the "Poisson" model a weight of 1.0, give the "BPT", model a weight of 1.0 in each of the 7 parameters.
27. After increasing the size of the lines to 2.0 (by clicking "Plot Prefs"), and changing the axis range (by clicking "Set Axis"), you have now reproduced Figure 5.

## Attenuation Relationship Plotter

This short guide explains the basic steps required to plot and compare the Attenuation Ralationships implemented in OpenSHA.

### Creating a Plot

1. Select an Attenuation Relationship from the "Choose Model" combo box (located directly above the plot window).
2. Choose an IMT from the combo box at the upper right (the options will depend on what's supported by your chosen Attenuation Relationship)
3. Below that, choose from among the following to plot on the Y-axis:

* Median
* Standard Deviation
* Exceedance Prob (for specified IML)
* IML at Exceedance Prob

4. Next, choose what you want to plot on the X-axis. The options are generally any parameter applicable to your chosen attenuation relationship that represents a numerical value (the options also depend on what you've chosen for the Y-axis).
5. Finally, set all the other parameters that your chosen attenuation relationship depends upon (the list, which is on the lower right, depends on what you've chosen for the Y-axis). HINT: mousing over the parameter name should give you more info about that Parameter, and mousing over where you enter numerical values will show any limits on the allowed values for the parameter
6. Click the "Add Curve" button to calculate and show the plot.

You can add multiple curves, but the plot will automatically clear if you change what's plotted on either axis (e.g., you can't have both magnitude and distance on the X-axis; however, you can plot different Distance Parameters simultaneously on the X-axis).

### Other Options

* The "Clear Plot" button clears the plot.
* The "Peel-Off" button sets the current plot aside in a new window (e.g., to save it while you generate new plots).
* The "Add Data Points" button allows you to add your own data (e.g., values observed from an actual earthquake).
* The functionality of the other buttons at the bottom of the plot window should be self explanatory.

### Known Issues

* You cannot currently set how the X-axis is discretized, which may be frustrating if you want to know the Y-axis value for an exact X-axis value. You can use the "Individual Value" option under the X-axis combo box to show the Y-axis value for a specific set of parameter values.
* If, when you click the "Add Curve" button, you get a message asking whether you want to violate a "Warning Constraint" of a parameter (e.g., if you choose a Magnitude outside the range sanctioned by the chosen attenuation relationship), you may need to click the "Add Curve" button again to generate the plot (if you've accepted the value).

## Scenario ShakeMap

This tutorial demonstrates how to replicate Figure 1 as presented in:

```
Field, E. H, H. A. Seligson, N. Gupta, V. Gupta, T. H. Jordan, and K. Campbell (2005), Loss Estimates for a Puente Hills Blind-Thrust Earthquake in Los Angeles, California, Earthquake Spectra, 21, p. 329-338, DOI: 10.1193/1.1898332.
```

And also explains some additional features of the application. Start by downloading and launching the [Scenario ShakeMap application](Applications) and follow the instructions below to reproduce various figures.

### Figure 1A

1. Under the "Intensity-Measure Relationship" tab, choose "PGA" from the "IMT" menu, and then choose "Abrahamson & Silva (1997)" from the "IMR" menu.
2. Under the "Region and Site Params" tab, set the following as:
    1. "Min Longitude" = -119
    2. "Max Longitude" = -117
    3. "Min Latitude" = 33.5
    4. "Max Latitude" = 34.5
    5. "Grid Spacing" = 0.016667
    6. "Set Site Params" = "Use site data providers"
    7. "Default AS Site Type" = "Deep-Soil"
3. Under the "Earthquake Rupture" tab set the following:
    1. "Select Method of Getting Eqk Rupture" = "Custom Eqk Rupture"
    2. "Rupture Type" = "Finite source rupture"
    3. "Magnitude" = 7.2
    4. "Rake (degrees)" = 90

Now click "Set Fault Surface" & set the following

    1. "Grid Spacing (km)" = 1.0
    2. "Num. of Fault Trace Points" = 4

Click "Fault Latitudes" and enter the following:

    1. Lat-1 (Degrees) = 33.9451
    2. Lat-2 (Degrees) = 33.9423
    3. Lat-3 (Degrees) = 33.9746
    4. Lat-4 (Degrees) = 34.0768

and click "Update Latitudes" when done.

Likewise for "Fault Longitudes":

    1. Lon-1 (Degrees) = -117.8679
    2. Lon-2 (Degrees) = -118.0315
    3. Lon-3 (Degrees) = -118.1253
    4. Lon-4 (Degrees) = -118.3194

"Num. of Dips" = 1

Click "Dips" and set it as 27 degrees

Click "Depths" and set:

    1. "Depth-1 (km)" = 5.0
    2. "Depth-2 (km)" = 17.0

"Finite Fault Type" = "Stirling"

"Ave Dip Direction (degrees) " = leave this blank (so direction is perpendicular to ave strike)

Now click "Make Simple Fault" at the bottom

Finally, leave "Set Hypocenter Location" un-selected

4. Click the "Exceedance Level/Probability" tab and set:

    1. "Map Type" = IML@Prob
    2. "Probability" = 0.5

These settings will give us a map of the median intensity-measure level (IML).

5. Click the "Map Attributes" tab and set the following:
    1. "Color Scheme" = "MaxSpectrum.cpt"
    2. "Color Scale Limits" = "Manually"
    3. "Color-Scale Min" = 0.0
    4. "Color-Scale Max" = 1.0
    5. "Topo Resolution (arc-sec)" = "18 sec California"
    6. "Highways in plot" = "None"
    7. "Coast" = "Draw & Fill"
    8. "Image Width (inches)" = 6.5
    9. "Plot Log" should NOT be selected
    10. "Generate Hazus Shape Files" should not be selected
    11. "Rupture-Surface Plotting" = "Draw Perimeter"

6. Now click "Make Map" at the bottom of the application and you should see Figure 1A in a few seconds.

### Figure 1B
(assumes completion of all prior steps)

7. Click the "Earthquake Rupture" tab, change the Magnitude to 7.5.
8. Click "Make Map" at the bottom, and in a few seconds you should see Figure 1B.

### Figure 1C
(assumes completion of all prior steps)

9. Change the Magnitude back to 7.2.
10. Click the "Intensity-Measure Relationship" tab and change the IMR parameter to "Boore, Joyner,& Fumal (1997)".
11. Clicking "Make Map" at the bottom you should see Figure 1C.

### Figure 1D
(assumes completion of all prior steps)

12. Click the "Earthquake Rupture" tab, change the Magnitude to 7.5.
13. Click "Make Map" at the bottom, and you should see Figure 1D.

### Figure 1E
(assumes completion of all prior steps)

14. Click the "Intensity-Measure Relationship" tab and change the IMT parameter to "SA" and the "SA Period" parameter to 1.0. Also change the IMR parameter to "Abrahamson & Silva (1997)".
15. Now click the "Map Attributes" tab and change the "Color-Scale Max" parameter to 2.11.
16. Click "Make Map" and you should see Figure 1E.

NOTE - the PGV calculations in the paper assume that PGV is proportional to 1-sec SA according to the Newmark Hall (1982) relationship:

1-sec SA = 1.056 PGV (SI units)

Therefore, the SA plot just made is identical to the PGV plot in the paper.

### Figure 1F
(assumes completion of all prior steps)

17. Click the "Intensity-Measure Relationship" tab and change the IMR parameter to "Field (2000)".
18. Click "Make Map" to produces the final image in the plot (Figure 1F).

### Why do the Images Look Different?
* The slight color differences are due to resolution & image-format differences between the figure for the paper and the images generated here.
* The labeling and scale-format differences are due to post processing (touching up) done with Adobe Illustrator to make the figure for publication.
* By the way, a PostScript version of the plots you made, as well as the GMT scripts and data files, are available for download; just scroll to the bottom of the window below each plot to see the download link. This allows you to edit the PostScript files.

### What's the Difference Between the "Stirling" and "Frankel" Finite Fault Types?
The best way to see this is to compare the difference.

* First, click on the "Map Attributes" tab and change the "Rupture-Surface Plotting" parameter to "Draw Discrete Points".
* Now click the "Earthquake Rupture" tab, click "Set Fault Surface", set the "Grid Spacing" parameter to 2.0, and click the "Make Simple Fault" button at the bottom.
* Clicking the "Make Map" should show you the map made previously but with a discretized version of the fault surface (rather than the outline of the fault being drawn).
* This is the "Stirling" fault representation (where depth contours are parallel to the trace of the top of the fault).
* Now click "Set Fault Surface" again, change the "Finite Fault Type" parameter to "Frankel's", and then click the "Make Simple Fault" button at the bottom.
* Clicking the "Make Map" shows that Frankel's representation projects a rectangle down perpendicular to the local strike along the fault.
See also the glossary entries on Stirling and Frankel Fault Surfaces.

### What is the Other Way of Selecting an Earthquake Rupture?
Besides creating a custom earthquake rupture (what we did above), you can also choose one from any available Earthquake Rupture Forecast (ERF). For example, one can compute a Scenario ShakeMap for one of the Puente Hills ruptures defined in the ERF used to make our National Hazard Maps.

* Click the "Earthquake Rupture" tab, and under "Select method of getting Eqk Rupture" choose "Select EqkRupture from an ERF".
* Under "Eqk Rup Forecast" choose "USGS/CGS 2002 Adj. Cal. ERF", and in the window that pops up click "Update Forecast" at the bottom.
* Under "Source Index" choose source # 136 - their Puente Hills Characteristic source.
* Each source can have multiple ruptures (i.e., difference magnitudes and/or rupture locations on the fault), so you need to give a Rupture Index as well (info on each is given below). Choose one and click "Make Map".
* You might want to go back and select "Draw Perimeter" from the "Rupture-Surface Plotting" under the "Map Attributes" tab, otherwise you won't be able to see the shaking levels directly over the fault.

### Generate HAZUS Shape Files
* Choose "Generate Hazus Shape Files for Scenario" from the "Control Panels" menu, read the text, and click the button.