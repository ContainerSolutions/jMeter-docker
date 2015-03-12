## OS X
1. XQuartz must be installed
1. XQuartz must listen on TCP, do so with `defaults write org.macosforge.xquartz.X11 nolisten_tcp -boolean false`
1. XQuartz must be open. Open with `open -a xquartz`
1. X server must be accesible to localhost: `xhost +localhost`
1. run with `docker run -e DISPLAY=10.0.2.2:0.0 containersol/jmeter`

## Linux
You should pass the x11 socket:

    docker run \
      -v /tmp/.X11-unix:/tmp/.X11-unix \ # mount the X11 socket
      -e DISPLAY=unix$DISPLAY \ # pass the display
      containersol/jmeter
