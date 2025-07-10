allprojects {
    repositories {
        google()
        mavenCentral()
        // flatDir {
        //     dirs(File(rootDir.parentFile, "UnityExport/unityLibrary/libs"))
        // }
    }
}

val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

// ✅ Consolidado en un solo bloque subprojects
subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    buildDir = newSubprojectBuildDir.asFile

    evaluationDependsOn(":app")

}
