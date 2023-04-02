
This is a small package that allows you to retrieve text (text only) from .docx files (Microsoft Word).  

Thanks [SnowLukin](https://github.com/SnowLukin)

## Usage

```dart
import 'package:docx_to_text/docx_to_text.dart';

final file = File('path/to/file.docx');
final bytes = await file.readAsBytes();
final text = docxToText(bytes);
```

## Additional information

If there is anything you want to improve or fix, pool requesters are welcome.
