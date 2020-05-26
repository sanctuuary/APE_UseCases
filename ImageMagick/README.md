# ImageMagick: Tutorial

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer) in an easy and understandable way.

The use case aims to demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem with ImageMagick, an open-source software suite for displaying, creating, converting and modifying images.

## Installation
In order to run the synthesis APE-&lt;version>.jar needs to be available: https://github.com/sanctuuary/APE. Furthermore, in order to be able to execute the generated workflows on the machine, the tools have to be annotated accordingly, and the cooresponding software should be available.

## Run
In order to execute the synthesis it would be sufficient to provide the APE-&lt;version>.jar in the main .APE_UseCases directory and run the following command:

```shell
 java -jar APE-<version>.jar ImageMagick/Example1/config.json
```

## Taxonomy
![](images/ImageMagick_Taxonomy.png)

## Configuration
|Tag                        |Description                                                                                                                                                                                          |Default|
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------|
|ontology_path              |path to the taxonomy file  (provided demo example taxonomy.owl)                                                                                                                                      |       |
|toolsTaxonomyRoot          |name of the root tool class                                                                                                                                                                          |       |
|dataTaxonomyRoot           |name of the root data taxonomy class                                                                                                                                                                 |       |
|dataSubTaxonomyRoot[]      |list of sub roots within the data taxonomy, each sub root represents data dimension (e.g. data format, data type, etc.)                                                                              |       |
|tool_annotations_path      |path to the JSON file that contains basic tool annotation (provided demo example tool_annotations.json)                                                                                              |       |
|constraints_path           |path to the JSON file containing constraints representing workflow specification (optional)                                                                                                          |       |
|shared_memory              |true in a case of shared, memory structure, false if the message passing structure should be used                                                                                                    |       |
|solutions_path             |path to the file where the workflow solutions will be written                                                                                                                                        |       |
|solution_min_length        |minimum length from which solutions should be searched                                                                                                                                               |1      |
|solution_max_length        |maximum length to which solutions should be searched, put 0 in case of no limit                                                                                                                      |       |
|max_solutions              |max number of solutions that would be returned                                                                                                                                                       |       |
|execution_scripts_folder   |folder where the executable scripts will be generated                                                                                                                                                |       |
|number_of_execution_scripts|number of executable scripts that will be generated                                                                                                                                                  |       |
|solution_graphs_folder     |folder where the graphical representation of the workflows will be generated                                                                                                                         |       |
|number_of_generated_graphs |number of workflow figures that will be generated                                                                                                                                                    |       |
|inputs []                  |each input represent a single instance that will be an input to the program                                                                                                                          |       |
|inputs[]/{}                |each of the inputs can be described using the terms from data taxonomy, the tags used (in our example "TypesTaxonomy" reflects the corresponding taxonomy sub root                                   |       |
|outputs	[]                 |each output represent a single instance that will be an output of the program                                                                                                                        |       |
|outputs[]/{}               |each of the inputs can be described using the terms from data taxonomy, the tags used (in our example "TypesTaxonomy" reflects the corresponding taxonomy sub root                                   |       |
|debug_mode                 |true for debug command line output                                                                                                                                                                   |FALSE  |
|use_workflow_input         |ALL' if all the workflow inputs have to be used, 'ONE' if one of the workflow inputs should be used or 'NONE' if none of the workflow inputs has to be used (default value is ALL)                   |ALL    |
|use_all_generated_data     |ALL' if all the generated data has to be used, 'ONE' if one of the data instances that are generated as output, per tool, has to be used or 'NONE' if none of the data instances is obligatory to use|ONE    |

