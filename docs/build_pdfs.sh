#!/bin/bash

pandoc -f markdown -s fault_system_solution_format.md.nowiki -o fault_system_solution_format.pdf --pdf-engine=weasyprint --metadata title="Fault System Solution File Format"
pandoc -f markdown -s geospatial_file_formats.md.nowiki -o geospatial_file_formats.pdf --pdf-engine=weasyprint --metadata title="Geospatial File Formats"
