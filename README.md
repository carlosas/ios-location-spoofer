# GPS Location Spoofer for iOS

Simple app to simulate locations from Xcode via GPX files.

## How to Use

1. Open the project in Xcode
2. Connect your iPhone
3. Run the app from Xcode
4. Go to **Debug > Simulate Location** and select a GPX file
🎊. Your iPhone now reports to be in that location

## Create a Custom GPX

```xml
<?xml version="1.0"?>
<gpx version="1.1" creator="Xcode">
    <wpt lat="YOUR_LATITUDE" lon="YOUR_LONGITUDE">
        <name>My Location</name>
    </wpt>
</gpx>
```

## Requirements

- iOS 16.6+
- Xcode 14+
- Device connected to Xcode (required to spoof location)
