# ONVIF BASH scripts
## Description
Generating and executing [ONVIF](https://[link](https://www.onvif.org/)) SOAP requests from templates Using set of bash scripting tricks, sed, curl and other tools.

## Samples
    host=127.0.0.1
    port=80
    user=admin
    pass=1234567890

    ## Add -v to view action result XML
    #./onvif.sh -v -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FUp
    ## Add -vv to view request XML
    #./onvif.sh -vv -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FUp
    ## Add -vv and -v to view request and result XML
    #./onvif.sh -v -vv -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FUp

    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FUp           # Full Top
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FDown         # Full Down
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FLeft         # Full Left
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a FRight        # Full Right

    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a TopLeft       # Top Left Corner
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a TopRight      # Top Right Corner
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a BottomLeft    # Bottom Left Corner
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a BottomRight   # Top Right Corner

    ## Available parameters
    ##      --X_SPEED (Left/Right movement speed 0.0 ~ 1.0) default is 0.1
    ##      --x_delay (Left/Right stop command delay) default is 1
    ##      --Y_SPEED (Up/Down movement speed 0.0 ~ 1.0) default is 0.1
    ##      --y_delay (Up/Down stop command delay) default is 1
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a MoveLeft      # Move abit Left
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a MoveRight     # Move abit Right
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a MoveUp        # Move abit Up
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a MoveDown      # Move abit Down
    ## Aditianly you can set wait time bu setting --grace (default is --grace 10)
    ./onvif.sh -h $host -p $port -u $user -P $pass --PROFILE_TOKEN MainStream -a Center        # Move Center
