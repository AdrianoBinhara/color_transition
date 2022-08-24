# Color Interpolate

Color Interpolate is a Flutter package for transitioning between PageView pages with color interpolation

## Installation

Add the package to your pubspack.yaml file as shown bellow

```bash
dependencies:
  flutter:
    sdk: flutter
  color_interpolate: 0.0.1
```


## Usage
You need to provide the ColorTransition widget a list of widgets, and the respective colors you want to interpolate
```dart
import color_transition;

ColorInterpolate(
      listOfWidgets: [
        Center(child: Text('1')),
        Center(child: Text('2')),
        Center(child: Text('3')),
        Center(child: Text('4')),
        Center(child: Text('5')),
      ],
      Colors: [0xFFFEB5E9, 0xFFCEE59B, 0xFFFAED7B, 0XFF9BE1E5, 0xFFE59B9B],
    ));
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)