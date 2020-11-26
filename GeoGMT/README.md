

# A Geovisualization Case Study (using [GMT](https://www.generic-mapping-tools.org/ "GMT") tools)

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer). 

The use case aims to demonstrate the usefulness of the synthesis approach for solving a problem of map creation. The scenario was demonstrated in [[1]](#1), where the full workflows synthesis was accomplished in few incremental synthesis steps. Some of them are given here for demonstration:
- [**E0**](E0) use case describes the initial workflow sinthesys step, labeled as **E0** in the paper.
- [**E1**](E1) use case extends the initial workflow sinthesys step with additional constraints enforcing better map annotations.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. 

## Run

## Run APE from the command line
In order to use the APE library from the command line, simply run the `APE-<version>-executable.jar` file using command:


    java -jar APE-<version>-executable.jar [path_to_ape_configuration_file]
    
    
For more infomration please visit [https://ape-framework.readthedocs.io](https://ape-framework.readthedocs.io/en/latest/docs/demo/geo_gmt/geo_gmt.html)

## References

<a id="1">[1]</a> 
Kasalica, V., & Lamprecht, A.-L. (2019). 
Workflow discovery through semantic constraints: A geovisualization case study. 
In Computational science and its applications – ICCSA 2019
(pp. 473–488), Springer International Publishing,
https://doi.org/10.1007/978-3-030-24302-9_53
