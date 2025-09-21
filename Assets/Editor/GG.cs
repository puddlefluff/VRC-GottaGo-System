using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class GG: EditorWindow {
  [MenuItem("Tools/GottaGo")]
  public static void showEditor() {
    var view = GetWindow<GG>();
    view.titleContent = new GUIContent("GottaGo Configurator");
  }


}