# zCCM_fw

`git clone --recursive git@github.com:awhitbeck/zCCM_fw.git` 

`cd firmware/target/test_kv260`
`make`

The bit stream and the `.xsa` file will be put into the `images` directory
once the project is built.  To generate linux and all of the necessary
applications, run `source CreatePetalinuxProject.sh <xsa>` passing the
path to your `.xsa` file. The build products from petalinux will be
tar'ed and copied into images.  