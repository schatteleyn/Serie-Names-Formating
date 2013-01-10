Serie Names Formatting
======================

Little script in Ruby to format the title of the files of your series.
The script will ask you for the name of the serie and the directory of it, and will then rename the files.
The recursive.rb file allows you to format a whole directory of directories. But for now, you can only have one directory of depth.  
More clearly:
You put recursive.rb in your Serie directory.
If you have Serie/Doctor Who, Serie/Firefly, Serie/Games Of Throne, it will works without problems.  
If you have Serie/Doctor Who/Season 1, Serie/Doctor Who/Season 2 etc etc, it will fail after the Season 1.  

I have to fix that.

## Format  ##
+ S01E01/s01e01
+ S01E23-24 (and other separators)
+ 01x01

## TO-DO: ##
+ Make it works with more than one directory of depth
