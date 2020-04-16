# Dump.zip
Simple, light-weight Batch script that dumps contents of one MySQL database into another

Dump is a Batch script that allows developers to quickly dump the contents of one mysql database into another.

## Installation proces:

- Download 'Dump.zip' and unzip it.
- Enter the 'bin' folder and copy its directory path
- Open start menu and search for 'configuration' > System and Security > System > Advanced System Settings > Environment Variables
- Double click on the 'Path' entry
- Select 'New'
- Paste the directory path pointing towards the bin folder of Dump.zip
- Check whether an entry is specified that points towards your MySQL folder. If not, locate it and add its directory to the environment variables as well.

You're all set! Make sure you having a working MySQL connection, and use-password is set to none.

## Manual:

When you have succesfully installed Dump, you are now able to apply it from the command line. The structure is incredibly simple. First, enter the 'dump' command, followed by the name of the Database of which you want to dump its contents, ended by the name of the Database you want to import the Dump into. Here's a quick example:

Dump database_production database_development


~ Ryan Wennekes 2020

