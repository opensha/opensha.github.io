_PREVIEW: This is a preview of the proposed file format, UCERF3 files are still stored in the [Legacy Fault System Solution](Legacy-Fault-System-Solution) format_

The [UCERF3](https://wgcep.org/UCERF3) model introduced Fault System Rupture Sets and Solutions as data containers for earthquake rupture forecasts. A [Rupture Set](#fault-system-rupture-set) defines all of the on-fault supra-seismogenic ruptures in a fault system, and their properties (magnitude, rake, etc). A [Solution](#fault-system-solution) defines the annual rate of occurrence of each rupture, and may also supply information about gridded seismicity.

Data are stored in a zip file consisting primarily of JSON, GeoJSON, and CSV files for ease of use. Rupture sets and solutions are stored in the `ruptures` and `solution` sub-directories of the zip file, respectively. OpenSHA codes will include a `modules.json` file at the top level of the zip file that includes information used by OpenSHA to load in the Rupture Set and Solution, but this can be omitted for externally-created files.

Example files presented here are often shortened for brevity, indicated by `...`.

TODO: post link to full demo file when added to repository

### Table of Contents

* [Fault System Rupture Set](#fault-system-rupture-set)
  * [Fault Section Data](#fault-section-data)
  * [Rupture Data](#rupture-data)
* [Fault System Solution](#fault-system-solution)
  * [Rate Data](#rate-data)
  * [Gridded Seismicity Data](#gridded-seismicity-data)

## Fault System Rupture Set
_[(return to top)](#table-of-contents)_

Fault System Rupture Sets define a set of fault sections and supra-seismogenic ruptures (and their properties) on those sections. Their data are stored in the `ruptures` sub-directory of a zip file.

Here is a summary of files likely to be in a rupture set zip file:

| File Name | Required? | Format | Description |
| --- | --- | --- | --- |
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

Rupture data is stored in `ruptures/ruptures.csv` and gives the magnitude, rake, area, length, and participating subsections for each rupture. It is stored in a CSV file. Ruptures should be listed in order, and the first rupture shall be index 0.

The participating subsections are indicated by their (0-based) index, so for the example below, rupture 0 consists of subsections 0 and 1, and rupture 1 consists of subsections 0, 1, and 2. The total number of columns in the CSV file depends on the section count of the largest rupture, and each line may have different column counts.

An example is given below with 28 ruptures on the 9 previously defined fault subsections:

|Rupture Index|Magnitude         |Average Rake (degrees)|Area (m^2)          |Length (m)        |Num Sections|# 1|# 2|# 3|# 4|# 5|# 6|# 7|# 8|# 9|
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

## Fault System Solution
_[(return to top)](#table-of-contents)_

Fault System Solutions define the rate of each rupture from a Rupture Set (called a 'solution' because those rates are usually the result of an inversion). They may optionally also include gridded seismicity data. Their data are stored in the `solution` sub-directory of a zip file.

A solution must also contain a rupture set (in the `ruptures` top-level sub-directory). In addition to the standard rupture set files, here is a summary of files likely to be in a solution set zip file:

| File Name | Required? | Format | Description |
| --- | --- | --- | --- |
| `solution/rates.csv` | **YES** | CSV | Annual rates for each rupture |
| `solution/grid_mech_weights.csv` | _(no)_ | CSV | Focal mechanism weights for each gridded seismicity location |
| `solution/grid_region.geojson` | _(no)_ | GeoJSON | Gridded seismicity region |
| `solution/grid_sub_seis_mfds.csv` | _(no)_ | CSV | Sub-seismogenic MFDs for gridded seismicity |
| `solution/grid_unassociated_mfds.csv` | _(no)_ | CSV | Gridded seismicity MFDs that are not associated with any fault |
| `solution/modules.json` | _(no)_ | JSON | Manifest of Solution modules, used by OpenSHA |

### Rate Data
_[(return to top)](#table-of-contents)_

Solution annual rate data for each rupture is stored in a simple 2-column CSV file, `solution/rates.csv`. An example is below:

|Rupture Index|Annual Rate       |
|-------------|------------------|
|0            |0.005945154768686478|
|1            |0.003682167938763965|
|2            |0.0013887602507831813|
|3            |6.093719896843293E-7|
|4            |0.002910087376438242|
|5            |4.2499659967491776E-8|
|6            |5.174497714174348E-4|
|7            |9.428854043022628E-9|
|8            |1.573894353848514E-7|
|9            |8.950994452062988E-8|
|10           |3.05526615405503E-7|
|...|...|
|27           |1.8591053170058727E-7|

### Gridded Seismicity Data
_[(return to top)](#table-of-contents)_

Solutions may optionally provided gridded seismicity information. For a fault system solution, gridded seismicity can refer to either off-fault earthquakes (those 'unassociated' with any fault) or sub-seismogenic ruptures on a fault (see UCERF3 reports for additional information). This data is stored in 4 files, each of which is summarized below.

#### Gridded Seismicity Region
_[(return to top)](#table-of-contents)_

The gridded region used to define the set of gridded seismicity locations is stored in `solution/grid_region.geojson`. It follows the OpenSHA [Gridded Region File Format](Geospatial-File-Formats#gridded-regions), and is omitted here for brevity, but the region used for the examples below has 81 grid nodes.

#### Gridded Seismicity Focal Mechanism Rates
_[(return to top)](#table-of-contents)_

Each gridded seismicity node can have ruptures of various focal mechanisms: strike-slip, normal, and reverse. This file gives the fraction of seismicity associated with each node that corresponds to each of those focal mechanisms. This data is stored in `solution/grid_mech_weights.csv` and the format is as shown:

|Node Index|Latitude          |Longitude          |Fraction Strike-Slip|Fraction Reverse|Fraction Normal|
|----------|------------------|-------------------|--------------------|----------------|---------------|
|0         |34.0              |-119.99999999999999|0.5                 |0.25            |0.25           |
|1         |34.0              |-119.75            |0.5                 |0.25            |0.25           |
|2         |34.0              |-119.5             |0.5                 |0.25            |0.25           |
|3         |34.0              |-119.25000000000001|0.5                 |0.25            |0.25           |
|4         |34.0              |-119.0             |0.5                 |0.25            |0.25           |
|5         |34.0              |-118.74999999999999|0.5                 |0.25            |0.25           |
|6         |34.0              |-118.50000000000001|0.5                 |0.25            |0.25           |
|7         |34.0              |-118.25            |0.5                 |0.25            |0.25           |
|8         |34.0              |-118.00000000000001|0.5                 |0.25            |0.25           |
|9         |34.25             |-119.99999999999999|0.5                 |0.25            |0.25           |
|10        |34.25             |-119.75            |0.5                 |0.25            |0.25           |
|...|...|...|...|...|...|
|80        |36.0              |-118.00000000000001|0.5                 |0.25            |0.25           |

#### Gridded Seismicity MFDs
_[(return to top)](#table-of-contents)_

Magnitude-Frequency distributions (MFDs) for each grid node are stored in a CSV file format. Each grid node can have 2 MFDs, one for sub-seimogenic ruptures associated with a fault (`solution/grid_sub_seis_mfds.csv`), and another for ruptures unassociated with any fault (`solution/grid_unassociated_mfds.csv`), but many grid nodes will only have 1 of those types.

The format for each file is identical, with empty rows (following the node index and location header) indicating that a given node doesn't have that MFD type. X-values are given in the header, and may vary from model to model.

Here is an example file that contains MFDs for some nodes and omits them for others:

|Node Index|Latitude          |Longitude          |5.05|5.15|5.25|5.35                |5.449999999999999    |5.55                 |...                  |8.45                 |
|----------|------------------|-------------------|----|----|----|--------------------|---------------------|---------------------|---------------------|---------------------|
|0         |34                |-119.99999999999999|    |    |    |                    |                     |                     |...                  |                     |
|...       |...               |...                |... |... |... |...                 |...                  |...                  |...                  |...                  |
|70        |35.75             |-118.25            |    |    |    |                    |                     |                     |...                  |                     |
|71        |35.75             |-118.00000000000001|0.037549377463209285|0.029826530715346772|0.023692055491070937|0.01881926861521211 |0.014948676417923521 |0.011874155750513673 |...                  |0                    |
|72        |36                |-119.99999999999999|    |    |    |                    |                     |                     |...                  |                     |
|73        |36                |-119.75            |    |    |    |                    |                     |                     |...                  |                     |
|74        |36                |-119.5             |    |    |    |                    |                     |                     |...                  |                     |
|75        |36                |-119.25000000000001|0.009573411456257293|0.007604431022338072|0.006040414270056358|0.00479807160413723 |0.0038112437473950306|0.0030273785179722465|...                  |0                    |
|76        |36                |-119               |0.009573389582638259|0.007604413647504879|0.006040400468735779|0.004798060641358617|0.0038112350393504474|0.0030273716009265646|...                  |0                    |
|77        |36                |-118.74999999999999|    |    |    |                    |                     |                     |...                  |                     |
|78        |36                |-118.50000000000001|    |    |    |                    |                     |                     |...                  |                     |
|79        |36                |-118.25            |    |    |    |                    |                     |                     |...                  |                     |
|80        |36                |-118.00000000000001|0.037549377463209285|0.029826530715346772|0.023692055491070937|0.01881926861521211 |0.014948676417923521 |0.011874155750513673 |...                  |0                    |

