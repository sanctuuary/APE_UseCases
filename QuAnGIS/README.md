# QuAnGIS

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem in GIS. The scenario was demonstrated in [[1]][Scheider2020] and [[2]][Kruiger2020].
	**Question1** use case describes the 

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.
## Run

In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar QuAnGIS/Question1/config.json
```
The results of the synthesis would be:

	QuAnGIS/Question1/results/sat_solutions.txt	-	First X candidate solutions in textual format
	QuAnGIS/Question1/results/Figures/		-	Data-flow figures corresponding to the first X solutions


[Scheider2020]: http://josis.org/index.php/josis/article/view/555 "Ontology of core concept data types for answering geo-analytical questions."
[Kruiger2020]: https://onlinelibrary.wiley.com/doi/full/10.1111/tgis.12692 "Loose programming of GIS workflows with geo-analytical concepts."


