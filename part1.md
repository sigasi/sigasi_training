## Part 1: HDL files

The goal of the first part is to get comfortable with the Sigasi Studio HDL editor. By the end you will be able to _easily detect and fix HDL syntax issues_, _customize editor preferences_ and _know the basic keyboard shortcuts_.

### Setup
* Open the Sigasi application
* In the status bar the status of the Sigasi license is shown
  * If you have a commercial license it should indicate **Sigasi Studio Creator**, **Sigasi Studio XL** or **Sigasi Studio XPRT**
* Import project `Part1`
  1. **File > Import...**
  2. **General > Existing project into Workspace**, **Next**
  3. **Browse** to `Part1`
  5. **Finish**
* Close unrelated projects (Right Click on the project in Project Explorer and select **Close Unrelated Projects**)

### Edit

* Open file `part1_1_edit.vhd` in the _Project Explorer_ view
* Make the editor _full screen_ (Double click on the tab)
* Double click again to exit _full screen_ mode
* Format the VHDL code (**Ctrl+Shift+F**, _Make sure that no text is selected_)
* Undo (**Ctrl+Z**) your previous change to correct a mistake
* Redo (**Ctrl+Shift+Z**) to restore a change that was undone
* Fix all VHDL syntax issues, use the QuickFix where possible (When in doubt, **Hover** over the error Marker)
* Delete a line with **Ctrl+D**
* Comment a line with **Ctrl+/**
* Move a line up and down with **Alt+Up** and **Alt+Down**
* Jump to the next error using **Ctrl+.**
* Autocomplete (**Ctrl+Space**)
    * Signal Name
    * Constant declaration
    * `if` statement in a `process` (Use **tab** to jump to the next field, use **enter** to exit the _template mode_)
    * `if generate` in an `architecture`
* Block select (**Shift+Alt+A**, or button in toolbar)
    * Delete a Block
    * Add content on multiple lines
* Enable _Show whitespace_ (¶-button) and type some _tabs_ and _spaces_ to see the difference
* Find & Replace  
    * Experiment with **Ctrl+F**, e.g. find all `TODO`'s
    * Use **Ctrl+K** to find the next occurrence of the current selection
    * Use **Ctrl+J** (and start typing) for an inline, incremental search. _Look at the status bar to see what you have already typed_.
* Use **Quick Access** (top-right text field or **Ctrl+3**) to convert an identifier to UpperCase (Select the identifier, type `upper` in the Quick Access Field in the Toolbar and confirm with **Enter**)
* Mess up the indentation of a part of the source code, select it and **format only the selection**
* Save all changes to your file (**Ctrl+S**)

### Navigate

* Open file `part1_2_navigate.vhd`
* Go to Declaration can be done in various ways (Hover, Right-clik Menu, **F3**)
* Move back to last location (**Alt+Left**)
* Move forward to your original location (**Alt+Right**)
* Go to Line  (**Ctrl+L**)
* Navigate to errors with the gutter (Click red rectangles in scroll bar)
* Navigate to next problem marker (**Ctrl+.**, *Ctrl-key and dot-key*)
* Navigate with the *Outline view* (**Ctrl+O**)

### Customize settings

Preferences can be set via **Window > Preferences**.

* Open file `part1_3_custom.vhd`
* Switch to VHDL 2008 (**Preferences > Sigasi > VHDL**) and note that the syntax error get resolved
* After switching VHDL versions, the _Common Libraries_ need to be reset (Use the _Quick Fix_ offered on the first line of the file)
* Tabs or spaces ( Use the search box in the preference dialog and type `tab`) Use _Show whitespace_ to check.
* Uppercase keywords (**Preferences > Sigasi > VHDL > Formatting**) (Use _format_ to check)
* Add a keyboard shortcut for _Show whitespace_.
* Reset the keywords formatting to your preference (uppercase, lowercase or ignore)

### Optional Extra tasks

* Open file `part1_4_extra.vhd`
* Try *structured select* using **Shift+Alt+cursor** <https://insights.sigasi.com/manual/editor.html#structured-selection>
* *Stuttering* (in the editor, double tap the `.`, `;` or `,` key)
* Drag and drop a file from your file explorer in the Editor part of Sigasi Studio
* Create a new file  (**File > New > VHDL File** or right click on project or folder)
* In **Outline** and **Project Explorer**: Figure out what *Link with editor* button (⇆) does
* Add a keyboard shortcut preference for _show whitespace_ (Search for the **Keys** preference page)
* Use the eclipse file search (**Search > Search...**) to do a textual search/replace in you entire project or workspace.


