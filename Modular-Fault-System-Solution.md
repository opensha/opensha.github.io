_PREVIEW: This is a preview of the proposed file format, UCERF3 files are still stored in the [Legacy Fault System Solution](Legacy-Fault-System-Solution) format_

The [UCERF3](https://wgcep.org/UCERF3) model introduced Fault System Rupture Sets and Solutions as data containers for earthquake rupture forecasts. A [Rupture Set](#fault-system-rupture-set) defines all of the on-fault supra-seismogenic ruptures in a fault system, and their properties (magnitude, rake, etc). A [Solution](#fault-system-solution) defines the annual rate of occurrence of each rupture, and may also supply information about gridded seismicity.

Data are stored in a zip file consisting primarily of JSON, GeoJSON, and CSV files for ease of use. Rupture sets and solutions are stored in the `ruptures` and `solution` sub-directories of the zip file, respectively. OpenSHA codes will include a `modules.json` file at the top level of the zip file that includes information used by OpenSHA to load in the Rupture Set and Solution, but this can be omitted for externally-created files.

Example files presented here are often shortened for brevity, indicated by `...`.

TODO: post link to demo file when added to repo

### Table of Contents

* [Fault System Rupture Set](#fault-system-rupture-set)
  * [Fault Section Data](#fault-section-data)
  * [Rupture Data](#rupture-data)

## Fault System Rupture Set
_[(return to top)](#table-of-contents)_

Fault System Rupture Sets define a set of fault sections and supra-seismogenic ruptures (and their properties) on those sections. Its data are stored in the `ruptures` sub-directory of a zip file.

Here is a summary of files likely to be in a rupture set zip file:

| File Name | Required? | Format | Description |
| --- | --- | --- |
| `ruptures/fault_sections.geojson` | **YES** | GeoJSON | Fault section geometries |
| `ruptures/ruptures.csv` | **YES** | CSV | Rupture definitions and properties |
| `ruptures/ave_slips.csv` | _(no)_ | CSV | Average slip information for each rupture |
| `ruptures/modules.json` | _(no)_ | JSON | Manifest of Rupture Set modules, used by OpenSHA |

### Fault Section Data
_[(return to top)](#table-of-contents)_

Rupture sets usually contain a large number of fault _subsections_, which are small equal-length subdivisions of each parent fault section (typically with length approximately equal to half the siesmogenic thickness of the fault). Those _subsections_ are stored in the [Fault Section GeoJSON format](Geospatial-File-Formats#fault-data) with the added requirement that each section be listed in order of their `id`s, starting with `id=0` and ending with `id=(numSections-1)`. The GeoJSON will be stored in `ruptures/fault_sections.geojson`.

Here is an example fault section data file 9 subsections spanning two faults:

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 0,
      "properties": {
        "FaultID": 0,
        "FaultName": "Demo S-S Fault, Subsection 0",
        "DipDeg": 90.0,
        "Rake": 180.0,
        "LowDepth": 12.0,
        "UpDepth": 0.0,
        "DipDir": 0.0,
        "AseismicSlipFactor": 0.0,
        "CouplingCoeff": 1.0,
        "SlipRate": 10.0,
        "ParentID": 11,
        "ParentName": "Demo S-S Fault",
        "SlipRateStdDev": 1.0
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -118.00000000000001,
            34.7
          ],
          [
            -118.00000000000001,
            34.75
          ]
        ]
      }
    },
...
    {
      "type": "Feature",
      "id": 8,
      "properties": {
        "FaultID": 8,
        "FaultName": "Demo Reverse Fault, Subsection 2",
        "DipDeg": 45.0,
        "Rake": 90.0,
        "LowDepth": 12.0,
        "UpDepth": 0.0,
        "DipDir": 0.0,
        "AseismicSlipFactor": 0.0,
        "CouplingCoeff": 1.0,
        "SlipRate": 3.0,
        "ParentID": 25,
        "ParentName": "Demo Reverse Fault",
        "SlipRateStdDev": 0.5
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -118.29993824145802,
            35.30002058216891
          ],
          [
            -118.35,
            35.35
          ]
        ]
      }
    }
  ]
}
```

### Rupture Data
_[(return to top)](#table-of-contents)_

Rupture data is stored in `ruptures/ruptures.csv` and gives the magnitude, rake, area, length, and participating subsections for each rupture. It is stored in a CSV file. The participating subsections are indicated by their (0-based) index, so for the example below, rupture 0 consists of subsections 0 and 1, and rupture 1 consists of subsections 0, 1, and 2. Ruptures should be listed in order, and the first rupture shall be index 0.

An example is given below with 28 ruptures on the 9 previously defined fault subsections:

|Rupture Index|Magnitude         |Average Rake (degrees)|Area (m^2)          |Length (m)        |Num Sections|Section Index 1|Section Index N|  |  |  |  |  |  |  |
|-------------|------------------|----------------------|--------------------|------------------|------------|---------------|---------------|------|-------|-------|-------|-------|-------|-------|
|0            |6.105266709525443 |180.0                 |1.3343406276990956E8|11119.505230825796|2           |0              |1              |      |       |       |       |       |       |       |
|1            |6.329025510667691 |180.0                 |2.0015109415486434E8|16679.257846238695|3           |0              |1              |2     |       |       |       |       |       |       |
|2            |6.495612575124367 |180.0                 |2.6686812553981912E8|22239.010461651593|4           |0              |1              |2     |3      |       |       |       |       |       |
|3            |6.624827540968673 |180.0                 |3.335851569247824E8 |27798.763077065196|5           |0              |1              |2     |3      |4      |       |       |       |       |
|4            |6.730403855386272 |180.0                 |4.003021883097372E8 |33358.5156924781  |6           |0              |1              |2     |3      |4      |5      |       |       |       |
|5            |6.971648251003217 |148.67745759827315    |6.439055018198104E8 |47712.97860101853 |8           |0              |1              |2     |3      |4      |5      |6      |7      |       |
|6            |7.06238164883405  |137.60945800641775    |7.657071585748093E8 |54890.21005528653 |9           |0              |1              |2     |3      |4      |5      |6      |7      |8      |
|7            |6.105266709525443 |180.0                 |1.3343406276990956E8|11119.505230825796|2           |1              |2              |      |       |       |       |       |       |       |
|8            |6.329025510667691 |180.0                 |2.0015109415486434E8|16679.257846238695|3           |1              |2              |3     |       |       |       |       |       |       |
|9            |6.495612575124387 |180.0                 |2.6686812553982762E8|22239.010461652302|4           |1              |2              |3     |4      |       |       |       |       |       |
|10           |6.624827540968674 |180.0                 |3.335851569247824E8 |27798.7630770652  |5           |1              |2              |3     |4      |5      |       |       |       |       |
|...|...|...|...|...|...|...|...|...|...|...|...|...|...|...|
|27           |6.366683191306253 |90.0                  |2.4360331351004884E8|14354.462908539002|2           |7              |8              |      |       |       |       |       |       |       |