# Cataclysm: Bright Nights Tilesets

This is an unofficial master tileset repository for Cataclysm: Bright Nights. It contains tools and components you need to build your own fully functional tilesets. Currently only a few tilesets are supported but that should change in the future.

## Building tilesets

Tilesets are built using Python scripts to automate the process. You can still stich tile sprites manually using image editing software but that is not recommended. 

### Prerequisites

Before building the tilesets you need the following:

- [Python 3](https://www.python.org/downloads/)

- [libvips](https://github.com/libvips/libvips/releases) 

When running the script you might get `error 0x7f` on Windows. Make sure you've installed Python from the official website and not using the Microsoft Store. If you have not used MS Store you should still check that the `PATH` variable is not configured to read Python executable from the MS Store. Read [here](https://stackoverflow.com/a/58773979) for more information.

Another solution to this problem is to use the `w64 static` version of libvips. It is unclear exactly what causes this issue but using the mentioned version seems to resolve it. See [here](https://github.com/libvips/libvips/issues/2479) for more information on this issue.

### Composing

The `compose.py` script reads `tile_info.json` to find information about tile sprites definitions and then combines tile maps into sprite atlas files which are used by the game to render the environment.

Command syntax to build the tileset

```
$ python tools/compose.py <tileset_path> [<output_dir>]
```

For example here is how we would build UltimateCataclysm tileset:

```
$ python tools/compose.py gfx/UltimateCataclysm
```

Once executed the script will take a short time to complete building the tileset. Do not get alarmed if you don't see any output in the terminal, the script is just too busy to speak with you. Once finished you will find atlas files in the designated output directory. Read more on what to do with these files in #distribution section.

Note that the output directory is an optional argument that is useful when you are assembling a tileset distribution and you want to move everything you need to distribute the tileset to one place.

## Distribution

In addition to the composed atlas files the following files need to be included in the distribution in order for the tileset to be recognized and properly render by the game:

- `tile_config.json` - information about how to render tiles.

- `tileset.txt` - metadata file that contains tileset information.

Once you have all needed files in once place create a new directory with the same name as the tileset you are building and move the files inside. Final step is to package the directory using your favorite archiver program such as zip or 7zip. Now your tileset is ready to be shared with the world!

## Contributing

Everyone is encouraged to contribute to the project. 

- If you have questions or requests feel free to open a [new issue](https://github.com/matshou/CBN-Tilesets/issues/new). 
- If you want to submit tile changes or new tiles; fork the project, commit your changes and make a pull request.

## License

Cataclysm: Bright Nights and all tilesets released with the game are the result of contributions from volunteers under the Creative Commons Attribution ShareAlike 3.0 license. The code and content of the game is free to use, modify, and redistribute for any purpose whatsoever. See [Creative Commons](http://creativecommons.org/licenses/by-sa/3.0/) for details. Some code distributed with the project is not part of the project and is released under different software licenses, the files covered by different software licenses have their own license notices.
