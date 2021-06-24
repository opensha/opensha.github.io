_PREVIEW: This is a preview of the proposed file format, UCERF3 files are still stored in the [Legacy Fault System Solution](Legacy-Fault-System-Solution) format_

The [UCERF3](https://wgcep.org/UCERF3) model introduced Fault System Rupture Sets and Solutions as data containers for earthquake rupture forecasts. A [Rupture Set](#fault-system-rupture-set) defines all of the on-fault supra-seismogenic ruptures in a fault system, and their properties (magnitude, rake, etc). A [Solution](#fault-system-solution) defines the annual rate of occurrence of each rupture, and may also supply information about gridded seismicity.

Data are stored in a zip file consisting primarily of JSON, GeoJSON, and CSV files for ease of use. Rupture sets and solutions are stored in the `ruptures` and `solution` sub-directories of the zip file, respectively. OpenSHA codes will include a `modules.json` file at the top level of the zip file that includes information used by OpenSHA to load in the Rupture Set and Solution, but this can be omitted for externally-created files.

Example files presented here are often shortened for brevity, indicated by `...`.

TODO: post link to demo file when added to repo

## Fault System Rupture Set

Fault System Rupture Sets define a set of fault sections and supra-seismogenic ruptures (and their properties) on those sections. Its data are stored in the `ruptures` sub-directory of a zip file.

Here is a summary of files likely to be in a rupture set zip file:

| File Name | Required? | Format | Description |
| --- | --- | --- |
| `ruptures/fault_sections.geojson` | **YES** | GeoJSON | Fault section geometries |
| `ruptures/ruptures.csv` | **YES** | CSV | Rupture definitions and properties |
| `ruptures/ave_slips.csv` | _(no)_ | CSV | Average slip information for each rupture |
| `ruptures/modules.json` | _(no)_ | JSON | Manifest of Rupture Set modules, used by OpenSHA |

### Fault Section Data

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
      "id": 5,
      "properties": {
        "FaultID": 5,
        "FaultName": "Demo S-S Fault, Subsection 5",
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
            34.949999999999996
          ],
          [
            -118.00000000000001,
            34.99999999999999
          ]
        ]
      }
    },
    {
      "type": "Feature",
      "id": 6,
      "properties": {
        "FaultID": 6,
        "FaultName": "Demo Reverse Fault, Subsection 0",
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
            -118.2,
            35.2
          ],
          [
            -118.24993829648396,
            35.25002056101048
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

