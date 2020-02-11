

# A Geovisualization Case Study using GMT [E0]

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a problem of map creation. The scenario was demonstrated in [[1]][kasalicalamprecht2019] and the current use case describes the initial workflow sinthesys step, labeled as **E0** in the paper.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, GMT (http://gmt.soest.hawaii.edu/projects/gmt/wiki/Installing) set of tools and the Ghostscript command line tool (https://www.ghostscript.com/doc/current/Install.htm) need to be installed.

## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar SimpleDemo/ape.configuration
```
The results of the synthesis would be:

	SimpleDemo/sat_solutions.txt	-	First 100 candidate solutions in textual format
	SimpleDemo/Figures/		-	Data-flow figures corresponding to the first 10 solutions
	SimpleDemo/Implementations/	-	Executable shell scripts corresponding to the first 6 solutions


[kasalicalamprecht2019]: https://doi.org/10.1007/978-3-030-24302-9_34 "Workflow Discovery Through Semantic Constraints: A Geovisualization Case Study"
