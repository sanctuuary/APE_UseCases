# ImageMagick: Replacing a color [Example 2]

In this example we will try to replace the `Color` red by the `Color` blue. Using our foreknowledge about images we assume there must be some kind of filtering involved, so we add the constraint to use a type `Filter` in the workflow solution.

After generating multiple workflows we notice that our provided `Colors` are all being used to add borders to our image, so we add a constraint to make sure that `Border` tools are not allowed in the workflow solution.

### For more information please visit [our page](https://ape-framework.readthedocs.io/en/latest/docs/demo/imagemagick/imagemagick.html#example-2).
