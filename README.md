# A simple streamer for Raspberry Pi

Use a raspberry pi (with a camera module) to stream video to the world.

## Getting started.

* Clone this repo.
* Connect camera module to raspberry pi.
* Enable camera support on the pi:
  ```sh
  sudo raspi-config
  ```
  Go to:
  Interfaces -> Enable camera support
  
  Expand Filesystem. Optional.

* Install ffmpeg
  ```sh
  sudo apt-get update
  sudo apt install ffmpeg
  ```

* Finally, reboot the pi.
  ```sh
  sudo reboot
  ```

## Configuration

Open the `camera_info` file and enter the information for your streaming service.

```sh
nano camera_info
```

## Streaming

Run `stream.sh` - `stream-legacy.sh` if you are using the legacy camera support.

```sh
# Run the script to begin streaming
./stream.sh
```