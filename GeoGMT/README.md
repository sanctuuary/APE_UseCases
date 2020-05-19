

# A Geovisualization Case Study using [GMT](https://www.generic-mapping-tools.org/ "GMT")

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a problem of map creation. The scenario was demonstrated in [[KasalicaLamprecht2019]][kasalicalamprecht2019], where the full workflows synthesis was accomplished in few incremental synthesis steps. Some of them are given here for demonstration:
- **E0** use case describes the initial workflow sinthesys step, labeled as **E0** in the paper.
- **E1** use case extends the initial workflow sinthesys step with additional constraints enforcing better map annotations.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, GMT (https://www.generic-mapping-tools.org/download/) set of tools and the Ghostscript command line tool (https://www.ghostscript.com/doc/current/Install.htm) need to be installed.

## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar GeoGMT/E[number]/ape.configuration
```
The results of the synthesis would be:

	GeoGMT/E[number]/sat_solutions.txt	-	First 100 candidate solutions in textual format
	GeoGMT/E[number]/Figures/		-	Data-flow figures corresponding to the first 10 solutions
	GeoGMT/E[number]/Implementations/	-	Executable shell scripts corresponding to the first 6 solutions


[kasalicalamprecht2019]: https://doi.org/10.1007/978-3-030-24302-9_34 "Workflow Discovery Through Semantic Constraints: A Geovisualization Case Study"
