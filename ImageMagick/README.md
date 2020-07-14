# APE Tutorial (using [ImageMagic](https://imagemagick.org/index.php) tools)

This is a project used to demonstrate the sysnthesis functionality provided by APE (the Automated Pipeline Explorer).

The use case aims to describe the domain knowledge that has to be provided, comprising [Domain ontology](#domain-ontology) and [Tool annotations](#tool-annotation). In addition it will demonstrate the usefulness of the synthesis approach for solving a workflow discovery problem with [ImageMagic](https://imagemagick.org/index.php), an open-source software suite for displaying, creating, converting and modifying images.

For more info on installation see [APE](https://github.com/sanctuuary/APE).dana

## Domain Ontology
Domain ontology consists of taxonomic classifications of the data and operations in the application domain, and provides a controlled  vocabulary  that  allows  for  different  abstraction  levels  of  its  elements. The current use case [ontology](imagemagick_taxonomy.owl) contains the following structure:
- **thing** (root class in the OWL file)
  - **Tool** (name provided as modulesTaxonomyRoot in config file)
  - **Data** (usage of this class is optional)
     -  **Type** (name provided under **dataDimensionsTaxonomyRoots** in config file)
     - **Format** (name provided under **dataDimensionsTaxonomyRoots** in config file)
where the **Tool** represents the root of the operations taxonomy, and the **Type** and **Format**, represent roots of taxonomies that classify types and formats of data, respectively. The class **Data** can be ommited, considering that it is ignored by APE library, however it was part of the doman classification and we decided to keep it. 

APE loads the [domain ontology](imagemagick_taxonomy.owl) from a file in Web Ontology Language (OWL) format. Note that the the annotated tools (provided in the [tool annotations](#tool-annotation)) are included in the image below as blue leafs, although they are not part in the OWL file.

![](images/ImageMagick_Taxonomy.png)

## Tool Annotation
Tool annotation is a collection of tools that have been semantically annotated, according to their inputs and outputs, based on the terms from the ontology. Here is an example for the annotated tool `compress`, which takes as input an `Image` (Type) of any `Format` and outputs an Image in the JPG format.

```json
{
        "label": "compress",
        "id": "compress",
        "taxonomyOperations": ["Conversion"],
        "inputs": [
          { "Type": ["Image"] }
        ],
        "outputs": [
          { "Type": ["Image"], "Format": ["JPG"] }
        ],
        "implementation": { 
           "code": "@output[0]='@output[0].jpg'\n
                    convert $@input[0] $@output[0]\n" 
           }
}
```

### Referencing the Domain Ontology
The the example above, the tool annotation references the abstract class `Conversion` from our domain ontology by specifying the `taxonomyOperations` tag.
A reference to a class (or a set of classes) in the domain ontology must be in array format. This array represents a conjunction of classes from the ontology. For example, given the ontology below. Specifying `["A", "B"]` as input for your tool makes sure only inputs of type `D` and `F` are allowed.

![](images/TypesTaxonomy.png)

### Tool Implementation
The code specified in the tool annotation could be used to constuct a script that executes the workflow.
APE keeps track of the naming of the in- and output variables from tools. `@output[0]` references to the variable name of the first input type specified in the `"inputs"` tag.

For example, implementing this piece of code for a tool called `add`:
```json
"implementation": {
   "code": "@output[0] = $@input[0] + $@input[1]"
   }
```
could result in the script:
```text
node003 = $node001 + $node002
```

### Examples
The run of the synthesis is explained on the following two examples:
- [Example 1: Creating a postcard](/Example1)
- [Example 2: Repacing a color](/Example2)
