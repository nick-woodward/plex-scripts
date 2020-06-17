**THIS NEEDS MORE WORK TO MAKE IT MORE RESILIENT, JUST POSTING THIS TO ENSURE I DON'T LOSE IT**

### Plex Scripts

> A collection of scripts built to improve putting files on Plex.

#### Requirements

- Handbrake CLI

#### Usage

```sh
$ ./transcode-folder my-video-file.mp4 -o ./some-directory/
$ ./transcode-folder -i "/home/nick/Plex/" -o "/media/nick/cfd76fb6-c538-4b47-a1a9-74bf469c5b78"
```

#### TODO

- Directory / File Lookups should be more resilient.