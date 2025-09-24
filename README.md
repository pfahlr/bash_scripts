```asciiart
\    /
 \  /
__\/___________________________________________________________________
|#####################################################################|
|##                                                                 ##|
|##                                                                 ##|
|##                                                                 ##|
|##    |========================================================    ##|
|##    |///////////////////////////////////////////////////////|    ##|
|##    |\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|    ##|
|##    |//////// \\///////// \\/////// \\/// \\/// \/// \\\\\\\|    ##|
|##    |/// \\/// \/// \\\\\\\/// \\/// \/// \\/// \/// \\\\\\\|    ##|
|##    |//////// \\/////// \\\///////// \///////// \/// \\\\\\\|    ##|
|##    |/// \\\\\\\/// \\\\\\\/// \\/// \/// \\/// \/// \\\\\\\|    ##|
|##    |/// \\\\\\\/// \\\\\\\/// \\/// \/// \\/// \///////// \|    ##|
|##    |\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\|    ##|
|##    |///2025 Rick Pfahl\<pfahlr@gmail.com>//////////////////|    ##|
|##    |========================================================    ##|
|##                                                                 ##|
|##      BASH/PYTHON SCRIPTS COLLECTION -                           ##|
|##      PRIMARILY CLI TEXT MANIPULATION THINGS THAT                ##|
|##      MIGHT SAVE YOU TIME...                                     ##|
|##                                                                 ##|
|##      2025 Rick Pfahl <pfahlr@gmail.com>                         ##|
|##                                                                 ##|
|##                                                                 ##|
|#####################################################################|
|##O#O################################################################|
=======================================================================
   /\                                                             /\
```

# CLI Scripts Collection


This is my collection of bash, python, and other such scripts for making my daily use of the command line easier. Maybe someone else will find them useful, maybe I'll just be able to keep track of them better. At any rate, I'm VCing them now, as I never VC any of my personal projects and that's a kinda shit habit I'm trying to break.


## Variables 
Some of these scripts make use of service endpoints and require authentication tokens. Obviously, I haven't included mine here, but I will list and identify them in the file [TOKENS.md](TOKENS.md) The expectation is that the user will create a file such as `.tokens` in their home directory and source this file from their `.profile`, `.zshrc`, `.bashrc`, or whichever one they use. The file should go something like

```
#!/bin/bash
export SOMESERVICETOKEN=abcdefghijklmnop
export ANOTHERSERVICETOKEN=qrstuvwxyz
export SOMEOTHERSERVICETOKEN=abcdef123456
```

TOKENS.md will contain a list like

```
SOMESERVICETOKEN    https://someservice.com/
ANOTHERSEVICETOKEN  https://anotherservice.com/
SOMEOTHERSERVICE    https://someotherservice.com
```

