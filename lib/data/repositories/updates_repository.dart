import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:material_palette/data/constants.dart';
import 'package:http/http.dart' as http;
import 'package:material_palette/locale.dart';

class UpdatesRepository {

  static const String currentDartPackageVersion = '${Constants.appVersion}+${Constants.appBuild}';

  static const String latestReleaseUrl = 'https://api.github.com/repos/NEK-RA/flutter_material_palette/releases/latest';

  static Future<Update> checkUpdates(BuildContext context) async {
    http.Response response = await http.get(Uri.parse(latestReleaseUrl));
    Update info;
    if(response.statusCode == 200){
      info = _processResponse(response, context);
    }else{
      info = UpdateError(status: '${response.statusCode} - ${response.reasonPhrase}', message: S.of(context).unexpectedReponseString, body: response.body);
    }
    if(info is GithubUpdate){
      if(!_isUpdate(info.version)){
        info = UpdateNotNeeded();
      }
    }

    return info;
  }

  static Update _processResponse(http.Response response, BuildContext context){
    // single release in response is single JSON object
    if(response.body.startsWith('{') && response.body.endsWith('}')){
      Map<String, dynamic> parsed = jsonDecode(response.body);

      if(_validateReleaseMap(parsed)){
        return GithubUpdate(
          version: parsed['tag_name'],
          published: parsed['published_at'],
          isPreRelease: parsed['prerelease'],
          description: parsed['body'],
          url: parsed['html_url']
        );
      }else{
        return UpdateError(status: '${response.statusCode} - ${response.reasonPhrase}', message: S.of(context).requiredFieldsNotFoundString('tag_name, published_at, prerelease, body, html_url'), body: response.body);
      }

    } else {
      return UpdateError(status: '${response.statusCode} - ${response.reasonPhrase}', message: S.of(context).notLikeReleaseJsonString, body: response.body);
    }
  }

  static bool _validateReleaseMap(Map<String, dynamic> json){
    bool correct = true;
    // html_url needed to redirect user directly to release page
    if(!json.containsKey('html_url')){
      correct = false;
    }
    // tag_name contains version which will be compared with the current one
    if(!json.containsKey('tag_name')){
      correct = false;
    }
    // not necessary but may be used just to display in the release info
    if(!json.containsKey('prerelease')){
      correct = false;
    }
    // published_at will be displayed in the release info
    if(!json.containsKey('published_at')){
      correct = false;
    }
    // body will be displayed as description of update
    if(!json.containsKey('body')){
      correct = false;
    }
    return correct;
  }

  static bool _isUpdate(String version){
    Version current = Version.fromDartVersionString(currentDartPackageVersion);
    Version comparing = Version.fromDartVersionString(version);
    return comparing > current;
  }

}

abstract class Update {
  const Update();
}

class UpdateNotNeeded extends Update{}

class GithubUpdate extends Update {
  final String version;
  final String url;
  final bool isPreRelease;
  final String published;
  final String description;

  const GithubUpdate({
    required this.version,
    required this.published,
    required this.isPreRelease,
    required this.description,
    required this.url
  });

  @override
  String toString() => '\tGithubRelease: $version ${isPreRelease ? '(Pre-Release)':'' }\nPublished at: $published\nURL: $url\nDescription: $description';
}

class UpdateError extends Update {
  final String status;
  final String message;
  final String body;

  const UpdateError({
    required this.status,
    required this.message,
    required this.body
  });

  @override
  String toString() => '\tReleaseError:\nStatus: $status\nMessage: $message\nBody:\n$body';
}

class Version {
  final int major;
  final int minor;
  final int patch;
  final int build;

  const Version({
    required this.major,
    required this.minor,
    required this.patch,
    required this.build
  });

  factory Version.fromDartVersionString(String verstr){
    List<String> parts = verstr.split('+');
    List<String> version = parts[0].split('.');
    return Version(
      major: int.parse(version[0]),
      minor: int.parse(version[1]),
      patch: int.parse(version[2]),
      build: int.parse(parts[1])
    );
  }

  bool operator <(Version other) {
    return major < other.major 
      || major == other.major && minor < other.minor
      || major == other.major && minor == other.minor && patch < other.patch
      || major == other.major && minor == other.minor && patch == other.patch && build < other.build;
  }

  bool operator > (Version other) {
    return major > other.major 
      || major == other.major && minor > other.minor
      || major == other.major && minor == other.minor && patch > other.patch
      || major == other.major && minor == other.minor && patch == other.patch && build > other.build;
  }

  @override
  bool operator == (Object other){
    if(identical(this, other)){
      return true;
    }else{
      return other is Version && other.hashCode == hashCode;
    }
  }

  @override
  int get hashCode => major.hashCode ^ minor.hashCode ^ patch.hashCode ^ build.hashCode;

}