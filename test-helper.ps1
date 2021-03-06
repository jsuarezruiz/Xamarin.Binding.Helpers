New-Item -ItemType Directory -Path .\logs\ -Force
New-Item -ItemType Directory -Path .\output\ -Force

& msbuild /r /t:Rebuild .\Xamarin.Binding.Helpers\Xamarin.Binding.Helpers.csproj /bl:logs\xbh.binlog

Remove-Item .\Samples\packages\xamarin.binding.helpers -Force -Recurse

# Run restore/rebuilds
& msbuild /r /t:Rebuild .\Samples\SampleAndroidBinding\SampleAndroidBinding.csproj /bl:logs\android.binlog
& msbuild /t:Pack .\Samples\SampleAndroidBinding\SampleAndroidBinding.csproj /bl:logs\android-pack.binlog

& msbuild /r /t:Rebuild .\Samples\SampleAndroidApp\SampleAndroidApp.csproj /bl:logs\android-app.binlog

