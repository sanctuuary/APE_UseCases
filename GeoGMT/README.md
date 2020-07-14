

# A Geovisualization Case Study (using [GMT](https://www.generic-mapping-tools.org/ "GMT") tools)

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a problem of map creation. The scenario was demonstrated in [[1]](#1), where the full workflows synthesis was accomplished in few incremental synthesis steps. Some of them are given here for demonstration:
- [**E0**](E0) use case describes the initial workflow sinthesys step, labeled as **E0** in the paper.
- [**E1**](E1) use case extends the initial workflow sinthesys step with additional constraints enforcing better map annotations.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. 

#### Optional
In order to be able to execute the generated workflows on the machine, GMT set of tools needs to be installed: http://gmt.soest.hawaii.edu/projects/gmt/wiki/Installing
This step is not required for the workflow synthesis, considering that the synthesis of conadidate workflows and their execution are 2 separate steps.

## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar GeoGMT/E[0|1]/ape.configuration
```
The results of the synthesis would be:

	GeoGMT/E[number]/sat_solutions.txt	-	First 100 candidate solutions in textual format
	GeoGMT/E[number]/Figures/		-	Data-flow figures corresponding to the first 10 solutions
	GeoGMT/E[number]/Implementations/	-	Executable shell scripts corresponding to the first 6 solutions


## References

<a id="1">[1]</a> 
Kasalica, V., & Lamprecht, A.-L. (2019). 
Workflow discovery through semantic constraints: A geovisualization case study. 
In Computational science and its applications – ICCSA 2019
(pp. 473–488), Springer International Publishing,
https://doi.org/10.1007/978-3-030-24302-9_53
