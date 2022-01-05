## Part 4: Hierarchy, Graphics and documentation

In Part 4 you will learn how to use the Hierarchy View. You will also learn how to use and export Graphics and Documentation with Sigasi Studio.

### Hierarchy View

* Import project `part4` (and close unrelated projects)
* Open `testbench.vhd`
* Right click the `STR` architecture and select **Set as Top Level**
* Explore the resulting tree in the Hierarchy View:
  * Inspect the value of generics (Notice how the value in `dut_instance` differs from its default value)
  * Change the value of a generic and note how the Hierarchy View refreshes when you save the file.
  * Add a syntax error in a file and note that Sigasi Studio is able to recover and still show valid content in the Hierarchy View.
  * Disable the **Toggle Hierarchy Auto Refresh** button, and note Sigasi Studio no longer auto-updates the hierarchy when edit your files. (This is useful for big hierarchies)

### Block Diagram View

* Open `testbench.vhd`
* Right click the VHDL editor and select **Show in > Block Diagram**
* Double click ports or connections to navigate to the corresponding VHDL code. (This also works the other way around by clicking **Show in > Block Diagram** on ports in the VHDL code)
* Make some changes in the VHDL code and note how the Block Diagram updates when you save your file.
* Select `dut_instance` in the diagram, right click and select **Open Entity Declaration** to navigate to the corresponding entity, `dut`.
* Click the save icon 💾, and export the diagram to a PNG or SVG file.

### State Machine View

* Click **Window > Show View > State Machines** to open the State Machine view
* Open `dut.vhd`
* Double click on a few nodes and transitions in to navigate to the corresponding VHDL code.
* Change the VHDL code of the state machine and notice how the view updates (See the TODO tag)
* Add a comment to the `when idle: state := preparing;` transition. For example: `-- start preparing`  
  Notice how the transition labels update
* Toggle the (Aa)-button to show/hide the transition labels.
* Click the save icon 💾 to export the diagram to file.

### Graphics Configuration

* Open `testbench.vhd`
* In the Block Diagram View, press the **Group all wires between blocks** button. This button creates a new Graphics Configuration file that groups all wires between blocks, except for clock and reset lines.
* You can change the name of the new bus and control the wires that are grouped by it.
* In the new blockdiagram file, define a grouped block by adding `def block group tbcontrol (identifiers)`. Note that you can use the autocomplete to avoid having to type the identifiers. Create a group *tbcontrol* that contains the instances of the *clock_generator* and the *stimgen*.
* Give a color to the *dut* instance by adding `block dut_instance { color COLOR}`.
* Also give the *stimgen* or *clock_generator* blocks a color. Note that these need to be accessed differently because of the group they are in. Remember the auto-complete for help.
* Hide the details in *tbcontrol* by collapsing this group. Use `block tbcontrol { collapse}`.
* Navigation: note that you can also navigate from the identifiers in the blockdiagram file to the HDL code.
* Edit the HDL code, e.g. by modifying the label of an instantiation, and note that this will cause errors in the blockdiagram file.
* Documentation and more examples for Graphics Configuration can be found on <https://insights.sigasi.com/manual/graphics.html>

### Documentation

* Import project `Sigasi_doc`
* Open the Documentation View
* Open file `testbench.vhd`
* Edit comments and note how the documentation is updated:
  * Document a port (by adding a comment)
  * Document a generic
  * Document an architecture
  * Document an entity
* Experiment with Markdown
  * Paragraphs and line breaks
  * *emphasis* and **strong**
  * lists and tables
  * external links and email addresses
* Export PDF
  * Explore the generated files in the *sigasi-doc* folder
  * Inspect the DocBook file

### Net search

* In `stimgen.vhd` (Project `part4`)
  * Select a the port `stim_data`
  * **Right-Click > Find Net**
  * Review the result in the **Net Search View**
  * Perform a net search on `clk`
* In `testbench.vhd`
  * Find the instantiation for `stimgen`
  * Perform a net search on `stim_data`

### Optional Extra tasks

* State Machine View: Add a second state machine in `dut.vhd` and note how it appears in the State Machine View.
* Graphics Configuration: use a regex to group some of the signals in the blockdiagram file instead of listing all wire names.
* Add a Graphics Configuration file for the state machine in `dut.vhd`.
* Finish the documentation of the Project to get a clean and complete PDF.
