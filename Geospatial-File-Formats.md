## OpenSHA Geospatial File Formats

OpenSHA stores geospatial data in [GeoJSON](https://geojson.org/), which is specified in [RFC 7946](https://datatracker.ietf.org/doc/html/rfc7946). OpenSHA code for (de)serializing GeoJSON can be found in the _[org.opensha.commons.geo.json](https://github.com/opensha/opensha/tree/master/src/main/java/org/opensha/commons/geo/json)_ package.

### Table of Contents

* [Fault Data](#fault-data)
  * [Requirements](#fault-data-requirements)
  * [Optional](#fault-data-optional-extensions)
  * [Example](#example-fault-data-geojson)

### Fault Data
_[(return to top)](#opensha-geospatial-file-formats)_

Fault data are stored as GeoJSON `Feature` objects, and a collection of faults (e.g., a fault model or fault subsection list) are stored in a `FeatureCollection`.

#### Fault data requirements
_[(return to top)](#opensha-geospatial-file-formats)_

At a minimum, a GeoJSON fault must contain the following:

1. The fault trace must be present in the `geometry` object in the form of a `LineString` or `MultiLineString`. Although `MultiLineString` is supported for convenience (GIS softwares may output single lines in this format), they should only contain a single `LineString`; if multiple lines are encountered, the code will print a warning and stitch them into a single fault trace.

Example fault trace as a `LineString` with 2 points:

```json
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -117.74953000000001,
            35.74054
          ],
          [
            -117.76365068593667,
            35.81037829696144
          ]
        ]
      }
```

2. The following `properties` are required:

| Name | JSON Type | Description |
| --- | --- | --- |
| DipDeg | Number | Dip of the fault in decimal degrees, following the right hand rule. See [the glossary](Glossary#strike-dip--rake-focal-mechanism) for more information. |
| LowDepth | Number | Lower depth of the fault in kilometers. See [simple fault](Glossary#simple-fault) for more information. |
| Rake | Number | Rake of the fault in decimal degrees, see [the glossary](Glossary#strike-dip--rake-focal-mechanism) for more information. |
| UpDepth | Number | Upper depth of the fault in kilometers, not including any aseismicity. See [simple fault](Glossary#simple-fault) for more information. |

3. A unique integer ID. This can be specified either as the `id` field of the `Feature` itself (must be an integer), or via the optional `FaultID` property. If both exist, the `id` field is used.

#### Fault data optional extensions
_[(return to top)](#opensha-geospatial-file-formats)_

1. The following optional properties will be parsed by OpenSHA (other properties may be present and will be ignored):

| Name | JSON Type | Description | Default Value |
| --- | --- | --- | --- |
| `AseismicSlipFactor` | Number | Fraction (value in the range `[0,1)`) of the fault area that is aseismic, typically applied by increasing the upper depth of the fault such that the area is reduced by this fraction. | `0.0` |
| `Connector` | Boolean | Boolean indicating that this fault is a Connector (currently unused). | _(none)_ |
| `CouplingCoeff` | Number | Fraction (value in the range `[0,1]`) of the slip rate of this fault that is released seismically. | `1.0` |
| `DipDir` | Number | Dip direction of this fault, see [the glossary](Glossary#strike-dip--rake-focal-mechanism) for more information. | Average trace strike direction + 90 degrees |
| `DateLastEvent` | Number | Date of the last event that ruptured this fault, used in time-dependent forecasts, expressed in epoch milliseconds. | _(none)_ |
| `FaultID` | Number | Integer ID of this fault. Must supply either this or the `Feature`'s `id` field. | _(none)_ |
| `FaultName` | String | Name of this fault. | _(none)_ |
| `ParentID` | Number | Integer ID of the parent to this fault. This is typically used when subdividing a fault into subsections, and will point to the ID of the original fault section. | _(none)_ |
| `ParentName` | String | Name of the parent to this fault. This is typically used when subdividing a fault into subsections, and will give the name of the original fault section. | _(none)_ |
| `PrimState` | String | 2 letter abbreviation of the primarily associated US state for this fault, if it exists. | _(none)_ |
| `SecState` | String | 2 letter abbreviation of the secondary associated US state for this fault, if it exists. | _(none)_ |
| `SlipLastEvent` | Number | Slip in meters of the last event that ruptured this fault. | _(none)_ |
| `SlipRate` | Number | Average long-term slip rate of this fault in mm/yr. | _(none)_ |
| `SlipRateStdDev` | Number | Standard deviation of the average long-term slip rate of this fault in mm/yr. | _(none)_ |

2. You can optionally supply a polygon geometry that this fault represents. In this case, the `geometry` object must be a `GeometryCollection` that contains both a fault trace (as either a `LineString` or `MultiLineString`) and a polygon as either a `Polygon` or `MultiPolygon`. For example:

```json
      "geometry": {
        "type": "GeometryCollection",
        "geometries": [
          {
            "type": "LineString",
            "coordinates": [
              [
                -117.76365068593667,
                35.81037829696144
              ],
              [
                -117.76492000000002,
                35.81665
              ],
              [
                -117.7758769984411,
                35.880450900949334
              ]
            ]
          },
          {
            "type": "Polygon",
            "coordinates": [
              [
                [
                  -117.73341200000002,
                  36.16374
                ],
                [
                  -117.75440599999999,
                  36.158123
                ],
                [
                  -117.76325900000002,
                  36.159714
                ],
                [
                  -117.77182599999999,
                  36.112068
                ],
                [
                  -117.779052,
                  36.092946
                ],
                [
                  -117.796123,
                  35.902927
                ],
                [
                  -117.791146,
                  35.824104
                ],
                [
                  -117.764981,
                  35.771588
                ],
                [
                  -117.758346,
                  35.738759
                ],
                [
                  -117.749531,
                  35.740542
                ],
                [
                  -117.63705499999999,
                  35.613076
                ],
                [
                  -117.52537900000002,
                  35.67657
                ],
                [
                  -117.600685,
                  35.901426
                ],
                [
                  -117.64800599999998,
                  36.058664
                ],
                [
                  -117.73341200000002,
                  36.16374
                ]
              ]
            ]
          }
        ]
      }
```

#### Example Fault Data GeoJSON
_[(return to top)](#opensha-geospatial-file-formats)_

Here is an example `FeatureCollection` that contains a single fault, represented as a `Feature`:

```json
{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 0,
      "properties": {
        "FaultID": 0,
        "FaultName": "Airport Lake, Subsection 0",
        "DipDeg": 50.0,
        "Rake": -90.0,
        "LowDepth": 13.0,
        "UpDepth": 0.0,
        "DipDir": 89.4594,
        "AseismicSlipFactor": 0.1,
        "CouplingCoeff": 1.0,
        "SlipRate": 0.39,
        "ParentID": 861,
        "ParentName": "Airport Lake",
        "SlipRateStdDev": 0.0
      },
      "geometry": {
        "type": "LineString",
        "coordinates": [
          [
            -117.74953000000001,
            35.74054
          ],
          [
            -117.76365068593667,
            35.81037829696144
          ]
        ]
      }
    }
  ]
}
```

### Regions
_[(return to top)](#opensha-geospatial-file-formats)_
