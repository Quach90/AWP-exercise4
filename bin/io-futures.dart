import "dart:io";
import "dart:async";

String PROPERTIES_PATH = "tmp/local.properties";

main() {
  incrementVersion().catchError(handleError);
}

incrementVersion() async {
  File file = new File(PROPERTIES_PATH);
  
  if(await file.exists()){
    file.writeAsString("version=" + ((int.parse((await file.readAsString()).split("=").last))+1).toString());
  }
  else {
    (await file.create(recursive: true)).writeAsString("version=1");
  }
}

/**
 * Called if file creation is not recursive, and the tmp folder does not exists.
 */
void handleError(Exception e) {
  print("Woops! $e");
}