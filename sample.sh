
echo ./onvif.sh -h 127.0.0.1 -p 1000 -a GetSystemDateAndTime -u test -P test
# ./onvif.sh -h 127.0.0.1 -p 1000 -a GetSystemDateAndTime -u test -P test

echo ./onvif.sh -h 127.0.0.1 -p 1000 -a GetServiceCapabilities -u test -P test
# ./onvif.sh -h 127.0.0.1 -p 1000 -a GetServiceCapabilities -u test -P test

echo ./onvif.sh -h 127.0.0.1 -p 1000 -a GetProfiles -u test -P test
# ./onvif.sh -h 127.0.0.1 -p 1000 -a GetProfiles -u test -P test

echo ./onvif.sh -h 127.0.0.1 -p 1000 -a AbsoluteMove -u test -P test --PROFILE_TOKEN RTS --POSITION_X 2 --POSITION_Y 0 --ZOOM_X 0
# ./onvif.sh -h 127.0.0.1 -p 1000 -a AbsoluteMove -u test -P test --PROFILE_TOKEN RTS --POSITION_X 2 --POSITION_Y 0 --ZOOM_X 0