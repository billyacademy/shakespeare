Coding Challenge

The object of this coding challenge was to parse an XML document containing the Shakespeare play, The Tragedy of Julius Caesar.

- The root path is a list of all plays
- Clicking on a play will navigate you to a table showing you a number of statistics for each role
  - Each record has the name of a role, the number of lines spoken, longest speech (based on number of lines in the speech), number of scenes the role appears in and the percentage of scenes the role appears in.
  - Each column is sortable, ascending and descending if the column header is clicked.
    - The sort is done with ajax and jQuery so that the entire page is not loaded each sort.

I assumed that the files would only be added by the owner of the application and therefore did not include a user option to upload xml files

To add a play to the database the owner can simply go into the rails console and run the ImportXML
  - ie. ImportXML.import_play('julius_caesar.xml'), having the xml file in the root directory for the application.


Some notes:

- Opted to use a database to store all of the xml data
  - Might be more clear to navigate a database with 100 plays, over a hash.
- The ImportXML model class is something that can be improved and refactored
  - A lot of SQL queries are being run, probably not great for scaling
- Did limited testing, might be worth revisiting to test all units and add more feature testing to assure that sorts are working for the end user.
